import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

String? checkBoxIdStatus(
  String? boxID,
  dynamic boxStatus,
  int? connectorID,
) {
// เอา list ข้อมูลจาก json
  if (boxStatus == null ||
      !boxStatus.containsKey('data') ||
      !(boxStatus['data'] is List)) {
    return '... In progress.';
  }
  List<dynamic> dataList = boxStatus['data'];

  // หาใน data list
  for (var item in dataList) {
    if ((item['ChargeBoxID'] == boxID) &&
        (item['ConnectorID'] == connectorID)) {
      return item['Status'] ?? 'Unknown'; // คืนค่า Status ถ้าเจอ
    }
  }

  // ถ้าไม่เจอเลย
  return 'Not found';
}

String? checkBoxIdTransection(
  String? boxID,
  dynamic boxStatus,
  String? connectorID,
) {
// เอา list ข้อมูลจาก json
  List<dynamic> dataList = boxStatus['data'];
  print('dataList = $dataList');
  // หาใน data list
  for (var item in dataList) {
    if ((item['chargeBoxId'] == boxID) &&
        (item['connectorId'] == connectorID)) {
      return item['transactionId'] ?? 'Unknown'; // คืนค่า Status ถ้าเจอ
    }
  }

  // ถ้าไม่เจอเลย
  return 'Not found';
}

Color getRowColor(int? index) {
  if (index == null) return Color(0xFFC1D8C3);

  if (index % 2 == 0) {
    return Color(0xFF6DE1D2);
  } else {
    return Color(0xFFC1D8C3);
  }
}

String getPowerFormate(String input) {
  String cleanInput = input.replaceAll(',', '');

  if (cleanInput.isEmpty) return '0';

  double? number = double.tryParse(cleanInput);
  if (number == null) return input;

  double divided = number / 1000;
  String result = divided.toStringAsFixed(2); // Keep 2 decimal places

  List<String> parts = result.split('.');

  // Add commas to the integer part
  parts[0] = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

  return '${parts[0]}.${parts[1]}';
}

dynamic searchJSONList(
  String searchText,
  List<dynamic> inputList,
) {
  String cleanSearchText = searchText
      .trim() // ลบช่องว่างหน้าหลัง
      .replaceAll('\n', '') // ลบ enter/newline
      .replaceAll('\r', '') // ลบ carriage return
      .replaceAll('"', '') // ลบ double quote
      .replaceAll("'", '') // ลบ single quote
      .toLowerCase();

  // Return original list if search text is empty after cleaning
  if (cleanSearchText.isEmpty) {
    return List<dynamic>.from(inputList);
  }

  // Create a new list to store results
  List<dynamic> results = [];

  // Iterate through the input list
  for (var item in inputList) {
    try {
      // Convert item to Map
      Map<String, dynamic> station = item as Map<String, dynamic>;

      // Clean and search in station name
      String stationName = (station['station'] ?? '')
          .toString()
          .replaceAll('"', '')
          .replaceAll("'", '')
          .toLowerCase();
      if (stationName.contains(cleanSearchText)) {
        results.add(item);
        continue;
      }

      // Clean and search in address (handle null addresses)
      String address = (station['address'] ?? '')
          .toString()
          .replaceAll('"', '')
          .replaceAll("'", '')
          .toLowerCase();
      if (address.contains(cleanSearchText)) {
        results.add(item);
        continue;
      }

      // Search in box_id array
      if (station['box_id'] != null && station['box_id'] is List) {
        List<dynamic> boxIds = station['box_id'];
        bool found = false;
        for (var boxId in boxIds) {
          String boxIdStr = boxId
              .toString()
              .replaceAll('"', '')
              .replaceAll("'", '')
              .toLowerCase();
          if (boxIdStr.contains(cleanSearchText)) {
            found = true;
            break;
          }
        }
        if (found) {
          results.add(item);
          continue;
        }
      }
    } catch (e) {
      // Skip invalid items
      continue;
    }
  }

  return results;
}

String? formatNumberWithCommas(String number) {
  final parsed = num.tryParse(number.replaceAll(',', ''));
  if (parsed == null) return null;
  final formatter = NumberFormat('#,##0.##');
  return formatter.format(parsed);
}

