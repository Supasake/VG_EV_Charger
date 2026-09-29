// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
dynamic calculateChargingCost(
  String startVal,
  int? lastVal,
  double scaling,
  int pricePerKWh,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  try {
    // Parse strings to double
    final double start = double.tryParse(startVal) ?? 0.0;
    final double stop = (lastVal ?? 0.0).toDouble();

    if (stop < start) {
      return {
        "energyUsed": 0.0,
        "cost": 0.0,
        "startValue": startVal,
        "lastValue": lastVal,
        "error": "Stop value is smaller than start value"
      };
    }

    // Energy used (kWh)
    final double energyUsed = (stop - start) * scaling;

    // Cost
    final double cost = energyUsed * pricePerKWh;

    return {
      "energyUsed": double.parse(energyUsed.toStringAsFixed(3)),
      "cost": double.parse(cost.toStringAsFixed(2)),
    };
  } catch (e) {
    return {
      "energyUsed": 0.0,
      "cost": 0.0,
      "startValue": startVal,
      "lastValue": lastVal,
      "error": e.toString(),
    };
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
