import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'wallet_topup_widget.dart' show WalletTopupWidget;
import 'package:flutter/material.dart';

class WalletTopupModel extends FlutterFlowModel<WalletTopupWidget> {
  ///  Local state fields for this page.

  int? selectedButton;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PaymentType widget.
  String? paymentTypeValue;
  FormFieldController<String>? paymentTypeValueController;
  // State field(s) for Memo widget.
  FocusNode? memoFocusNode;
  TextEditingController? memoTextController;
  String? Function(BuildContext, String?)? memoTextControllerValidator;
  String? _memoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'MEMO is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Topup widget.
  FocusNode? topupFocusNode;
  TextEditingController? topupTextController;
  String? Function(BuildContext, String?)? topupTextControllerValidator;
  String? _topupTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Amount is required';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in ButtonTopup widget.
  bool? topupValidateForm;
  // Stores action output result for [Backend Call - API (BlockchainTopup)] action in ButtonTopup widget.
  ApiCallResponse? blockchainInvoice;
  // Stores action output result for [Backend Call - API (Topup)] action in ButtonTopup widget.
  ApiCallResponse? apiTopup;
  // Stores action output result for [Backend Call - API (Balance)] action in ButtonTopup widget.
  ApiCallResponse? apiGetBalanceAfterTopup;

  @override
  void initState(BuildContext context) {
    memoTextControllerValidator = _memoTextControllerValidator;
    topupTextControllerValidator = _topupTextControllerValidator;
  }

  @override
  void dispose() {
    memoFocusNode?.dispose();
    memoTextController?.dispose();

    topupFocusNode?.dispose();
    topupTextController?.dispose();
  }
}
