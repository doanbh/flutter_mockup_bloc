import 'package:dio/dio.dart';
import 'package:flutter_mockup_bloc/utils/exception/network_error.dart';
import 'package:flutter_mockup_bloc/utils/locale/localization_keys.dart';

class GeneralNetworkError extends NetworkError {
  GeneralNetworkError(DioError dioError) : super(dioError);

  @override
  String getLocalizedKey() => LocalizationKeys.errorGeneral;

  @override
  String? get getErrorCode => null;
}
