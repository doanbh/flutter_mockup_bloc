import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/common/theme/base_theme.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/app_fonts.dart';
import 'package:flutter_mockup_bloc/utils/env/environment_util.dart';
import 'package:flutter_mockup_bloc/utils/env/flavor_config.dart';

import '../../utils/env/os_info.dart';

class FlutterTemplateThemeData {
  FlutterTemplateThemeData._();

  static final _darkThemeData = ThemeData(
    fontFamily: AppFonts.body,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme(
      primary: AppColors.primary,
      primaryContainer: AppColors.primaryDark,
      onPrimary: AppColors.white,
      secondary: AppColors.accent,
      secondaryContainer: AppColors.accent,
      onSecondary: AppColors.white,
      surface: AppColors.backgroundGrey,
      onBackground: AppColors.primary,
      onSurface: AppColors.primary,
      background: AppColors.backgroundGrey,
      onError: AppColors.primaryDark,
      brightness: Brightness.light,
      error: AppColors.error,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.accent,
      selectionHandleColor: AppColors.accent,
      selectionColor: AppColors.accent.withOpacity(0.4),
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: isInTest ? const FadeUpwardsPageTransitionsBuilder() : BaseThemeData.getCorrectPageTransitionBuilder(OsInfo.instance),
      },
    ),
  );

  static final _lightThemeData = _darkThemeData.copyWith();

  static ThemeData darkTheme(TargetPlatform? targetPlatform) {
    return _darkThemeData.copyWith(platform: targetPlatform);
  }

  static ThemeData lightTheme(TargetPlatform? targetPlatform) {
    return _lightThemeData.copyWith(platform: targetPlatform);
  }
}

class FlutterTemplateTextTheme {
  final TextStyle titleHuge;
  final TextStyle titleBig;
  final TextStyle titleNormal;
  final TextStyle titleSmall;

  final TextStyle titleListItem;

  final TextStyle labelButtonBig;
  final TextStyle labelButtonBigDisabled;
  final TextStyle labelButtonSmall;
  final TextStyle labelButtonSmallDisabled;

  final TextStyle bodyNormal;
  final TextStyle bodySmall;
  final TextStyle bodyUltraSmall;
  final TextStyle infoBodySubHeader;
  final TextStyle bodyBig;

  const FlutterTemplateTextTheme({
    required this.titleHuge,
    required this.titleBig,
    required this.titleNormal,
    required this.titleSmall,
    required this.titleListItem,
    required this.labelButtonBig,
    required this.labelButtonBigDisabled,
    required this.labelButtonSmall,
    required this.labelButtonSmallDisabled,
    required this.bodyNormal,
    required this.bodySmall,
    required this.bodyUltraSmall,
    required this.infoBodySubHeader,
    required this.bodyBig,
  });
}

class FlutterTemplateTextThemeExceptions {
  const FlutterTemplateTextThemeExceptions();
}

class FlutterTemplateColorsTheme {
  final Color text;
  final Color inverseText;
  final Color disabledButtonText;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color inverseBackground;
  final Color inputFieldFill;
  final Color disabled;
  final Color icon;
  final Color inverseIcon;
  final Color inverseProgressIndicator;
  final Color progressIndicator;

  const FlutterTemplateColorsTheme({
    required this.text,
    required this.inverseText,
    required this.disabledButtonText,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.inverseBackground,
    required this.inputFieldFill,
    required this.disabled,
    required this.icon,
    required this.inverseIcon,
    required this.inverseProgressIndicator,
    required this.progressIndicator,
  });
}

class FlutterTemplateTheme {
  final FlutterTemplateTextTheme coreTextTheme;
  final FlutterTemplateTextTheme inverseCoreTextTheme;
  final FlutterTemplateTextTheme accentTextTheme;
  final FlutterTemplateTextThemeExceptions exceptionsTextTheme;
  final FlutterTemplateColorsTheme colorsTheme;

