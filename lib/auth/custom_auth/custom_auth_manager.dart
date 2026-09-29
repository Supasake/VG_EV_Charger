import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_auth_user_provider.dart';

export 'custom_auth_manager.dart';

const _kAuthTokenKey = '_auth_authentication_token_';
const _kRefreshTokenKey = '_auth_refresh_token_';
const _kTokenExpirationKey = '_auth_token_expiration_';
const _kUidKey = '_auth_uid_';

// Set while a sign out is in effect. Its presence makes any session values
// that survived the sign out unusable, so a failed cleanup cannot resurrect
// them on the next launch.
const _kSignedOutKey = '_auth_signed_out_';

class CustomAuthManager {
  // Auth session attributes
  String? authenticationToken;
  String? refreshToken;
  DateTime? tokenExpiration;
  // User attributes
  String? uid;

  Future signOut() async {
    // Record the sign out before changing anything else. Once this marker is
    // stored, initialize() refuses to restore the session on the next launch,
    // so the sign out cannot be undone even if clearing the stored values
    // below fails. If the marker cannot be stored we have not touched the
    // in-memory session or the user stream yet, so nothing is left
    // half-signed-out: the caller is simply told the sign out did not happen.
    final markError = await _recordSignedOut();
    if (markError != null) {
      throw StateError(
        'Sign out could not be recorded, so you are still signed in: $markError',
      );
    }

    authenticationToken = null;
    refreshToken = null;
    tokenExpiration = null;
    uid = null;

    // Update the current user.
    ev2AuthUserSubject.add(
      Ev2AuthUser(loggedIn: false),
    );
    // Clearing the stored values is best effort from here: the marker has
    // already made the session unusable, so a failure only leaves inert data
    // behind for the next launch to clean up.
    await _clearPersistedSession();
  }

  Future<Ev2AuthUser?> signIn({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
  }) async =>
      await _updateCurrentUser(
        authenticationToken: authenticationToken,
        refreshToken: refreshToken,
        tokenExpiration: tokenExpiration,
        authUid: authUid,
      );

  Future<void> updateAuthUserData({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
  }) async {
    assert(
      currentUser?.loggedIn ?? false,
      'User must be logged in to update auth user data.',
    );

    await _updateCurrentUser(
      authenticationToken: authenticationToken,
      refreshToken: refreshToken,
      tokenExpiration: tokenExpiration,
      authUid: authUid,
    );
  }

  Future<Ev2AuthUser?> _updateCurrentUser({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
  }) async {
    this.authenticationToken = authenticationToken;
    this.refreshToken = refreshToken;
    this.tokenExpiration = tokenExpiration;
    this.uid = authUid;

    // Update the current user stream.
    final updatedUser = Ev2AuthUser(
      loggedIn: true,
      uid: authUid,
    );
    ev2AuthUserSubject.add(updatedUser);
    await persistAuthData();
    return updatedUser;
  }

  late SharedPreferences _prefs;
  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();

