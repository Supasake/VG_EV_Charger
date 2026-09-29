import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'stations_widget.dart' show StationsWidget;
import 'package:flutter/material.dart';

class StationsModel extends FlutterFlowModel<StationsWidget> {
  ///  Local state fields for this page.

  dynamic avaliableStations;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Avaliable Stations)] action in Stations widget.
  ApiCallResponse? apiGetStations;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for searchStation widget.
  FocusNode? searchStationFocusNode;
  TextEditingController? searchStationTextController;
  String? Function(BuildContext, String?)? searchStationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchStationFocusNode?.dispose();
    searchStationTextController?.dispose();
  }
}
