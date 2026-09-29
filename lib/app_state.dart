import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _UserId = await secureStorage.getInt('ff_UserId') ?? _UserId;
    });
    await _safeInitAsync(() async {
      _UseEmail = await secureStorage.getString('ff_UseEmail') ?? _UseEmail;
    });
    await _safeInitAsync(() async {
      _UserOcpp = await secureStorage.getString('ff_UserOcpp') ?? _UserOcpp;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _UserId = 0;
  int get UserId => _UserId;
  set UserId(int value) {
    _UserId = value;
    secureStorage.setInt('ff_UserId', value);
  }

  void deleteUserId() {
    secureStorage.delete(key: 'ff_UserId');
  }

  String _UseEmail = '';
  String get UseEmail => _UseEmail;
  set UseEmail(String value) {
    _UseEmail = value;
    secureStorage.setString('ff_UseEmail', value);
  }

  void deleteUseEmail() {
    secureStorage.delete(key: 'ff_UseEmail');
  }

  String _UserPassword = '';
  String get UserPassword => _UserPassword;
  set UserPassword(String value) {
    _UserPassword = value;
  }

  double _UserBalance = 0.0;
  double get UserBalance => _UserBalance;
  set UserBalance(double value) {
    _UserBalance = value;
  }

  dynamic _BoxIdStatus;
  dynamic get BoxIdStatus => _BoxIdStatus;
  set BoxIdStatus(dynamic value) {
    _BoxIdStatus = value;
  }

  int _setAmountCharger = 0;
  int get setAmountCharger => _setAmountCharger;
  set setAmountCharger(int value) {
    _setAmountCharger = value;
  }

  String _UserOcpp = '';
  String get UserOcpp => _UserOcpp;
  set UserOcpp(String value) {
    _UserOcpp = value;
    secureStorage.setString('ff_UserOcpp', value);
  }

  void deleteUserOcpp() {
    secureStorage.delete(key: 'ff_UserOcpp');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
