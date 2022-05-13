import 'package:flutter/widgets.dart';
import 'package:flutter_mockup_bloc/common/theme/theme_data.dart';
import 'package:flutter_mockup_bloc/utils/locale/localization.dart';
import 'package:flutter_mockup_bloc/provider/theme_provider_widget.dart';

class DataProviderWidget extends BaseThemeProviderWidget<FlutterTemplateTheme, Localization> {
  const DataProviderWidget({
    Widget Function(BuildContext context, FlutterTemplateTheme theme)? childBuilderTheme,
    Widget Function(BuildContext context, Localization localization)? childBuilderLocalization,
    Widget Function(BuildContext context, FlutterTemplateTheme theme, Localization localization)? childBuilder,
  }) : super(
          childBuilderTheme: childBuilderTheme,
          childBuilderLocalization: childBuilderLocalization,
          childBuilder: childBuilder,
        );
}
