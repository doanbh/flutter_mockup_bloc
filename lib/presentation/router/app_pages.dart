import 'package:flutter_mockup_bloc/presentation/modules/navigation/navigation_screen.dart';
import 'package:flutter_mockup_bloc/presentation/router/app_router.dart' as trans
    show Transition;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/presentation/modules/auth/login/login_screen.dart';
import 'package:flutter_mockup_bloc/presentation/router/page_config.dart';
import 'package:flutter_mockup_bloc/presentation/screens/splash_screen.dart';
import 'package:flutter_mockup_bloc/repository/auth/user_info_repository.dart';
import 'package:flutter_mockup_bloc/utils/device/system_utils.dart';

enum AppPages {
  Splash,
  Initial,
  //
  Auth_Login,
  //
  Navigation,
  //
}

String _getPageArgumentErrorString(List<String> args) => args.join(', ');

Never _areRequired(List<String> properties) {
  throw ArgumentError.notNull(_getPageArgumentErrorString(properties));
}

void _checkMissingRequiredArgumentsAndAssureError(
  Map<String, dynamic>? arguments,
  List<String> argNames,
) {
  try {
    if (arguments == null) _areRequired(argNames);

    final List<String> missingArgNames =
        argNames.where((e) => arguments.containsKey(e) == false).toList();

    if (missingArgNames.isNotEmpty) _areRequired(missingArgNames);
  } catch (e) {
    SystemUtils.debugLog('AppRouter', e.toString());

    rethrow;
  }
}

final RegExp _keyPattern = RegExp('(?<=[a-z])[A-Z]');

extension AppPagesExtension on AppPages {
  String get key => this
      .toString()
      .split('.')
      .last
      .replaceAll(r'_', '.')
      .replaceAllMapped(
        _keyPattern,
        (Match m) => "_${m.group(0) ?? ''}",
      )
      .toLowerCase();

  String get path => "/${this.key.replaceAll(r'.', '/')}";

  String get name => path;

  static PageConfig getPageConfig(
    AppPages page,
    Map<String, dynamic>? arguments,
  ) {
    switch (page) {
      case AppPages.Splash:
        return PageConfig()..pageBuilder = () => SplashScreen();

      // TODO: Handle this case.
      case AppPages.Initial:
      case AppPages.Auth_Login:
        final VoidCallback? onSuccess = arguments?['onSuccess'];
        final bool? canNavigateBack = arguments?['canNavigateBack'];

        return PageConfig()
          ..pageBuilder = () => LoginScreen(
          );
      case AppPages.Navigation:
        // _checkMissingRequiredArgumentsAndAssureError(
        //   arguments,
        //   ['userRepository'],
        // );
        final UserInfoRepository userRepository = arguments!['userRepository'];
        return PageConfig()..pageBuilder = () => RepositoryProvider(
          create: (_) => userRepository,
          child: NavigationScreen(),
        );
      default:
        throw StateError(
            "Missing page: ${page.toString()} in AppPagesExtension.getPageConfig()");
    }
  }
}
