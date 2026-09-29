// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> getChargeTransaction(
  String chargeBoxId,
  int connectorId,
  String idTag,
  List<dynamic> transactions,
) async {
  List<Map<String, dynamic>> matchedTransactions = [];

  for (var transaction in transactions) {
    if (transaction is Map<String, dynamic> &&
        transaction['chargeBoxId'] == chargeBoxId &&
        transaction['connectorId'] == connectorId.toString() &&
        transaction['ocppIdTag'] == idTag) {
      matchedTransactions.add(transaction);
    }
  }

  if (matchedTransactions.isEmpty) {
    return null;
  }

  // Sort the one with the highest transactionId
  matchedTransactions.sort((a, b) {
    final int aId = int.tryParse(a['transactionId'] ?? '0') ?? 0;
    final int bId = int.tryParse(b['transactionId'] ?? '0') ?? 0;
    return bId.compareTo(aId); // Descending order
  });

  return matchedTransactions.first;
}