String? setDateTimeThailand(String? dateTime) {
  if (dateTime == null) return null;

  final parsedUtc = DateTime.parse(dateTime);

  // Convert to Thailand time
  final thailandTime = parsedUtc.add(Duration(hours: 7));

  // Format to desired output
  return DateFormat('dd MMM yyyy | HH:mm').format(thailandTime);
}

String formatMilliseconds(int totalMilliseconds) {
  int days = totalMilliseconds ~/ (1000 * 60 * 60 * 24);
  int hours = (totalMilliseconds ~/ (1000 * 60 * 60)) % 24;
  int minutes = (totalMilliseconds ~/ (1000 * 60)) % 60;
  int seconds = (totalMilliseconds ~/ 1000) % 60;
  int milliseconds = totalMilliseconds % 1000;

  String result = '';
  if (days > 0) {
    result += '${days}d ';
  }
  if (hours > 0) {
    result += '${hours}h ';
  }
  if (minutes > 0) {
    result += '${minutes}m ';
  }
  if (seconds > 0) {
    result += '${seconds}s ';
  }

  if (result.isEmpty || milliseconds > 0) {
    result += '${milliseconds}ms';
  }

  return result.trim();
}

List<LatLng>? adjustToLatLng(List<String>? coordinate) {
  if (coordinate == null) return null;
  List<LatLng> latLngList = [];

  for (String? coord in coordinate) {
    if (coord != null) {
      List<String> latLngParts = coord.split(',');
      if (latLngParts.length == 2) {
        double latitude = double.tryParse(latLngParts[0]) ?? 0.0;
        double longitude = double.tryParse(latLngParts[1]) ?? 0.0;
        latLngList.add(LatLng(latitude, longitude));
      }
    }
  }

  return latLngList;
}

dynamic calculateChargingExpense(
  String startVal,
  int lastVal,
  double scaling,
  int pricePerKWh,
) {
  try {
    // Parse strings to double
    final double start = double.tryParse(startVal) ?? 0.0;
    final double stop = lastVal.toDouble();

    if (stop < start) {
      return {
        "energyUsed": 0.0,
        "cost": 0.0,
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
    };
  }
}

String getLatestStatus(dynamic data) {
  Map<String, dynamic>? latestItem;
  var latestTs = 0.0;

  for (final item in data) {
    if (item is! Map) continue;

    final tsRaw = item['Timestamp'];
    if (tsRaw == null) continue;

    final tsStr = tsRaw.toString();
    final ts = double.tryParse(tsStr);

    if (ts == null) continue;

    if (ts > latestTs) {
      latestTs = ts;
      latestItem = item as Map<String, dynamic>;
    }
  }

  return latestItem?['Status']?.toString() ?? 'Charging';
}

dynamic filterByDateRange(
  dynamic data,
  String? range,
) {
  final nowThai = DateTime.now().toUtc().add(const Duration(hours: 7));
  DateTime startDate;

  switch (range) {
    case 'Today':
      startDate = DateTime(
        nowThai.year,
        nowThai.month,
        nowThai.day,
      );
      break;

    case '7Days':
      startDate = nowThai.subtract(const Duration(days: 7));
      break;

    case '1Month':
      startDate = DateTime(
        nowThai.year,
        nowThai.month - 1,
        nowThai.day,
      );
      break;

    case '3Months':
      startDate = DateTime(
        nowThai.year,
        nowThai.month - 3,
        nowThai.day,
      );
      break;

    case '6Months':
      startDate = DateTime(
        nowThai.year,
        nowThai.month - 6,
        nowThai.day,
      );
      break;

    case '1Year':
      startDate = DateTime(
        nowThai.year - 1,
        nowThai.month,
        nowThai.day,
      );
      break;

    default:
      return data;
  }

  return data.where((item) {
    final updatedAt = item['updated_at'];
    if (updatedAt == null) return false;

    final utcDate = DateTime.tryParse(updatedAt);
    if (utcDate == null) return false;

    final thaiDate = utcDate.toUtc().add(const Duration(hours: 7));

    return thaiDate.isAfter(startDate);
  }).toList();

  // return data;
}

List<dynamic>? filterByType(
  dynamic data,
  String typesJson,
) {
  final decoded = jsonDecode(typesJson) as List;
  final typeList =
      decoded.map((e) => e.toString().trim().toLowerCase()).toList();

  return data.where((item) {
    if (item is! Map) return false;

    final itemType = item['type']?.toString().trim().toLowerCase();

    return itemType != null && typeList.contains(itemType);
  }).toList();
}
