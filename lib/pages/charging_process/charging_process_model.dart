import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'charging_process_widget.dart' show ChargingProcessWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class ChargingProcessModel extends FlutterFlowModel<ChargingProcessWidget> {
  ///  Local state fields for this page.

  dynamic chargingDetails;

  int? totalTime;

  String? startValue;

  /// Get Cost and EnergyUsed
  dynamic chargingExpense;

  String chargingStatus = 'Charging';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Charge Data by Transaction)] action in ChargingProcess widget.
  ApiCallResponse? apiGetTransaction;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Active Charging Point Details)] action in ChargingProcess widget.
  ApiCallResponse? getActiveCharging;
  // Stores action output result for [Custom Action - calculateChargingCost] action in ChargingProcess widget.
  dynamic getChargingExpense;
  // Stores action output result for [Backend Call - API (Remote Stop Transaction)] action in ChargingProcess widget.
  ApiCallResponse? apiStopChargingByAmount;
  // Stores action output result for [Backend Call - API (Get Charge Data by Transaction)] action in ChargingProcess widget.
  ApiCallResponse? getStopTransactionByAmount;
  // State field(s) for ChargingTimer widget.
  final chargingTimerInitialTimeMs = 0;
  int chargingTimerMilliseconds = 0;
  String chargingTimerValue =
      StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController chargingTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // Stores action output result for [Backend Call - API (Remote Stop Transaction)] action in Button widget.
  ApiCallResponse? apiStopCharging;
  // Stores action output result for [Backend Call - API (Get Charge Data by Transaction)] action in Button widget.
  ApiCallResponse? getStopTransaction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    chargingTimerController.dispose();
  }
}
