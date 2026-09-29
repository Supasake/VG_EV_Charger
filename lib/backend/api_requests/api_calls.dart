import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SteveOCCP-ExtApi Group Code

class SteveOCCPExtApiGroup {
  static String getBaseUrl() =>
      'https://www.thaicloud.co/ev-management/public/api';
  static Map<String, String> headers = {};
  static GetChargerStatusCall getChargerStatusCall = GetChargerStatusCall();
  static GetTransactionsCall getTransactionsCall = GetTransactionsCall();
  static GetTransactionsAllCall getTransactionsAllCall =
      GetTransactionsAllCall();
  static GetChargeDataByTransactionCall getChargeDataByTransactionCall =
      GetChargeDataByTransactionCall();
  static GetAllChargerStatusCall getAllChargerStatusCall =
      GetAllChargerStatusCall();
  static RemoteStartTransactionCall remoteStartTransactionCall =
      RemoteStartTransactionCall();
  static RemoteStopTransactionCall remoteStopTransactionCall =
      RemoteStopTransactionCall();
  static LoginCall loginCall = LoginCall();
  static GetAvaliableStationsCall getAvaliableStationsCall =
      GetAvaliableStationsCall();
  static ActiveChargingPointDetailsCall activeChargingPointDetailsCall =
      ActiveChargingPointDetailsCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
  static RegisterCall registerCall = RegisterCall();
  static WalletHistoryCall walletHistoryCall = WalletHistoryCall();
  static TopupCall topupCall = TopupCall();
  static BalanceCall balanceCall = BalanceCall();
  static ChargeCall chargeCall = ChargeCall();
  static BlockchainTopupCall blockchainTopupCall = BlockchainTopupCall();
}

class GetChargerStatusCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Charger Status',
      apiUrl: '${baseUrl}/statusCP',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic ${basicAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? chargrBoxId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].chargeBoxId''',
      ));
  String? connectedSince(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].connectedSince''',
      ));
  String? ocppVersion(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].ocppVersion''',
      ));
  String? connectionDuration(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].connectionDuration''',
      ));
}

class GetTransactionsCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Transactions',
      apiUrl: '${baseUrl}/transactions',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic ${basicAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetTransactionsAllCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Transactions All',
      apiUrl: '${baseUrl}/transactionsAll',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic ${basicAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetChargeDataByTransactionCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
    String? transactionPk = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Charge Data by Transaction',
      apiUrl: '${baseUrl}/transactionsAll',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic ${basicAuth}',
      },
      params: {
        'transaction_pk': transactionPk,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? chargingData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? startValue(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].start_value''',
      ));
  String? stopValue(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].stop_value''',
      ));
}

class GetAllChargerStatusCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get All Charger Status',
      apiUrl: '${baseUrl}/connectorStatus',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic ${basicAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? stationData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class RemoteStartTransactionCall {
  Future<ApiCallResponse> call({
    String? chargeBox = '',
    String? idTag = '',
    String? ch = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "chargeBox": "${escapeStringForJson(chargeBox)}",
  "idTag": "${escapeStringForJson(idTag)}",
  "ch": "${escapeStringForJson(ch)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Remote Start Transaction',
      apiUrl: '${baseUrl}/RemoteStartTransaction',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoteStopTransactionCall {
  Future<ApiCallResponse> call({
    String? chargeBox = '',
    String? transectionID = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "chargeBox": "${escapeStringForJson(chargeBox)}",
  "transectionID": "${escapeStringForJson(transectionID)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Remote Stop Transaction',
      apiUrl: '${baseUrl}/RemoteStopTransaction',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'email': email,
        'password': password,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAvaliableStationsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Avaliable Stations',
      apiUrl: '${baseUrl}/station',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allStation(dynamic response) => getJsonField(
        response,
        r'''$.stations''',
        true,
      ) as List?;
  List<String>? latLong(dynamic response) => (getJsonField(
        response,
        r'''$.stations[:].latlong''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? energyPrice(dynamic response) => (getJsonField(
        response,
        r'''$.stations[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class ActiveChargingPointDetailsCall {
  Future<ApiCallResponse> call({
    String? chargingTerminal = '',
    String? chargingPoint = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "ChargeBoxID": "${escapeStringForJson(chargingTerminal)}",
  "ConnectorID": "${escapeStringForJson(chargingPoint)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Active Charging Point Details',
      apiUrl: '${baseUrl}/connectorStatus_chargebox',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic allChargingData(dynamic response) => getJsonField(
        response,
        r'''$.data[0]''',
      );
  dynamic chargingDetails(dynamic response) => getJsonField(
        response,
        r'''$.data[:].latest_meter_data''',
      );
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].Status''',
      ));
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? email = 'palasri.sp@gmail.com',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Forgot Password',
      apiUrl: '${baseUrl}/forgot-password',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? passwordConfirmation = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}",
  "password_confirmation": "${escapeStringForJson(passwordConfirmation)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: '${baseUrl}/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WalletHistoryCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Wallet History',
      apiUrl: '${baseUrl}/topup/user/${userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allTransactions(dynamic response) => getJsonField(
        response,
        r'''$.transactions''',
        true,
      ) as List?;
  List? status(dynamic response) => getJsonField(
        response,
        r'''$.transactions[:].status''',
        true,
      ) as List?;
  List<String>? type(dynamic response) => (getJsonField(
        response,
        r'''$.transactions[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? amount(dynamic response) => (getJsonField(
        response,
        r'''$.transactions[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lastUpdated(dynamic response) => (getJsonField(
        response,
        r'''$.transactions[:].updated_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.transactions[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? ref(dynamic response) => (getJsonField(
        response,
        r'''$.transactions[:].reference''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? created(dynamic response) => (getJsonField(
        response,
        r'''$.transactions[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class TopupCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    String? amount = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": ${escapeStringForJson(userId)},
  "type": "${escapeStringForJson(type)}",
  "amount": "${escapeStringForJson(amount)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Topup',
      apiUrl: '${baseUrl}/topup',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BalanceCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Balance',
      apiUrl: '${baseUrl}/balance/${userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  double? balance(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.balance''',
      ));
}

class ChargeCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    double? amount,
    String? description = '',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": ${escapeStringForJson(userId)},
  "amount": ${amount},
  "description": "${escapeStringForJson(description)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Charge',
      apiUrl: '${baseUrl}/charge',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  double? newBalance(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.new_balance''',
      ));
  dynamic transaction(dynamic response) => getJsonField(
        response,
        r'''$.transaction''',
      );
  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.transaction.amount''',
      ));
}

class BlockchainTopupCall {
  Future<ApiCallResponse> call({
    String? amountTH = '',
    String? userID = '',
    String? memo = 'test 100',
    String? webhook =
        'https://www.thaicloud.co/ev-management/public/api/notifyblockchain',
  }) async {
    final baseUrl = SteveOCCPExtApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": ${escapeStringForJson(userID)},
  "amount_thb": ${escapeStringForJson(amountTH)},
  "memo": "${escapeStringForJson(memo)}",
  "webhook_url": "${escapeStringForJson(webhook)}",
  "metadata": {
        "order_id": "12345",
        "customer_id": "cust_abc",
        "store_id": "store_123"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'BlockchainTopup',
      apiUrl: '${baseUrl}/createinvoiceblockchain',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SteveOCCP-ExtApi Group Code

/// Start Lightning Cypto Wallet Group Code

class LightningCyptoWalletGroup {
  static String getBaseUrl() => 'https://lightning-ev-charger.fly.dev';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer test_key_1234567890',
  };
  static TopupInvoiceCall topupInvoiceCall = TopupInvoiceCall();
}

class TopupInvoiceCall {
  Future<ApiCallResponse> call({
    int? amountThb = 0,
    String? memo = ' ',
    String? webhookUrl = ' ',
    String? userId = '',
  }) async {
    final baseUrl = LightningCyptoWalletGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "amount_thb": ${amountThb},
  "memo": "${escapeStringForJson(memo)}",
  "webhook_url": "${escapeStringForJson(webhookUrl)}",
  "metadata": {
    "customer_id": "${escapeStringForJson(userId)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TopupInvoice',
      apiUrl: '${baseUrl}/api/v1/lightning/invoice/external',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer test_key_1234567890',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? response(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

/// End Lightning Cypto Wallet Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
