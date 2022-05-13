import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_mockup_bloc/utils/exception/network_error.dart';
import 'package:flutter_mockup_bloc/utils/locale/localization_keys.dart';

class InternalServerError extends NetworkError {
  static const statusCode = HttpStatus.internalServerError;

  InternalServerError(DioError dioError, {String? statusCode}) : super(dioError, statusCodeValue: statusCode);

  @override
  String getLocalizedKey() => LocalizationKeys.errorInternalServer;

  @override
  String? get getErrorCode {
    if (statusCodeValue == null) return '$statusCode';
    return '$statusCode [$statusCodeValue]';
  }
}
