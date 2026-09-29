import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'input_amount_charger_widget.dart' show InputAmountChargerWidget;
import 'package:flutter/material.dart';

class InputAmountChargerModel
    extends FlutterFlowModel<InputAmountChargerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }

  /// Action blocks.
  /// Check amount not over balance.
  Future checkAmount(
    BuildContext context, {
    required int? amount,
    required double? balance,
  }) async {
    if (amount! <= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'The minimum required amount is 5 baht.',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
          duration: Duration(milliseconds: 10000),
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
        ),
      );
      FFAppState().setAmountCharger = 5;
    } else if (amount > balance!.round()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'The maximum amount you can enter is  ${formatNumber(
              balance,
              formatType: FormatType.decimal,
              decimalType: DecimalType.periodDecimal,
            )} Baht, and it cannot exceed your Wallet balance.',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
          duration: Duration(milliseconds: 10000),
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
        ),
      );
      FFAppState().setAmountCharger = widget!.balance.floor();
    } else {
      FFAppState().setAmountCharger = amount;
    }
  }
}
