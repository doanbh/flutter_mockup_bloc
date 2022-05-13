import 'package:dio/dio.dart';
import 'package:flutter_mockup_bloc/repository/refresh/refresh_repository.dart';
import 'package:flutter_mockup_bloc/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:flutter_mockup_bloc/utils/exception/un_authorized_error.dart';
import 'package:flutter_mockup_bloc/utils/interceptor/combining_smart_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_mockup_bloc/common/common_export.dart';


@singleton
class NetworkRefreshInterceptor extends SimpleInterceptor {
  final AuthStorage _authStorage;
  final RefreshRepository _refreshRepo;

  final _excludedPaths = [
    'auth',
  ];

  NetworkRefreshInterceptor(
    this._authStorage,
    this._refreshRepo,
  );

  @override
  Future<Object?> onResponse(Response response) {
    _refreshRepo.resetFailure();
    return super.onResponse(response);
  }

  @override
  Future<Object?> onError(DioError error) async {
    final request = error.requestOptions;
    if (_excludedPaths.contains(request.path)) {
      logger.debug('Network refresh interceptor should not intercept');
      return super.onError(error);
    }

    if (error is! UnAuthorizedError) {
      return super.onError(error);
    }

    logger.debug('Refreshing');
    await _refreshRepo.refresh(error);

    final authorizationHeader = '${AppConstants.protectedAuthenticationHeaderPrefix} ${await _authStorage.getAccessToken()}';
    request.headers[AppConstants.authorizationHeader] = authorizationHeader;

    return GetIt.instance.get<Dio>().fetch<dynamic>(request);
  }
}
