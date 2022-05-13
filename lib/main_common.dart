import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_mockup_bloc/architecture.dart';
import 'package:flutter_mockup_bloc/utils/logging/logging.dart';
import 'package:flutter_mockup_bloc/utils/web/app_configurator.dart' if (dart.library.html) 'package:flutter_mockup_bloc/utils/web/app_configurator_web.dart';

Future<void> _setupCrashLogging() async {
  final originalOnError = FlutterError.onError;
  FlutterError.onError = (errorDetails) async {
    originalOnError?.call(errorDetails);
  };
}

FutureOr<R>? wrapMain<R>(FutureOr<R> Function() appCode) {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureWebApp();
    await _setupCrashLogging();
    await initArchitecture();

    return await appCode();
  }, (object, trace) {
    try {
      WidgetsFlutterBinding.ensureInitialized();
    } catch (_) {}

    try {
      staticLogger.e('Zone error', error: object, trace: trace);
    } catch (_) {
      // ignore: avoid_print
      print(object);
      // ignore: avoid_print
      print(trace);
    }

  });
}