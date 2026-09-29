import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'wallet_history_widget.dart' show WalletHistoryWidget;
import 'package:flutter/material.dart';

class WalletHistoryModel extends FlutterFlowModel<WalletHistoryWidget> {
  ///  Local state fields for this page.

  DateTime? dateFrom;

  DateTime? dateTo;

  String selectedPeriod = 'AllTime';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Backend Call - API (Wallet History)] action in ListView widget.
  ApiCallResponse? apiResultTooup;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // Stores action output result for [Backend Call - API (Wallet History)] action in ListView widget.
  ApiCallResponse? apiResultTransactions;
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Query cache managers for this widget.

  final _allTransactionsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> allTransactions({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _allTransactionsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllTransactionsCache() => _allTransactionsManager.clear();
  void clearAllTransactionsCacheKey(String? uniqueKey) =>
      _allTransactionsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearAllTransactionsCache();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
