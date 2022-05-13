import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Controls specific aspects of the operating system's graphical interface and
/// how it interacts with the application.
extension SystemChromeExtension on SystemChrome {
  static void hideKeyboardIfVisible() =>
      FocusManager.instance.primaryFocus?.unfocus();

  static Future<void> allowVerticalPortraitOnly() =>
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
}
