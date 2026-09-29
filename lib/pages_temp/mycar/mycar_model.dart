import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'mycar_widget.dart' show MycarWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MycarModel extends FlutterFlowModel<MycarWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for dateOfBirth widget.
  FocusNode? dateOfBirthFocusNode1;
  TextEditingController? dateOfBirthTextController1;
  late MaskTextInputFormatter dateOfBirthMask1;
  String? Function(BuildContext, String?)? dateOfBirthTextController1Validator;
  String? _dateOfBirthTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the date of birth of the patient.';
    }

    return null;
  }

  // State field(s) for dateOfBirth widget.
  FocusNode? dateOfBirthFocusNode2;
  TextEditingController? dateOfBirthTextController2;
  late MaskTextInputFormatter dateOfBirthMask2;
  String? Function(BuildContext, String?)? dateOfBirthTextController2Validator;

  @override
  void initState(BuildContext context) {
    dateOfBirthTextController1Validator = _dateOfBirthTextController1Validator;
  }

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    dateOfBirthFocusNode1?.dispose();
    dateOfBirthTextController1?.dispose();

    dateOfBirthFocusNode2?.dispose();
    dateOfBirthTextController2?.dispose();
  }
}