    try {
      if (_prefs.getBool(_kSignedOutKey) ?? false) {
        // A previous sign out was recorded but may not have finished clearing
        // the stored session. Restore nothing, and retry the cleanup, which
        // removes the marker once it succeeds.
        await _clearPersistedSession();
        ev2AuthUserSubject.add(
          Ev2AuthUser(loggedIn: false),
        );
        return;
      }

      authenticationToken = _prefs.getString(_kAuthTokenKey);
      refreshToken = _prefs.getString(_kRefreshTokenKey);
      tokenExpiration = _prefs.getInt(_kTokenExpirationKey) != null
          ? DateTime.fromMillisecondsSinceEpoch(
              _prefs.getInt(_kTokenExpirationKey)!)
          : null;
      uid = _prefs.getString(_kUidKey);
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing auth: $e');
      }
      return;
    }

    final authTokenExists = authenticationToken != null;
    final tokenExpired =
        tokenExpiration != null && tokenExpiration!.isBefore(DateTime.now());
    final updatedUser = Ev2AuthUser(
      loggedIn: authTokenExists && !tokenExpired,
      uid: uid,
    );
    ev2AuthUserSubject.add(updatedUser);
  }

  /// Serializes persistence so that overlapping auth transitions -- a sign-out
  /// landing while a sign-in is still writing, for example -- cannot interleave
  /// their storage operations. Each transition's writes complete, in call
  /// order, before the next transition's begin.
  Future<void> _persistQueue = Future.value();

  /// Runs [task] after any persistence already in flight, returning the error
  /// it failed with, or null if it succeeded.
  ///
  /// This never completes with an error itself, so one failed transition
  /// cannot poison the queue for later ones; callers decide how to react.
  /// Signing in treats a failure as non-fatal -- the session is live in memory
  /// either way, and letting the error escape would abort the action flow that
  /// triggered it. Signing out treats a failure as terminal, because a session
  /// left behind on disk would be read back as valid on the next launch.
  Future<Object?> _enqueuePersistTask(Future<void> Function() task) {
    final pending = _persistQueue.then<Object?>((_) async {
      try {
        await task();
        return null;
      } catch (e) {
        if (kDebugMode) {
          print('Error persisting auth data: $e');
        }
        return e;
      }
    });
    _persistQueue = pending;
    return pending;
  }

  /// Removes [key], treating anything other than a confirmed removal as an
  /// error, and retrying a bounded number of times.
  ///
  /// Used for the credentials: one that outlives its own removal would be read
  /// back as a valid session on the next launch, so a removal that fails has
  /// to become a visible error rather than a silent one.
  ///
  /// The result of remove() is the only trustworthy signal here. Reading the
  /// key back would always report success: remove() drops the value from the
  /// in-memory preference cache synchronously, before -- and regardless of --
  /// the platform write, and containsKey()/getString() read that same cache.
  Future<void> _removeVerified(String key) async {
    Object? lastError;
    for (var attempt = 0; attempt < 3; attempt++) {
      if (attempt > 0) {
        // Back off briefly; a retry that fires immediately tends to hit the
        // same transient condition. Only ever reached on the failure path.
        await Future.delayed(Duration(milliseconds: 50 * attempt));
      }
      try {
        if (await _prefs.remove(key)) {
          return;
        }
        lastError = StateError('Removing $key reported failure.');
      } catch (e) {
        lastError = e;
      }
    }
    throw StateError('Could not remove $key: $lastError');
  }

  /// Stores the signed-out marker, retrying and reporting failure.
  ///
  /// Both setting and clearing the marker go through a write rather than a
  /// removal, because only a write answers "did this stick?" unambiguously.
  /// remove() forwards the platform result verbatim, so it cannot distinguish
  /// a key that was never there from one that would not go away, and
  /// containsKey() cannot stand in for that check: it reads the in-memory
  /// cache, which remove() clears whether or not the platform write landed.
  /// initialize() reads getBool(...) ?? false, so a stored false means exactly
  /// the same thing as an absent key.
  Future<void> _setSignedOutMarker(bool value) async {
    Object? lastError;
    for (var attempt = 0; attempt < 3; attempt++) {
      if (attempt > 0) {
        await Future.delayed(Duration(milliseconds: 50 * attempt));
      }
      try {
        if (await _prefs.setBool(_kSignedOutKey, value)) {
          return;
        }
        lastError =
            StateError('Storing the signed out marker reported failure.');
      } catch (e) {
        lastError = e;
      }
    }
    throw StateError('Could not store the signed out marker: $lastError');
  }

  /// Records that the user has signed out. While this marker is set,
  /// initialize() will not restore a session, whatever else is still stored.
  Future<Object?> _recordSignedOut() =>
      _enqueuePersistTask(() => _setSignedOutMarker(true));

  /// Removes every stored session value, then the signed-out marker. The
  /// marker is removed last, so if any removal fails the marker survives and
  /// the next launch retries instead of restoring a half-cleared session.
  Future<Object?> _clearPersistedSession() => _enqueuePersistTask(() async {
        await _removeVerified(_kAuthTokenKey);
        await _removeVerified(_kRefreshTokenKey);
        await _prefs.remove(_kTokenExpirationKey);
        await _prefs.remove(_kUidKey);

        await _prefs.remove(_kSignedOutKey);
      });

  Future<Object?> persistAuthData() {
    // Snapshot the session synchronously, before the first await, so that a
    // transition landing while this write waits its turn in the queue cannot
    // tear the values it persists. These locals shadow the fields of the same
    // name, so the write below cannot read the mutable state by accident.
    final authenticationToken = this.authenticationToken;
    final refreshToken = this.refreshToken;
    final tokenExpiration = this.tokenExpiration;
    final uid = this.uid;

    return _enqueuePersistTask(() async {
      // The auth token goes first: it is what initialize() reads to decide
      // whether a session exists, so clearing it first means an interrupted
      // sign out still reads as signed out.
      authenticationToken != null
          ? await _prefs.setString(_kAuthTokenKey, authenticationToken)
          : await _removeVerified(_kAuthTokenKey);
      refreshToken != null
          ? await _prefs.setString(_kRefreshTokenKey, refreshToken)
          : await _removeVerified(_kRefreshTokenKey);
      tokenExpiration != null
          ? await _prefs.setInt(
              _kTokenExpirationKey, tokenExpiration.millisecondsSinceEpoch)
          : await _prefs.remove(_kTokenExpirationKey);
      uid != null
          ? await _prefs.setString(_kUidKey, uid)
          : await _prefs.remove(_kUidKey);

      if (authenticationToken != null) {
        // Signing back in supersedes any recorded sign out. Written as false
        // rather than removed, and unconditionally: a sign out earlier in this
        // same run may have failed to remove the marker from storage while
        // still clearing it from the cache, so neither containsKey() nor a
        // removal can tell us whether the marker is really gone. Writing false
        // is unambiguous, and reads treat it exactly like an absent key.
        //
        // Done last, so the session only becomes restorable once all of it has
        // been stored. The cleanup in _clearPersistedSession() does not need
        // this: a marker that survives there keeps the veto in place and the
        // next launch retries, which is the safe direction, whereas here a
        // surviving marker would discard a session the user legitimately has.
        await _setSignedOutMarker(false);
      }
    });
  }
}

Ev2AuthUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
