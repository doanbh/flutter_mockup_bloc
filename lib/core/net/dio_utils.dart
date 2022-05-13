import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mockup_bloc/model/request_response.dart';
import 'package:flutter_mockup_bloc/model/status_code.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'error_handle.dart';
import 'package:flutter_mockup_bloc/common/common_export.dart';

/// Cấu hình Dio mặc định
int _connectTimeout = 15000;
int _receiveTimeout = 15000;
int _sendTimeout = 10000;
String _baseUrl = '';
List<Interceptor> _interceptors = [];

void configDio({
  int? connectTimeout,
  int? receiveTimeout,
  int? sendTimeout,
  String? baseUrl,
  List<Interceptor>? interceptors,
}) {
  _connectTimeout = connectTimeout ?? _connectTimeout;
  _receiveTimeout = receiveTimeout ?? _receiveTimeout;
  _sendTimeout = sendTimeout ?? _sendTimeout;
  _baseUrl = baseUrl ?? _baseUrl;
  _interceptors = interceptors ?? _interceptors;
}

typedef NetSuccessCallback<T> = Function(T data);
typedef NetSuccessListCallback<T> = Function(List<T> data);
typedef NetErrorCallback = Function(int code, String msg);

class DioUtils {

  factory DioUtils() => _singleton;

  DioUtils._() {
    final BaseOptions options = BaseOptions(
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
      responseType: ResponseType.plain,
      validateStatus: (_) {
        return true;
      },
      baseUrl: _baseUrl,
//      contentType: Headers.formUrlEncodedContentType, // Thích hợp cho việc gửi post-form
    );
    _dio = Dio(options);
//    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//        (HttpClient client) {
//      client.findProxy = (uri) {
//        //proxy all request to localhost:8888
//        return 'PROXY 10.41.0.132:8888';
//      };
//      client.badCertificateCallback =
//          (X509Certificate cert, String host, int port) => true;
//    };

    /// thêm Interceptor
    void addInterceptor(Interceptor interceptor) {
      _dio.interceptors.add(interceptor);
    }
    _interceptors.forEach(addInterceptor);
  }

  static final DioUtils _singleton = DioUtils._();

  static DioUtils get instance => DioUtils();

  static late Dio _dio;

  Dio get dio => _dio;

  // Định dạng trả về dữ liệu thống nhất và xử lý thống nhất các ngoại lệ
  Future<RequestResponse> _request<T>(String method, String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    final Response<String> response = await _dio.request<String>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: _checkOptions(method, options),
      cancelToken: cancelToken,
    );
    try {
      final String data = response.data.toString();
      final bool isCompute = !AppConstants.isDriverTest && data.length > 10 * 1024;
      // debugPrint('isCompute:$isCompute');
      final Map<String, dynamic> map = isCompute ? await compute(parseData, data) : parseData(data);
      final statusCodeFromServer = parseData(response.toString())['code'];
      // print(response);
      // print("response statusCode: ${statusCodeFromServer}");
      // check lai cho nay
      return RequestResponse(map, statusCodeFromServer == 0 ? response.statusCode : statusCodeFromServer, response.headers, parseData(response.toString())['message'] ?? "");
    } catch(e) {
      debugPrint(e.toString());
      return RequestResponse(ExceptionHandle.parse_error, response.statusCode, response.headers, e.toString());
    }
  }

  Options _checkOptions(String method, Options? options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  Future requestNetwork(Method method, String url, {
    NetSuccessCallback<dynamic>? onSuccess,
    NetErrorCallback? onError,
    Object? params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) {
    return _request<RequestResponse>(method.value, url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ).then<void>((RequestResponse result) {
      // print("result.code: ${result.code}");
      // print("result.message: ${result.message}");
      if (result.code == StatusCode.ok) {
        onSuccess?.call(result);
      } else {
        _onError(result.code, result.message!, onError);
      }
    }, onError: (dynamic e) {
      _cancelLogPrint(e, url);
      final NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
    });
  }

  void asyncRequestNetwork<T>(Method method, String url, {
    NetSuccessCallback<dynamic>? onSuccess,
    NetErrorCallback? onError,
    Object? params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) {
    Stream.fromFuture(_request<T>(method.value, url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    )).asBroadcastStream()
        .listen((result) {
      if (result.code == 0) {
        if (onSuccess != null) {
          onSuccess(result.data);
        }
      } else {
        _onError(result.code, result.message!, onError);
      }
    }, onError: (dynamic e) {
      _cancelLogPrint(e, url);
      final NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
    });
  }

  void _cancelLogPrint(dynamic e, String url) {
    if (e is DioError && CancelToken.isCancel(e)) {
      logger.error('Huỷ in log：', error: e.toString());
    }
  }

  void _onError(int? code, String msg, NetErrorCallback? onError) {
    if (code == null) {
      code = ExceptionHandle.unknown_error;
      msg = 'Ngoại lệ không xác định';
    }
    logger.error('Request Exception：', error: 'code: $code, mag: $msg');
    onError?.call(code, msg);
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

enum Method {
  get,
  post,
  put,
  patch,
  delete,
  head
}

extension MethodExtension on Method {
  String get value => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD'][index];
}
