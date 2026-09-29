// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> saveImageToDownloads(
    String base64String, String fileName) async {
  try {
    // 1. Clean base64 (remove data:image/png;base64, prefix)
    final String base64Data = base64String.contains(',')
        ? base64String.split(',').last
        : base64String;

    // 2. Convert base64 → bytes
    final Uint8List bytes = base64Decode(base64Data);

    // 3. Request permission (Android only)
    if (Platform.isAndroid) {
      final status = await Permission.manageExternalStorage.request();
      // Fallback for older Android
      if (!status.isGranted) {
        await Permission.storage.request();
      }
    }

    // 4. Get Downloads folder (visible in Files / Downloads)
    final Directory? downloadsDir = await getExternalStorageDirectory();
    if (downloadsDir == null) {
      return "Error: Cannot access storage";
    }

    // Create "Downloads" subfolder if you want
    final String savePath =
        "${downloadsDir.parent.parent.parent.parent.path}/Download";
    final Directory finalDir = Directory(savePath);
    if (!await finalDir.exists()) await finalDir.create(recursive: true);

    // 5. Save file
    final String fullPath = "$savePath/$fileName.png";
    final File file = File(fullPath);
    await file.writeAsBytes(bytes);

    return "Success: Saved to Downloads!\n$fullPath";
  } catch (e) {
    return "Error: $e";
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
