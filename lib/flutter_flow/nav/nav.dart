import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  Ev2AuthUser? initialUser;
  Ev2AuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(Ev2AuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LogInWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LogInWidget(),
        ),
        FFRoute(
            name: UserWidget.routeName,
            path: UserWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'User')
                : NavBarPage(
                    initialPage: 'User',
                    page: UserWidget(),
                  )),
        FFRoute(
          name: ChargingPointWidget.routeName,
          path: ChargingPointWidget.routePath,
          builder: (context, params) => ChargingPointWidget(
            stationName: params.getParam(
              'stationName',
              ParamType.String,
            ),
            stationAddress: params.getParam(
              'stationAddress',
              ParamType.String,
            ),
            boxId: params.getParam<String>(
              'boxId',
              ParamType.String,
              isList: true,
            ),
            imgStation: params.getParam(
              'imgStation',
              ParamType.String,
            ),
            energyPrice: params.getParam(
              'energyPrice',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ChargeWidget.routeName,
          path: ChargeWidget.routePath,
          builder: (context, params) => ChargeWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: SearchWidget.routeName,
          path: SearchWidget.routePath,
          builder: (context, params) => SearchWidget(),
        ),
        FFRoute(
          name: InvoiceWidget.routeName,
          path: InvoiceWidget.routePath,
          builder: (context, params) => InvoiceWidget(),
        ),
        FFRoute(
          name: Login123Widget.routeName,
          path: Login123Widget.routePath,
          builder: (context, params) => Login123Widget(),
        ),
        FFRoute(
          name: WalletWidget.routeName,
          path: WalletWidget.routePath,
          builder: (context, params) => WalletWidget(),
        ),
        FFRoute(
          name: MycarWidget.routeName,
          path: MycarWidget.routePath,
          builder: (context, params) => MycarWidget(),
        ),
        FFRoute(
            name: StationsWidget.routeName,
            path: StationsWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(
                    initialPage: 'Stations',
                    disableResizeToAvoidBottomInset: true,
                  )
                : NavBarPage(
                    initialPage: 'Stations',
                    page: StationsWidget(),
                    disableResizeToAvoidBottomInset: true,
                  )),
        FFRoute(
          name: StartWidget.routeName,
          path: StartWidget.routePath,
          builder: (context, params) => StartWidget(),
        ),
        FFRoute(
          name: ChargingWidget.routeName,
          path: ChargingWidget.routePath,
          builder: (context, params) => ChargingWidget(),
        ),
        FFRoute(
          name: HistoryWidget.routeName,
          path: HistoryWidget.routePath,
          builder: (context, params) => HistoryWidget(),
        ),
        FFRoute(
          name: QrWidget.routeName,
          path: QrWidget.routePath,
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'QR') : QrWidget(),
        ),
        FFRoute(
          name: WalletHistoryWidget.routeName,
          path: WalletHistoryWidget.routePath,
          builder: (context, params) => WalletHistoryWidget(),
        ),
        FFRoute(
          name: QRpaymentWidget.routeName,
          path: QRpaymentWidget.routePath,
          builder: (context, params) => QRpaymentWidget(),
        ),
        FFRoute(
          name: WalletTopupWidget.routeName,
          path: WalletTopupWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'WalletTopup')
              : WalletTopupWidget(),
        ),
        FFRoute(
          name: SignUp1Widget.routeName,
          path: SignUp1Widget.routePath,
          builder: (context, params) => SignUp1Widget(),
        ),
        FFRoute(
          name: ForgetpasswordWidget.routeName,
          path: ForgetpasswordWidget.routePath,
          builder: (context, params) => ForgetpasswordWidget(),
        ),
        FFRoute(
          name: SummaryWallet1Widget.routeName,
          path: SummaryWallet1Widget.routePath,
          builder: (context, params) => SummaryWallet1Widget(),
        ),
        FFRoute(
          name: AboutWidget.routeName,
          path: AboutWidget.routePath,
          builder: (context, params) => AboutWidget(),
        ),
        FFRoute(
          name: FaqWidget.routeName,
          path: FaqWidget.routePath,
          builder: (context, params) => FaqWidget(),
        ),
        FFRoute(
          name: FavoriteSatationWidget.routeName,
          path: FavoriteSatationWidget.routePath,
          builder: (context, params) => FavoriteSatationWidget(),
        ),
        FFRoute(
          name: Refund4FutureWidget.routeName,
          path: Refund4FutureWidget.routePath,
          builder: (context, params) => Refund4FutureWidget(),
        ),
        FFRoute(
          name: CompleteCharge1Widget.routeName,
          path: CompleteCharge1Widget.routePath,
          builder: (context, params) => CompleteCharge1Widget(),
        ),
        FFRoute(
          name: ChoiceWallet1Widget.routeName,
          path: ChoiceWallet1Widget.routePath,
          builder: (context, params) => ChoiceWallet1Widget(),
        ),
        FFRoute(
          name: CommentWidget.routeName,
          path: CommentWidget.routePath,
          builder: (context, params) => CommentWidget(),
        ),
        FFRoute(
          name: Comment2Widget.routeName,
          path: Comment2Widget.routePath,
          builder: (context, params) => Comment2Widget(),
        ),
        FFRoute(
          name: CommentchoiceWidget.routeName,
          path: CommentchoiceWidget.routePath,
          builder: (context, params) => CommentchoiceWidget(),
        ),
        FFRoute(
          name: CarUserWidget.routeName,
          path: CarUserWidget.routePath,
          builder: (context, params) => CarUserWidget(),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: ChangeNameUserWidget.routeName,
          path: ChangeNameUserWidget.routePath,
          builder: (context, params) => ChangeNameUserWidget(),
        ),
        FFRoute(
          name: CompletepaymentWidget.routeName,
          path: CompletepaymentWidget.routePath,
          builder: (context, params) => CompletepaymentWidget(),
        ),
        FFRoute(
          name: AddUserEmailWidget.routeName,
          path: AddUserEmailWidget.routePath,
          builder: (context, params) => AddUserEmailWidget(),
        ),
        FFRoute(
          name: AddPhoneNumberWidget.routeName,
          path: AddPhoneNumberWidget.routePath,
          builder: (context, params) => AddPhoneNumberWidget(),
        ),
        FFRoute(
          name: SignInWidget.routeName,
          path: SignInWidget.routePath,
          builder: (context, params) => SignInWidget(),
        ),
        FFRoute(
          name: ChargingProcessWidget.routeName,
          path: ChargingProcessWidget.routePath,
          builder: (context, params) => ChargingProcessWidget(
            chargingTerminal: params.getParam(
              'chargingTerminal',
              ParamType.String,
            ),
            chargingPoint: params.getParam(
              'chargingPoint',
              ParamType.int,
            ),
            transactionId: params.getParam(
              'transactionId',
              ParamType.String,
            ),
            startDateTime: params.getParam(
              'startDateTime',
              ParamType.DateTime,
            ),
            energyPrice: params.getParam(
              'energyPrice',
              ParamType.int,
            ),
            chargingMode: params.getParam(
              'chargingMode',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChargingCompletedWidget.routeName,
          path: ChargingCompletedWidget.routePath,
          builder: (context, params) => ChargingCompletedWidget(
            transactionId: params.getParam(
              'transactionId',
              ParamType.String,
            ),
            startTime: params.getParam(
              'startTime',
              ParamType.DateTime,
            ),
            stopTime: params.getParam(
              'stopTime',
              ParamType.DateTime,
            ),
            timeSummary: params.getParam(
              'timeSummary',
              ParamType.int,
            ),
            pricePerKWh: params.getParam(
              'pricePerKWh',
              ParamType.int,
            ),
            chargingMode: params.getParam(
              'chargingMode',
              ParamType.String,
            ),
            chargingTerminal: params.getParam(
              'chargingTerminal',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChargingActiveWidget.routeName,
          path: ChargingActiveWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ChargingActive')
              : ChargingActiveWidget(),
        ),
        FFRoute(
          name: LogInWidget.routeName,
          path: LogInWidget.routePath,
          builder: (context, params) => LogInWidget(),
        ),
        FFRoute(
          name: RegisterWidget.routeName,
          path: RegisterWidget.routePath,
          builder: (context, params) => RegisterWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/logIn';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
