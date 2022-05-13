import 'package:flutter/widgets.dart';
import 'package:flutter_mockup_bloc/common/theme/theme_data.dart';
import 'package:flutter_mockup_bloc/provider/theme_provider_widget.dart';
import 'package:flutter_mockup_bloc/utils/env/os_info.dart';
import 'package:flutter_mockup_bloc/utils/locale/localization.dart';

L _getLocale<L>(BuildContext context) => Localization.of(context) as L;

T _getTheme<T>(BuildContext context) => FlutterTemplateTheme.of(context) as T;

Future<void> initArchitecture() async {
  await OsInfo.init();
  localizationLookup = _getLocale;
  themeLookup = _getTheme;
}
