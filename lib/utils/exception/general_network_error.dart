
import 'package:flutter_mockup_bloc/utils/exception/localized_error.dart';
import 'package:flutter_mockup_bloc/utils/locale/localization_keys.dart';

class GeneralError with LocalizedError {
  GeneralError() : super();

  @override
  String getLocalizedKey() => LocalizationKeys.errorGeneral;
}
