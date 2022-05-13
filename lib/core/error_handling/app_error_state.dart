import 'package:dio/dio.dart';
import 'package:flutter_mockup_bloc/core/error_handling/exceptions.dart';

enum AppErrorState {
  lostConnection,
  poorConnection,
  serverDataStructureChanged,
  lookupServerFailure,
  unkownn,
}

extension AppErrorStateExt on AppErrorState {
  String get friendlyMessage {
    switch (this) {
      case AppErrorState.lostConnection:
        return 'Không có kết nối mạng.';
      case AppErrorState.poorConnection:
        return 'Kết nối mạng kém.';
      case AppErrorState.serverDataStructureChanged:
        return 'Có vẻ như ứng dụng cần được cập nhật '
            'phiên bản mới để phản ánh những thay đổi ở phía chúng tôi.';
      case AppErrorState.lookupServerFailure:
        return 'Có vẻ như đã có sự cố xảy ra ở phía chúng tôi, '
            'vui lòng thử lại sau.';
      case AppErrorState.unkownn:
        return 'Đã có lỗi xảy ra, vui lòng thử lại sau.';
    }
  }

  static String getFriendlyRequestResponseError(
    Object e, {
    bool rethrowUnhandled = false,
  }) {
    if (e is String) return e;

    return AppErrorStateExt.getAppErrorState(
      e,
      rethrowUnhandled: rethrowUnhandled,
    ).friendlyMessage;
  }

  static String getFriendlyErrorString(
    Object e, {
    bool rethrowUnhandled = false,
  }) =>
      getFriendlyRequestResponseError(e, rethrowUnhandled: rethrowUnhandled);

  static AppErrorState getAppErrorState(
    Object e, {
    bool rethrowUnhandled = false,
  }) {
    if (e is NoConnectionException) return AppErrorState.lostConnection;
    if (e is PoorConnectionException) return AppErrorState.poorConnection;
    if (e is InternalServerException) return AppErrorState.lookupServerFailure;
    if (e is DataParsingException)
      return AppErrorState.serverDataStructureChanged;
    if (e is DioError && e.message.contains('SocketException'))
      return AppErrorState.lostConnection;

    if (rethrowUnhandled) throw e;

    return AppErrorState.unkownn;
  }
}
