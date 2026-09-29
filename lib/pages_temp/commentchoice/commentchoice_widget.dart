import '/components_temp/choice_comment1/choice_comment1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'commentchoice_model.dart';
export 'commentchoice_model.dart';

class CommentchoiceWidget extends StatefulWidget {
  const CommentchoiceWidget({super.key});

  static String routeName = 'Commentchoice';
  static String routePath = '/commentchoice';

  @override
  State<CommentchoiceWidget> createState() => _CommentchoiceWidgetState();
}

class _CommentchoiceWidgetState extends State<CommentchoiceWidget> {
  late CommentchoiceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentchoiceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 31.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 25.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
            title: Text(
              'รายละเอียดข้อเสนอแนะ',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.outfit(
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.choiceComment1Model,
            updateCallback: () => safeSetState(() {}),
            child: ChoiceComment1Widget(),
          ),
        ),
      ),
    );
  }
}
