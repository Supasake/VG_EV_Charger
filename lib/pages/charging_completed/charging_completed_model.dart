import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'charging_completed_widget.dart' show ChargingCompletedWidget;
import 'package:flutter/material.dart';

class ChargingCompletedModel extends FlutterFlowModel<ChargingCompletedWidget> {
  ///  Local state fields for this page.

  String startValue = '-';

  String stopValue = '-';

  dynamic paymentDetails;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Charge Data by Transaction)] action in ChargingCompleted widget.
  ApiCallResponse? apiResTransaction;
  // Stores action output result for [Custom Action - calculateChargingCost] action in ChargingCompleted widget.
  dynamic getExpenseSummary;
  // Stores action output result for [Backend Call - API (Charge)] action in ChargingCompleted widget.
  ApiCallResponse? apiResCharge;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