  static final _instanceDark = _fromColorTheme(
    colorTheme: const FlutterTemplateColorsTheme(
      text: AppColors.white,
      inverseText: AppColors.black,
      disabledButtonText: AppColors.lightGrey,
      primary: AppColors.primary,
      accent: AppColors.accent,
      secondary: AppColors.white,
      background: AppColors.primary,
      inverseBackground: AppColors.white,
      inputFieldFill: AppColors.white,
      disabled: AppColors.disabledGrey,
      icon: AppColors.white,
      inverseIcon: AppColors.black,
      progressIndicator: AppColors.primary,
      inverseProgressIndicator: AppColors.white,
    ),
  );

  static final _instanceLight = _fromColorTheme(
    colorTheme: const FlutterTemplateColorsTheme(
      text: AppColors.black,
      inverseText: AppColors.white,
      disabledButtonText: AppColors.lightGrey,
      primary: AppColors.primary,
      accent: AppColors.accent,
      secondary: AppColors.black,
      background: AppColors.white,
      inverseBackground: AppColors.white,
      inputFieldFill: AppColors.white,
      disabled: AppColors.disabledGrey,
      icon: AppColors.white,
      inverseIcon: AppColors.black,
      progressIndicator: AppColors.primary,
      inverseProgressIndicator: AppColors.white,
    ),
  );

