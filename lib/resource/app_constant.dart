import 'package:flutter/foundation.dart';

class AppConstants {

  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction  = kReleaseMode;

  static bool isDriverTest  = false;
  static bool isUnitTest  = false;
  
  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';
  
  static const String keyGuide = 'keyGuide';
  static const String phone = 'phone';
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  static const String theme = 'AppTheme';
  static const String locale = 'locale';

  static const basicAuthPrefixHeader = 'Basic';
  static const protectedAuthenticationHeaderPrefix = 'Bearer';
  static const authorizationHeader = 'Authorization';

  static const String not_update = 'not_update';
  static const String login = 'auth';

  static const Duration timesToFetchCommonDataAgain = Duration(days: 3);

  static const errorHappened = 'Đã có lỗi xảy ra';
  static const errorHappenedTryAgain = "$errorHappened, vui lòng thử lại sau.";

  //
  static const String user_name_input_hint = 'Enter email';
  static const String password_input_hint = 'Enter password';

  static const String user_name_input = 'Email';
  static const String password_input = 'Password';

  static const String agree = 'OK';
  static const String cancel = 'Huỷ bỏ';

  static const String signUp = 'Đăng ký';
  static const String signOut = 'Đăng xuất';

  static const String featureInDevelopment = 'Chức năng đang phát triển';

  static const String logo_app = 'https://meterpreter.org/wp-content/uploads/2018/09/flutter.png';

}
