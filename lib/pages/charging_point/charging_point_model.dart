import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'charging_point_widget.dart' show ChargingPointWidget;
import 'package:flutter/material.dart';

class ChargingPointModel extends FlutterFlowModel<ChargingPointWidget> {
  ///  Local state fields for this page.

  double? userBalance;

  int? chargeAmount = 0;

  ///  State fields for stateful widgets in this page.

  InstantTimer? ChargingPointStatus;
  // Stores action output result for [Backend Call - API (Get All Charger Status)] action in ChargingPoint widget.
  ApiCallResponse? apiResChargingPointStatus;
  // Stores action output result for [Backend Call - API (Balance)] action in ChargingPoint widget.
  ApiCallResponse? apiGetBalance;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for ChargingModeOptions widget.
  String? chargingModeOptionsValue;
  FormFieldController<String>? chargingModeOptionsValueController;
  // Stores action output result for [Backend Call - API (Remote Start Transaction)] action in Button widget.
  ApiCallResponse? apiStartCharging;
  // Stores action output result for [Backend Call - API (Get Transactions)] action in Button widget.
  ApiCallResponse? resTransaction;
  // Stores action output result for [Custom Action - getChargeTransaction] action in Button widget.
  dynamic currentTransaction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ChargingPointStatus?.cancel();
  }
}
