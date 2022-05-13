import 'package:dio/dio.dart';
import 'package:flutter_mockup_bloc/common/common_export.dart';
import 'package:flutter_mockup_bloc/utils/exception/bad_request_error.dart';
import 'package:flutter_mockup_bloc/utils/exception/code_error.dart';
import 'package:flutter_mockup_bloc/utils/exception/forbidden_error.dart';
import 'package:flutter_mockup_bloc/utils/exception/general_error.dart';
import 'package:flutter_mockup_bloc/utils/exception/internal_server_error.dart';
import 'package:flutter_mockup_bloc/utils/exception/no_internet_error.dart';
import 'package:flutter_mockup_bloc/utils/exception/un_authorized_error.dart';
import 'package:flutter_mockup_bloc/utils/interceptor/combining_smart_interceptor.dart';
import 'package:injectable/injectable.dart';

@singleton
class NetworkErrorInterceptor extends SimpleInterceptor {
  final ConnectivityHelper connectivityHelper;

  NetworkErrorInterceptor(this.connectivityHelper);

  @override
  Future<Object?> onRequest(RequestOptions options) async {
    final hasConnection = await connectivityHelper.hasConnection();
    if (!hasConnection) throw NoNetworkError();
    return super.onRequest(options);
  }

  @override
  Future<Object?> onError(DioError? error) async {
    try {
      if (error == null) return CodeError();
      if (error.error is NoNetworkError) return NoInternetError(error);
      if (error.response == null) return CodeError();
      final statusCode = error.response?.statusCode;
      switch (statusCode) {
        case UnAuthorizedError.statusCode:
          return UnAuthorizedError(error);
        case BadRequestError.statusCode:
          return BadRequestError.parseError(error);
        case ForbiddenError.statusCode:
          return ForbiddenError.parseError(error);
        case InternalServerError.statusCode:
          return InternalServerError(error);
        default:
          return GeneralNetworkError(error);
      }
    } catch (e, stack) {
      logger.error('Failed to get correct error', error: e, trace: stack);
      return CodeError();
    }
  }
}
