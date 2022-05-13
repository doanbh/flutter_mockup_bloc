import 'dart:convert' show JsonCodec;


import 'package:flutter_mockup_bloc/model/status_code.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:flutter_mockup_bloc/utils/device/system_utils.dart';

import 'error.dart';

const _jsonCodec = JsonCodec();

const String _source = 'RequestResponse';

class RequestResponse {
  final dynamic response;
  late final Map<String, dynamic> json;
  final int? code;
  final String? message;
  final dynamic headers;
  Error? error;

  bool get result {
    try {
      return json['data']?['result'] ?? json['error']?['result'] ?? false;
    } catch (e) {
      throw _buildJsonErrorMessage(e, 'result');
    }
  }

  Map<String, dynamic> get data {
    try {
      return code == StatusCode.notFound ? {} : json['data'];
    } catch (e) {
      throw _buildJsonErrorMessage(e, 'data');
    }
  }

  List<dynamic> get items {
    try {
      return code == StatusCode.notFound ? [] : data['items'] ?? [];
    } catch (e) {
      throw _buildJsonErrorMessage(e, 'items');
    }
  }

  int get totalRecords {
    try {
      return data['total'] is String ? int.parse(data['total']) : data['total'];
    } catch (e) {
      throw _buildJsonErrorMessage(e, 'total');
    }
  }

  bool get hasData => json['data'] != null;

  bool get hasError => error != null;

  RequestResponse(this.response, this.code, this.headers, this.message) {
    try {
      json = response is String
          ? _jsonCodec.decode((response as String).trim())
          : response is Map
              ? response
              : {};
      error = json['error'] == null ? null : Error.fromJson(json['error']);
    } catch (e) {
      error = Error(
        code: StatusCode.jsonDecodeError,
        messages: e.toString(),
      );
    }
  }

  static Map<String, dynamic> parseResponseDataString(String str) =>
      RequestResponse(str, StatusCode.ok, null, null).data;

  _buildJsonErrorMessage(Object e, String key) {
    if (error != null) return error!.messages;

    if (e.runtimeType.toString().contains('_TypeError'))
      SystemUtils.debugLog(
        _source,
        '''
${e.toString()}
==> Response json did not contain key: $key
    reponse data: ${response.toString()}
''',
      );

    if (e is NoSuchMethodError) {
      SystemUtils.debugLog(
        _source,
        '''
NoSuchMethodError: The method '[]' was called on null
==> Response json did not contain key: $key
    reponse data: ${response.toString()}
''',
      );

      return AppConstants.errorHappenedTryAgain;
    }

    return e.toString();
  }
}
