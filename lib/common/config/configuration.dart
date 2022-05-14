import 'package:flutter_mockup_bloc/common/config/default_config.dart';

class Configurations {
  static Map? _loadingIcon = DefaultConfig.loadingIcon;
  static Map? _lottieLoadingIcon = DefaultConfig.lottieLoadingIcon;

  static Map get loadingIcon => _loadingIcon!;
  static Map get lottieLoadingIcon => _lottieLoadingIcon!;

  void setConfigurationValues(Map<String, dynamic> value) {
    _loadingIcon = value['loadingIcon'] ?? DefaultConfig.loadingIcon;
    _lottieLoadingIcon = value['lottieLoadingIcon'] ?? DefaultConfig.lottieLoadingIcon;
  }

}