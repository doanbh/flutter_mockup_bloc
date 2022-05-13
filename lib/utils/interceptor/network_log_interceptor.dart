import 'package:dio/dio.dart';
import 'package:flutter_mockup_bloc/utils/exception/general_error.dart';
import 'package:flutter_mockup_bloc/utils/exception/network_error.dart';
import 'package:flutter_mockup_bloc/utils/interceptor/combining_smart_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_mockup_bloc/common/common_export.dart';

@singleton
class NetworkLogInterceptor extends SimpleInterceptor {
  @override
  Future<Object?> onRequest(RequestOptions options) async {
    logger.logNetworkRequest(options);
    return super.onRequest(options);
  }

  @override
  Future<Object?> onResponse(Response response) async {
    logger.logNetworkResponse(response);
    return super.onResponse(response);
  }

  @override
  Future<Object?> onError(DioError error) async {
    if (error is NetworkError) {
      logger.logNetworkError(error);
    } else {
      logger.logNetworkError(GeneralNetworkError(error));
    }
    return super.onError(error);
  }
}
