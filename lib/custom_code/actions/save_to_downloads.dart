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

Future<String> saveToDownloads(String base64String, String fileName) async {
  try {
    // 1. ลบ prefix (data:image/png;base64, ...)
    final String cleanBase64 = base64String.contains(',')
        ? base64String.split(',').last
        : base64String;

    // 2. แปลงเป็น bytes
    final Uint8List imageBytes = base64Decode(cleanBase64);

    // 3. ขอสิทธิ์ที่ถูกต้องตามแพลตฟอร์ม
    if (Platform.isAndroid) {
      // Android 13+ ต้องใช้ Permission.photos หรือ manageExternalStorage
      var status = await Permission.photos.request();
      if (!status.isGranted) {
        status = await Permission.manageExternalStorage.request();
      }
      if (!status.isGranted) {
        return "ขอสิทธิ์ไม่ผ่าน\nกรุณาไปที่ การตั้งค่า > แอป > EV Charger > สิทธิ์ > อนุญาต \"ไฟล์และสื่อ\" หรือ \"จัดการไฟล์ทั้งหมด\"";
      }
    } else if (Platform.isIOS) {
      // iOS ต้องขอสิทธิ์ Photos เพื่อบันทึกลง Gallery
      final status = await Permission.photos.request();
      if (!status.isGranted) {
        return "ขอสิทธิ์ไม่ผ่าน\nกรุณาเปิดการตั้งค่า > ความเป็นส่วนตัว > รูปภาพ > อนุญาตให้แอปเข้าถึง";
      }
    }

    // 4. กำหนดโฟลเดอร์ปลายทางที่ "ผู้ใช้เห็นได้จริง"
    String savePath;
    if (Platform.isAndroid) {
      // วิธีที่ทำงานจริง 100% บน Android ทุกเครื่อง (Scoped Storage)
      const String primaryPath = "/storage/emulated/0/Download";
      const String altPath = "/storage/emulated/0/Downloads";
      if (await Directory(primaryPath).exists()) {
        savePath = primaryPath;
      } else if (await Directory(altPath).exists()) {
        savePath = altPath;
      } else {
        return "ไม่พบโฟลเดอร์ Downloads บนเครื่องนี้";
      }
    } else {
      // iOS: บันทึกลง Documents (ผู้ใช้เห็นในแอป Files)
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      savePath = appDocDir.path;
    }

    // 5. สร้างโฟลเดอร์ถ้ายังไม่มี + บันทึกไฟล์
    final Directory dir = Directory(savePath);
    if (!await dir.exists()) await dir.create(recursive: true);

    final String fullPath = "$savePath/$fileName.png";
    final File file = File(fullPath);
    await file.writeAsBytes(imageBytes);

    // 6. ผลลัพธ์ตามแพลตฟอร์ม
    if (Platform.isAndroid) {
      return "บันทึกสำเร็จแล้ว!\n\nไฟล์: $fileName.png\nตำแหน่ง: โฟลเดอร์ Downloads\n(เปิดแอป \"ไฟล์\" หรือ \"Files\" แล้วเลื่อนหาได้เลย)";
    } else {
      return "บันทึกสำเร็จแล้ว!\n\nไฟล์: $fileName.png\nตำแหน่ง: แอป Files > On My iPhone > [ชื่อแอปของคุณ]";
    }
  } catch (e) {
    return "เกิดข้อผิดพลาด:\n$e";
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
