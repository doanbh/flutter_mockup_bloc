
import 'package:flutter_mockup_bloc/utils/env/flavor_config.dart';
import 'package:flutter_mockup_bloc/utils/exception/localized_error.dart';
import 'package:flutter_mockup_bloc/utils/locale/localization_keys.dart';

class CodeError with LocalizedError {
  @override
  String getLocalizedKey() {
    if (FlavorConfig.isDev()) {
      return LocalizationKeys.errorDuringDev;
    }
    return LocalizationKeys.errorGeneral;
  }
}
