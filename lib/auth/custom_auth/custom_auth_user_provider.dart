import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class Ev2AuthUser {
  Ev2AuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<Ev2AuthUser> ev2AuthUserSubject =
    BehaviorSubject.seeded(Ev2AuthUser(loggedIn: false));
Stream<Ev2AuthUser> ev2AuthUserStream() =>
    ev2AuthUserSubject.asBroadcastStream().map((user) => currentUser = user);
