// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

class QrCodeBlockchainDisplay extends StatelessWidget {
  const QrCodeBlockchainDisplay({
    super.key,
    this.width,
    this.height,
    required this.encodedStr,
  });

  final double? width;
  final double? height;
  final String encodedStr;

  @override
  Widget build(BuildContext context) {
    try {
      final cleaned = encodedStr.replaceAll('data:image/png;base64,', '');
      return Image.memory(
        base64Decode(cleaned),
        width: width,
        height: height,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            color: Colors.grey[300],
            child: const Icon(Icons.error, color: Colors.red),
          );
        },
      );
    } catch (e) {
      return Container(
        width: width,
        height: height,
        color: Colors.grey[300],
        child: const Center(
          child: Text('Invalid image data'),
        ),
      );
    }
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
