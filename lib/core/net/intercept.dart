
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:flutter_mockup_bloc/utils/device/device_utils.dart';
import 'package:sp_util/sp_util.dart';
import 'package:sprintf/sprintf.dart';

import 'dio_utils.dart';
import 'error_handle.dart';
import 'package:flutter_mockup_bloc/common/common_export.dart';
import 'package:flutter_mockup_bloc/utils/device/other_utils.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String accessToken = SpUtil.getString(AppConstants.accessToken).nullSafe;
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'token $accessToken';
    }
    if (!Device.isWeb) {
      options.headers['User-Agent'] = 'Mozilla/5.0';
    }
    super.onRequest(options, handler);
  }
}

class TokenInterceptor extends Interceptor {

  Dio? _tokenDio;

  Future<String?> getToken() async {

    final Map<String, String> params = <String, String>{};
    params['refresh_token'] = SpUtil.getString(AppConstants.refreshToken).nullSafe;
    try {
      _tokenDio ??= Dio();
      _tokenDio!.options = DioUtils.instance.dio.options;
      final Response response = await _tokenDio!.post<dynamic>('login/pathToRefreshToken', data: params);
      if (response.statusCode == ExceptionHandle.success) {
        return (json.decode(response.data.toString()) as Map<String, dynamic>)['access_token'] as String;
      }
    } catch(e) {
      logger.error('Không thể làm mới được token!', error: 'Không thể làm mới được token!');
    }
    return null;
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    //401 token hết hạn
    if (response.statusCode == ExceptionHandle.unauthorized) {
      logger.info('-----------Làm mới Token------------');
      final Dio dio = DioUtils.instance.dio;
      dio.lock();
      final String? accessToken = await getToken(); // Lấy accessToken mới khi token hết hạn
      logger.info('-----------NewToken: $accessToken ------------');
      SpUtil.putString(AppConstants.accessToken, accessToken.nullSafe);
      dio.unlock();

      if (accessToken != null) {
        // Lấy token ko thành công
        final RequestOptions request = response.requestOptions;
        request.headers['Authorization'] = 'Bearer $accessToken';

        final Options options = Options(
          headers: request.headers,
          method: request.method,
        );

        try {
          logger.info('----------- Yêu cầu lại token mới ------------');
          /// Tránh lặp lại bằng cách sử dụng tokenDio
          final Response response = await _tokenDio!.request<dynamic>(request.path,
            data: request.data,
            queryParameters: request.queryParameters,
            cancelToken: request.cancelToken,
            options: options,
            onReceiveProgress: request.onReceiveProgress,
          );
          return handler.next(response);
        } on DioError catch (e) {
          return handler.reject(e);
        }
      }
    }
    super.onResponse(response, handler);
  }
}

class LoggingInterceptor extends Interceptor{

  late DateTime _startTime;
  late DateTime _endTime;
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    logger.debug('----------Start----------');
    if (options.queryParameters.isEmpty) {
      logger.debug('RequestUrl: ${options.baseUrl}${options.path}');
    } else {
      logger.debug('RequestUrl: ${options.baseUrl}${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}');
    }
    logger.debug('RequestMethod: ${options.method}');
    logger.debug('RequestHeaders:${options.headers}');
    logger.debug('RequestContentType: ${options.contentType}');
    logger.debug('RequestData: ${options.data.toString()}');
    super.onRequest(options, handler);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    final int duration = _endTime.difference(_startTime).inMilliseconds;
    if (response.statusCode == ExceptionHandle.success) {
      logger.debug('ResponseCode: ${response.statusCode}');
    } else {
      logger.e('ResponseCode: ${response.statusCode}');
    }
    // in đầu ra
    logger.info(response.data.toString());
    logger.debug('----------End in: $duration seconds----------');
    super.onResponse(response, handler);
  }
  
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.debug('----------Error-----------');
    super.onError(err, handler);
  }
}

class AdapterInterceptor extends Interceptor{

  static const String _kMsg = 'msg';
  static const String _kSlash = "'";
  static const String _kMessage = 'message';

  static const String _kDefaultText = 'Không có thông tin trả lại';
  static const String _kNotFound = 'Không tìm thấy thông tin truy vấn';

  static const String _kFailureFormat = '{"code":%d,"message":"%s"}';
  static const String _kSuccessFormat = '{"code":0,"data":%s,"message":""}';
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final Response r = adapterData(response);
    super.onResponse(r, handler);
  }
  
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      adapterData(err.response!);
    }
    super.onError(err, handler);
  }

  Response adapterData(Response response) {
    String result;
    String content = response.data?.toString() ?? '';
    /// Khi thành công, hãy định dạng trả lại trực tiếp
    if (response.statusCode == ExceptionHandle.success || response.statusCode == ExceptionHandle.success_not_content) {
      if (content.isEmpty) {
        content = _kDefaultText;
      }
      result = sprintf(_kSuccessFormat, [content]);
      response.statusCode = ExceptionHandle.success;
    } else {
      if (response.statusCode == ExceptionHandle.not_found) {
        /// Sau khi định dạng dữ liệu lỗi, trả về theo dữ liệu thành công
        result = sprintf(_kFailureFormat, [response.statusCode, _kNotFound]);
        response.statusCode = ExceptionHandle.success;
      } else {
        if (content.isEmpty) {
          // ngắt kết nối mạng
          result = content;
        } else {
          String msg;
          try {
            content = content.replaceAll(r'\', '');
            if (_kSlash == content.substring(0, 1)) {
              content = content.substring(1, content.length - 1);
            }
            final Map<String, dynamic> map = json.decode(content) as Map<String, dynamic>;
            if (map.containsKey(_kMessage)) {
              msg = map[_kMessage] as String;
            } else if (map.containsKey(_kMsg)) {
              msg = map[_kMsg] as String;
            } else {
              msg = 'Ngoại lệ không xác định';
            }
            result = sprintf(_kFailureFormat, [response.statusCode, msg]);
            // 401 Token không hợp lệ, nó sẽ được xử lý riêng và những mã khác sẽ thành công.
            if (response.statusCode == ExceptionHandle.unauthorized) {
              response.statusCode = ExceptionHandle.unauthorized;
            } else {
              response.statusCode = ExceptionHandle.success;
            }
          } catch (e) {
            logger.e('Thông tin ngoại lệ：$e');
            // Các ngoại lệ phân tích cú pháp được xử lý trực tiếp theo dữ liệu ban đầu được trả về (thông thường, 500.503 mã trang HTML được trả về)
            result = sprintf(_kFailureFormat, [response.statusCode, 'Máy chủ ngoại lệ(${response.statusCode})']);
          }
        }
      }
    }
    response.data = result;
    return response;
  }
}
