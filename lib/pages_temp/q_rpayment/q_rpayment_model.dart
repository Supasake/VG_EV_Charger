import '/components_temp/q_rscan/q_rscan_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'q_rpayment_widget.dart' show QRpaymentWidget;
import 'package:flutter/material.dart';

class QRpaymentModel extends FlutterFlowModel<QRpaymentWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for QRscan component.
  late QRscanModel qRscanModel;

  @override
  void initState(BuildContext context) {
    qRscanModel = createModel(context, () => QRscanModel());
  }

  @override
  void dispose() {
    qRscanModel.dispose();
  }
}
