import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'wallet_history_model.dart';
export 'wallet_history_model.dart';

class WalletHistoryWidget extends StatefulWidget {
  const WalletHistoryWidget({super.key});

  static String routeName = 'WalletHistory';
  static String routePath = '/wallet-history';

  @override
  State<WalletHistoryWidget> createState() => _WalletHistoryWidgetState();
}

class _WalletHistoryWidgetState extends State<WalletHistoryWidget>
    with TickerProviderStateMixin {
  late WalletHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalletHistoryModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: _model
          .allTransactions(
        requestFn: () => SteveOCCPExtApiGroup.walletHistoryCall.call(
          userId: currentUserUid,
        ),
      )
          .then((result) {
        _model.apiRequestCompleted = true;
        return result;
      }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFoldingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final walletHistoryWalletHistoryResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.angleDoubleLeft,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Transaction Record',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AnimatedOpacity(
                                  opacity: _model.selectedPeriod == 'AllTime'
                                      ? 1.0
                                      : 0.3,
                                  duration: 300.0.ms,
                                  curve: Curves.easeInOut,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.selectedPeriod = 'AllTime';
                                      safeSetState(() {});
                                    },
                                    text: 'All Time',
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.selectedPeriod == 'AllTime'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                AnimatedOpacity(
                                  opacity: _model.selectedPeriod == 'Today'
                                      ? 1.0
                                      : 0.3,
                                  duration: 300.0.ms,
                                  curve: Curves.easeInOut,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.selectedPeriod = 'Today';
                                      safeSetState(() {});
                                    },
                                    text: 'Today',
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.selectedPeriod == 'Today'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: _model.selectedPeriod == '7Days'
                                      ? 1.0
                                      : 0.3,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.selectedPeriod = '7Days';
                                      safeSetState(() {});
                                    },
                                    text: '7 Days',
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.selectedPeriod == '7Days'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: _model.selectedPeriod == '1Month'
                                      ? 1.0
                                      : 0.3,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.selectedPeriod = '1Month';
                                      safeSetState(() {});
                                    },
                                    text: '1 Month',
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.selectedPeriod == '1Month'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: _model.selectedPeriod == '3Months'
                                      ? 1.0
                                      : 0.3,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.selectedPeriod = '3Months';
                                      safeSetState(() {});
                                    },
                                    text: '3 Months',
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.selectedPeriod == '3Months'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: _model.selectedPeriod == '6Months'
                                      ? 1.0
                                      : 0.3,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.selectedPeriod = '6Months';
                                      safeSetState(() {});
                                    },
                                    text: '6 Months',
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.selectedPeriod == '6Months'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: _model.selectedPeriod == '1Year'
                                      ? 1.0
                                      : 0.3,
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.selectedPeriod = '1Year';
                                      safeSetState(() {});
                                    },
                                    text: '1 Year',
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.selectedPeriod == '1Year'
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(width: 3.0))
                                  .around(SizedBox(width: 3.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            indicatorColor: Color(0xFF1B75BB),
                            tabs: [
                              Tab(
                                text: 'ทั้งหมด',
                              ),
                              Tab(
                                text: 'เติมเงิน',
                              ),
                              Tab(
                                text: 'กำลังชาร์จ',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!valueOrDefault<bool>(
                                    (List<String> data) {
                                      return (data ?? []).length > 0;
                                    }((functions.filterByDateRange(
                                            getJsonField(
                                              walletHistoryWalletHistoryResponse
                                                  .jsonBody,
                                              r'''$.transactions''',
                                            ),
                                            _model.selectedPeriod) as List?)!
                                        .map<String>((e) => e.toString())
                                        .toList()
                                        .cast<String>()),
                                    true,
                                  ))
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'No Data ...',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 30.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Builder(
                                        builder: (context) {
                                          final transaction = functions
                                                  .filterByDateRange(
                                                      getJsonField(
                                                        walletHistoryWalletHistoryResponse
                                                            .jsonBody,
                                                        r'''$.transactions''',
                                                      ),
                                                      _model.selectedPeriod)
                                                  ?.toList() ??
                                              [];

                                          return RefreshIndicator(
                                            onRefresh: () async {
                                              _model.apiResultTooup =
                                                  await SteveOCCPExtApiGroup
                                                      .walletHistoryCall
                                                      .call(
                                                userId: currentUserUid,
                                              );

                                              if ((_model.apiResultTooup
                                                      ?.succeeded ??
                                                  true)) {
                                                safeSetState(() {
                                                  _model
                                                      .clearAllTransactionsCache();
                                                  _model.apiRequestCompleted =
                                                      false;
                                                });
                                                await _model
                                                    .waitForApiRequestCompleted(
                                                        minWait: 1000,
                                                        maxWait: 3000);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'This is the latest information.',
                                                      style: GoogleFonts.outfit(
                                                        color:
                                                            Color(0xFFFEFDFF),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20.0,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 3449),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                15.0,
                                                0,
                                                15.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: transaction.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 5.0),
                                              itemBuilder:
                                                  (context, transactionIndex) {
                                                final transactionItem =
                                                    transaction[
                                                        transactionIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 15.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: transactionIndex %
                                                                  2 ==
                                                              0
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .listsBackground1
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .listsBackground2,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color: transactionIndex %
                                                                    2 ==
                                                                0
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          color:
                                                              Color(0x00000000),
                                                          child:
                                                              ExpandableNotifier(
                                                            initialExpanded:
                                                                false,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                if ((String type) {
                                                                                  return (type ?? '').isNotEmpty && type == 'charge';
                                                                                }(getJsonField(
                                                                                  transactionItem,
                                                                                  r'''$.type''',
                                                                                ).toString()))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 2.0, 0.0, 0.0),
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.chargingStation,
                                                                                      color: FlutterFlowTheme.of(context).accent1,
                                                                                      size: 15.0,
                                                                                    ),
                                                                                  ),
                                                                                if ((String type) {
                                                                                  return (type ?? '').isNotEmpty && type == 'topup';
                                                                                }(getJsonField(
                                                                                  transactionItem,
                                                                                  r'''$.type''',
                                                                                ).toString()))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 0.0, 0.0),
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.moneyCheckAlt,
                                                                                      color: Color(0xFFC8CD6C),
                                                                                      size: 15.0,
                                                                                    ),
                                                                                  ),
                                                                                if ((String type) {
                                                                                  return (type ?? '').isNotEmpty && type == 'blockchain';
                                                                                }(getJsonField(
                                                                                  transactionItem,
                                                                                  r'''$.type''',
                                                                                ).toString()))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.currency_bitcoin_rounded,
                                                                                      color: Color(0xFFF2CE0F),
                                                                                      size: 17.0,
                                                                                    ),
                                                                                  ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                  child: Text(
                                                                                    '฿ ${getJsonField(
                                                                                      transactionItem,
                                                                                      r'''$.amount''',
                                                                                    ).toString()}',
                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                          font: GoogleFonts.outfit(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  (String type) {
                                                                                    return (type ?? '').isNotEmpty ? '${(type ?? '')[0].toUpperCase()}${(type ?? '').substring(1)}' : '';
                                                                                  }(getJsonField(
                                                                                    transactionItem,
                                                                                    r'''$.type''',
                                                                                  ).toString()),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.manrope(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          if ((String
                                                                              isStatus) {
                                                                            return isStatus.isNotEmpty;
                                                                          }(getJsonField(
                                                                            transactionItem,
                                                                            r'''$.status''',
                                                                          ).toString()))
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: () {
                                                                                  if ((String status) {
                                                                                    return status == 'pending';
                                                                                  }(getJsonField(
                                                                                    transactionItem,
                                                                                    r'''$.status''',
                                                                                  ).toString())) {
                                                                                    return FlutterFlowTheme.of(context).warning;
                                                                                  } else if ((String status) {
                                                                                    return status == 'paid';
                                                                                  }(getJsonField(
                                                                                    transactionItem,
                                                                                    r'''$.status''',
                                                                                  ).toString())) {
                                                                                    return FlutterFlowTheme.of(context).success;
                                                                                  } else {
                                                                                    return Color(0x00000000);
                                                                                  }
                                                                                }(),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: (String status) {
                                                                                  return status != 'null' && status.isNotEmpty;
                                                                                }(getJsonField(
                                                                                  transactionItem,
                                                                                  r'''$.status''',
                                                                                ).toString()),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                  child: Text(
                                                                                    (String status) {
                                                                                      return (status ?? '').isNotEmpty ? '${(status ?? '')[0].toUpperCase()}${(status ?? '').substring(1)}' : '';
                                                                                    }(getJsonField(
                                                                                      transactionItem,
                                                                                      r'''$.status''',
                                                                                    ).toString()),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.manrope(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if ((String
                                                                            type) {
                                                                          return (type ?? '').isNotEmpty &&
                                                                              type == 'blockchain';
                                                                        }(getJsonField(
                                                                          transactionItem,
                                                                          r'''$.type''',
                                                                        ).toString()))
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 30.0,
                                                                              fillColor: FlutterFlowTheme.of(context).secondary,
                                                                              icon: Icon(
                                                                                Icons.qr_code,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 15.0,
                                                                              ),
                                                                              onPressed: () {
                                                                                print('IconButton pressed ...');
                                                                              },
                                                                            ),
                                                                          ),
                                                                        Text(
                                                                          'Updated : ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.manrope(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.setDateTimeThailand(getJsonField(
                                                                              transactionItem,
                                                                              r'''$.updated_at''',
                                                                            ).toString()),
                                                                            'Updated',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.manrope(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              collapsed: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'More Details',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.manrope(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              expanded: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Reference : ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.manrope(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            (String
                                                                                ref) {
                                                                              return ((ref ?? '').trim().isNotEmpty && ref != 'null') ? ref : 'No data';
                                                                            }(getJsonField(
                                                                              transactionItem,
                                                                              r'''$.reference''',
                                                                            ).toString()),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.manrope(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0x8A000000),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Created : ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.manrope(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              functions.setDateTimeThailand(getJsonField(
                                                                                transactionItem,
                                                                                r'''$.created_at''',
                                                                              ).toString()),
                                                                              '-',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.manrope(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    StyledDivider(
                                                                      thickness:
                                                                          2.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      lineStyle:
                                                                          DividerLineStyle
                                                                              .dotted,
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          (String
                                                                              description) {
                                                                            return ((description ?? '').trim().isNotEmpty && description != 'null')
                                                                                ? description
                                                                                : 'No data';
                                                                          }(getJsonField(
                                                                            transactionItem,
                                                                            r'''$.description''',
                                                                          ).toString()),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.manrope(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    true,
                                                                tapBodyToCollapse:
                                                                    true,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!valueOrDefault<bool>(
                                    (List<String> data) {
                                      return (data ?? []).length > 0;
                                    }(functions
                                        .filterByType(
                                            functions.filterByDateRange(
                                                getJsonField(
                                                  walletHistoryWalletHistoryResponse
                                                      .jsonBody,
                                                  r'''$.transactions''',
                                                ),
                                                _model.selectedPeriod)!,
                                            '[\"blockchain\",\"topup\"]')!
                                        .map((e) => e.toString())
                                        .toList()),
                                    true,
                                  ))
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'No Data ...',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 30.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Builder(
                                        builder: (context) {
                                          final topup = functions
                                                  .filterByType(
                                                      functions.filterByDateRange(
                                                          getJsonField(
                                                            walletHistoryWalletHistoryResponse
                                                                .jsonBody,
                                                            r'''$.transactions''',
                                                          ),
                                                          _model.selectedPeriod)!,
                                                      '[\"blockchain\",\"topup\"]')
                                                  ?.toList() ??
                                              [];

                                          return RefreshIndicator(
                                            onRefresh: () async {
                                              _model.apiResultTransactions =
                                                  await SteveOCCPExtApiGroup
                                                      .walletHistoryCall
                                                      .call(
                                                userId: currentUserUid,
                                              );

                                              if ((_model.apiResultTransactions
                                                      ?.succeeded ??
                                                  true)) {
                                                safeSetState(() {
                                                  _model
                                                      .clearAllTransactionsCache();
                                                  _model.apiRequestCompleted =
                                                      false;
                                                });
                                                await _model
                                                    .waitForApiRequestCompleted(
                                                        minWait: 1000,
                                                        maxWait: 3000);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'This is the latest information.',
                                                      style: GoogleFonts.outfit(
                                                        color:
                                                            Color(0xFFFEFDFF),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20.0,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 3449),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                15.0,
                                                0,
                                                15.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: topup.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 5.0),
                                              itemBuilder:
                                                  (context, topupIndex) {
                                                final topupItem =
                                                    topup[topupIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 15.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: topupIndex % 2 == 0
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .listsBackground1
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .listsBackground2,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color: topupIndex % 2 ==
                                                                0
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          color:
                                                              Color(0x00000000),
                                                          child:
                                                              ExpandableNotifier(
                                                            initialExpanded:
                                                                false,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                if ((String type) {
                                                                                  return (type ?? '').isNotEmpty && type == 'topup';
                                                                                }(getJsonField(
                                                                                  topupItem,
                                                                                  r'''$.type''',
                                                                                ).toString()))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 0.0, 0.0),
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.moneyCheckAlt,
                                                                                      color: Color(0xFFC8CD6C),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                if ((String type) {
                                                                                  return (type ?? '').isNotEmpty && type == 'blockchain';
                                                                                }(getJsonField(
                                                                                  topupItem,
                                                                                  r'''$.type''',
                                                                                ).toString()))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                    child: Icon(
                                                                                      Icons.currency_bitcoin_rounded,
                                                                                      color: Color(0xFFF2CE0F),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                  ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                  child: Text(
                                                                                    '฿ ${getJsonField(
                                                                                      topupItem,
                                                                                      r'''$.amount''',
                                                                                    ).toString()}',
                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                          font: GoogleFonts.outfit(
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  (String type) {
                                                                                    return (type ?? '').isNotEmpty ? '${(type ?? '')[0].toUpperCase()}${(type ?? '').substring(1)}' : '';
                                                                                  }(getJsonField(
                                                                                    topupItem,
                                                                                    r'''$.type''',
                                                                                  ).toString()),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.manrope(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          if ((String
                                                                              isStatus) {
                                                                            return isStatus.isNotEmpty;
                                                                          }(getJsonField(
                                                                            topupItem,
                                                                            r'''$.status''',
                                                                          ).toString()))
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: () {
                                                                                  if ((String status) {
                                                                                    return status == 'pending';
                                                                                  }(getJsonField(
                                                                                    topupItem,
                                                                                    r'''$.status''',
                                                                                  ).toString())) {
                                                                                    return FlutterFlowTheme.of(context).warning;
                                                                                  } else if ((String status) {
                                                                                    return status == 'paid';
                                                                                  }(getJsonField(
                                                                                    topupItem,
                                                                                    r'''$.status''',
                                                                                  ).toString())) {
                                                                                    return FlutterFlowTheme.of(context).success;
                                                                                  } else {
                                                                                    return Color(0x00000000);
                                                                                  }
                                                                                }(),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              child: Visibility(
                                                                                visible: (String status) {
                                                                                  return status != 'null' && status.isNotEmpty;
                                                                                }(getJsonField(
                                                                                  topupItem,
                                                                                  r'''$.status''',
                                                                                ).toString()),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                  child: Text(
                                                                                    (String status) {
                                                                                      return (status ?? '').isNotEmpty ? '${(status ?? '')[0].toUpperCase()}${(status ?? '').substring(1)}' : '';
                                                                                    }(getJsonField(
                                                                                      topupItem,
                                                                                      r'''$.status''',
                                                                                    ).toString()),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.manrope(
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if ((String
                                                                            type) {
                                                                          return (type ?? '').isNotEmpty &&
                                                                              type == 'blockchain';
                                                                        }(getJsonField(
                                                                          topupItem,
                                                                          r'''$.type''',
                                                                        ).toString()))
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 30.0,
                                                                              fillColor: FlutterFlowTheme.of(context).secondary,
                                                                              icon: Icon(
                                                                                Icons.qr_code,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 15.0,
                                                                              ),
                                                                              onPressed: () {
                                                                                print('IconButton pressed ...');
                                                                              },
                                                                            ),
                                                                          ),
                                                                        Text(
                                                                          'Updated : ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.manrope(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.setDateTimeThailand(getJsonField(
                                                                              topupItem,
                                                                              r'''$.updated_at''',
                                                                            ).toString()),
                                                                            'Updated',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.manrope(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              collapsed: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'More Details',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.manrope(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              expanded: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Reference : ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.manrope(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            (String
                                                                                ref) {
                                                                              return ((ref ?? '').trim().isNotEmpty && ref != 'null') ? ref : 'No data';
                                                                            }(getJsonField(
                                                                              topupItem,
                                                                              r'''$.reference''',
                                                                            ).toString()),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.manrope(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: Color(0x8A000000),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Created : ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.manrope(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              functions.setDateTimeThailand(getJsonField(
                                                                                topupItem,
                                                                                r'''$.created_at''',
                                                                              ).toString()),
                                                                              '-',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.manrope(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    StyledDivider(
                                                                      thickness:
                                                                          2.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      lineStyle:
                                                                          DividerLineStyle
                                                                              .dotted,
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          (String
                                                                              description) {
                                                                            return ((description ?? '').trim().isNotEmpty && description != 'null')
                                                                                ? description
                                                                                : 'No data';
                                                                          }(getJsonField(
                                                                            topupItem,
                                                                            r'''$.description''',
                                                                          ).toString()),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.manrope(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    true,
                                                                tapBodyToCollapse:
                                                                    true,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 5.0),
                                            child: Container(
                                              width: 111.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x3416202A),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: Color(0xFF4285F4),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat("d/M/y",
                                                            _model.datePicked),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF95A1AC),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.9, 0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            final _datePickedDate =
                                                                await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  getCurrentTimestamp,
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate:
                                                                  DateTime(
                                                                      2050),
                                                            );

                                                            if (_datePickedDate !=
                                                                null) {
                                                              safeSetState(() {
                                                                _model.datePicked =
                                                                    DateTime(
                                                                  _datePickedDate
                                                                      .year,
                                                                  _datePickedDate
                                                                      .month,
                                                                  _datePickedDate
                                                                      .day,
                                                                );
                                                              });
                                                            } else if (_model
                                                                    .datePicked !=
                                                                null) {
                                                              safeSetState(() {
                                                                _model.datePicked =
                                                                    getCurrentTimestamp;
                                                              });
                                                            }
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .date_range_sharp,
                                                            color: Color(
                                                                0xFF95A1AC),
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 10.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: [
                                              'ทั้งหมด',
                                              'บัญชีบุคคล',
                                              'บัญชีธุรกิจ'
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () =>
                                                    _model.dropDownValue = val),
                                            width: 111.0,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                            hintText: 'ทั้งหมด',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: Color(0xFF4285F4),
                                            borderWidth: 0.0,
                                            borderRadius: 0.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final listtransection03 = List.generate(
                                                random_data.randomInteger(5, 5),
                                                (index) => random_data
                                                    .randomInteger(0, 10))
                                            .toList()
                                            .take(20)
                                            .toList();

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              listtransection03.length,
                                              (listtransection03Index) {
                                            final listtransection03Item =
                                                listtransection03[
                                                    listtransection03Index];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 5.0, 10.0, 5.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF8F7F7),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.bolt,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 24.0,
                                                          ),
                                                          Text(
                                                            'ค่าใช้จ่าย',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .manrope(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                      Text(
                                                        '-2.88 THB',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .manrope(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
