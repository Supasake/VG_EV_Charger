import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'sign_in_model.dart';
export 'sign_in_model.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  static String routeName = 'SignIn';
  static String routePath = '/signIn';

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget>
    with TickerProviderStateMixin {
  late SignInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignInModel());

    animationsMap.addAll({
      'imageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: Offset(-30.0, 100.0),
            end: Offset(0.0, -100.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.linear,
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).skyTop,
                    FlutterFlowTheme.of(context).skyMiddle,
                    FlutterFlowTheme.of(context).skyBottom
                  ],
                  stops: [0.0, 0.7, 1.0],
                  begin: AlignmentDirectional(0.03, -1.0),
                  end: AlignmentDirectional(-0.03, 1.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 30.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if ((Theme.of(context).brightness ==
                                    Brightness.dark) &&
                                responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                              FlutterFlowIconButton(
                                borderRadius: 50.0,
                                buttonSize: 40.0,
                                icon: FaIcon(
                                  FontAwesomeIcons.solidMoon,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  if (Theme.of(context).brightness ==
                                      Brightness.dark) {
                                    setDarkModeSetting(
                                        context, ThemeMode.light);
                                  } else {
                                    setDarkModeSetting(context, ThemeMode.dark);
                                  }
                                },
                              ),
                            if ((Theme.of(context).brightness ==
                                    Brightness.light) &&
                                responsiveVisibility(
                                  context: context,
                                  desktop: false,
                                ))
                              FlutterFlowIconButton(
                                borderRadius: 50.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.wb_sunny,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  if (Theme.of(context).brightness ==
                                      Brightness.dark) {
                                    setDarkModeSetting(
                                        context, ThemeMode.light);
                                  } else {
                                    setDarkModeSetting(context, ThemeMode.dark);
                                  }
                                },
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Hello World',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (Theme.of(context).brightness == Brightness.dark)
              AnimatedOpacity(
                opacity: 0.3,
                duration: 500.0.ms,
                curve: Curves.easeInOut,
                child: Lottie.network(
                  'https://lottie.host/08f7eb00-7a81-4b46-b53a-e0ab472ef348/pLviQEwfgk.json',
                  width: 6742.1,
                  height: 264.7,
                  fit: BoxFit.fill,
                  animate: true,
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if ((Theme.of(context).brightness == Brightness.dark) &&
                      responsiveVisibility(
                        context: context,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                    FlutterFlowIconButton(
                      borderRadius: 50.0,
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FontAwesomeIcons.solidMoon,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        if (Theme.of(context).brightness == Brightness.dark) {
                          setDarkModeSetting(context, ThemeMode.light);
                        } else {
                          setDarkModeSetting(context, ThemeMode.dark);
                        }
                      },
                    ),
                  if ((Theme.of(context).brightness == Brightness.light) &&
                      responsiveVisibility(
                        context: context,
                        desktop: false,
                      ))
                    FlutterFlowIconButton(
                      borderRadius: 50.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.wb_sunny,
                        color: FlutterFlowTheme.of(context).warning,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        if (Theme.of(context).brightness == Brightness.dark) {
                          setDarkModeSetting(context, ThemeMode.light);
                        } else {
                          setDarkModeSetting(context, ThemeMode.dark);
                        }
                      },
                    ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.04),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.easeInOut,
                width: double.infinity,
                height: 450.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/sun.png',
                      width: 300.0,
                      height: 250.0,
                      fit: BoxFit.fitHeight,
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['imageOnActionTriggerAnimation']!,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
