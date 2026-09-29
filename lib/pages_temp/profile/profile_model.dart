import '/components_temp/profile_settings/profile_settings_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ProfileSettings component.
  late ProfileSettingsModel profileSettingsModel1;
  // Model for ProfileSettings component.
  late ProfileSettingsModel profileSettingsModel2;
  // Model for ProfileSettings component.
  late ProfileSettingsModel profileSettingsModel3;

  @override
  void initState(BuildContext context) {
    profileSettingsModel1 = createModel(context, () => ProfileSettingsModel());
    profileSettingsModel2 = createModel(context, () => ProfileSettingsModel());
    profileSettingsModel3 = createModel(context, () => ProfileSettingsModel());
  }

  @override
  void dispose() {
    profileSettingsModel1.dispose();
    profileSettingsModel2.dispose();
    profileSettingsModel3.dispose();
  }
}