  static FlutterTemplateTheme _fromColorTheme({required FlutterTemplateColorsTheme colorTheme}) => FlutterTemplateTheme._(
        colorsTheme: colorTheme,
        coreTextTheme: FlutterTemplateTextTheme(
          titleHuge: TextStyle(fontSize: 40, color: colorTheme.text, fontFamily: AppFonts.title, height: 1.2),
          titleBig: TextStyle(fontSize: 30, color: colorTheme.text, fontFamily: AppFonts.title, height: 1.2),
          titleNormal: TextStyle(fontSize: 24, color: colorTheme.text, fontFamily: AppFonts.title),
          titleSmall: TextStyle(fontSize: 18, color: colorTheme.text, fontFamily: AppFonts.title),
          titleListItem: TextStyle(fontSize: 18, color: colorTheme.text, fontFamily: AppFonts.title, fontWeight: FontWeight.bold),
          labelButtonBig: TextStyle(fontSize: 16, color: colorTheme.text, fontFamily: AppFonts.button, fontWeight: FontWeight.bold),
          labelButtonBigDisabled: TextStyle(fontSize: 16, color: colorTheme.disabledButtonText, fontFamily: AppFonts.button, fontWeight: FontWeight.bold),
          labelButtonSmall: TextStyle(fontSize: 14, color: colorTheme.text, fontFamily: AppFonts.button, fontWeight: FontWeight.bold),
          labelButtonSmallDisabled: TextStyle(fontSize: 14, color: colorTheme.disabledButtonText, fontFamily: AppFonts.button, fontWeight: FontWeight.bold),
          bodyBig: TextStyle(fontSize: 18, color: colorTheme.text, fontFamily: AppFonts.body),
          bodyNormal: TextStyle(fontSize: 16, color: colorTheme.text, fontFamily: AppFonts.body),
          bodySmall: TextStyle(fontSize: 14, color: colorTheme.text, fontFamily: AppFonts.body),
          bodyUltraSmall: TextStyle(fontSize: 12, color: colorTheme.text, fontFamily: AppFonts.body),
          infoBodySubHeader: TextStyle(fontSize: 14, color: colorTheme.text, fontFamily: AppFonts.body, fontWeight: FontWeight.w600),
        ),
        inverseCoreTextTheme: FlutterTemplateTextTheme(
          titleHuge: TextStyle(fontSize: 40, color: colorTheme.inverseText, fontFamily: AppFonts.title, height: 1.2),
          titleBig: TextStyle(fontSize: 30, color: colorTheme.inverseText, fontFamily: AppFonts.title, height: 1.2),
          titleNormal: TextStyle(fontSize: 24, color: colorTheme.inverseText, fontFamily: AppFonts.title),
          titleSmall: TextStyle(fontSize: 18, color: colorTheme.inverseText, fontFamily: AppFonts.title),
          titleListItem: TextStyle(fontSize: 18, color: colorTheme.inverseText, fontFamily: AppFonts.title, fontWeight: FontWeight.bold),
          labelButtonBig: TextStyle(fontSize: 16, color: colorTheme.inverseText, fontFamily: AppFonts.button, fontWeight: FontWeight.bold),
          labelButtonBigDisabled: TextStyle(fontSize: 16, color: colorTheme.disabledButtonText, fontFamily: AppFonts.button, fontWeight: FontWeight.bold),
          labelButtonSmall: TextStyle(fontSize: 14, color: colorTheme.inverseText, fontFamily: AppFonts.button, fontWeight: FontWeight.bold),
          labelButtonSmallDisabled: TextStyle(fontSize: 14, color: colorTheme.disabledButtonText, fontFamily: AppFonts.button, fontWeight: FontWeight.bold),
          bodyBig: TextStyle(fontSize: 18, color: colorTheme.inverseText, fontFamily: AppFonts.body),
          bodyNormal: TextStyle(fontSize: 16, color: colorTheme.inverseText, fontFamily: AppFonts.body),
          bodySmall: TextStyle(fontSize: 14, color: colorTheme.inverseText, fontFamily: AppFonts.body),
          bodyUltraSmall: TextStyle(fontSize: 12, color: colorTheme.inverseText, fontFamily: AppFonts.body),
          infoBodySubHeader: TextStyle(fontSize: 14, color: colorTheme.inverseText, fontFamily: AppFonts.body, fontWeight: FontWeight.w600),
        ),
        accentTextTheme: FlutterTemplateTextTheme(
          titleHuge: TextStyle(fontSize: 40, color: colorTheme.accent, fontFamily: AppFonts.title, height: 1.2),
          titleBig: TextStyle(fontSize: 30, color: colorTheme.accent, fontFamily: AppFonts.title, height: 1.2),
          titleNormal: TextStyle(fontSize: 24, color: colorTheme.accent, fontFamily: AppFonts.title),
          titleSmall: TextStyle(fontSize: 18, color: colorTheme.accent, fontFamily: AppFonts.title),
          titleListItem: TextStyle(fontSize: 18, color: colorTheme.accent, fontFamily: AppFonts.title, fontWeight: FontWeight.bold),
          labelButtonBig: TextStyle(fontSize: 16, color: colorTheme.accent, fontFamily: AppFonts.button, fontWeight: FontWeight.bold),
          labelButtonBigDisabled: TextStyle(fontSize: 16, color: colorTheme.disabledButtonText, fontFamily: AppFonts.button, fontWeight: FontWeight.bold),
          labelButtonSmall: TextStyle(fontSize: 14, color: colorTheme.accent, fontFamily: AppFonts.button, fontWeight: FontWeight.bold),
          labelButtonSmallDisabled: TextStyle(fontSize: 14, color: colorTheme.disabledButtonText, fontFamily: AppFonts.button, fontWeight: FontWeight.bold),
          bodyBig: TextStyle(fontSize: 18, color: colorTheme.accent, fontFamily: AppFonts.body),
          bodyNormal: TextStyle(fontSize: 16, color: colorTheme.accent, fontFamily: AppFonts.body),
          bodySmall: TextStyle(fontSize: 14, color: colorTheme.accent, fontFamily: AppFonts.body),
          bodyUltraSmall: TextStyle(fontSize: 12, color: colorTheme.accent, fontFamily: AppFonts.body),
          infoBodySubHeader: TextStyle(fontSize: 14, color: colorTheme.accent, fontFamily: AppFonts.body, fontWeight: FontWeight.w600),
        ),
        exceptionsTextTheme: const FlutterTemplateTextThemeExceptions(),
      );

  const FlutterTemplateTheme._({
    required this.coreTextTheme,
    required this.inverseCoreTextTheme,
    required this.accentTextTheme,
    required this.exceptionsTextTheme,
    required this.colorsTheme,
  });

  static FlutterTemplateTheme of(BuildContext context, {bool forceDark = false, bool forceLight = false}) {
    if (forceDark) return _instanceDark;
    if (forceLight) return _instanceLight;

    final theme = FlavorConfig.instance.themeMode;
    if (theme == ThemeMode.dark) {
      return _instanceDark;
    } else if (theme == ThemeMode.light) {
      return _instanceLight;
    }
    final brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) return _instanceDark;

    return _instanceLight;
  }
}
