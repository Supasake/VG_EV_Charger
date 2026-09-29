import '/components_temp/choice_comment1/choice_comment1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'commentchoice_widget.dart' show CommentchoiceWidget;
import 'package:flutter/material.dart';

class CommentchoiceModel extends FlutterFlowModel<CommentchoiceWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ChoiceComment1 component.
  late ChoiceComment1Model choiceComment1Model;

  @override
  void initState(BuildContext context) {
    choiceComment1Model = createModel(context, () => ChoiceComment1Model());
  }

  @override
  void dispose() {
    choiceComment1Model.dispose();
  }
}
