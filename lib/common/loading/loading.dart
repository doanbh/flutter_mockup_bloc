
import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/common/config/configuration.dart';
import 'package:flutter_mockup_bloc/common/loading/image_loading.dart';
import 'package:flutter_mockup_bloc/common/loading/loading_config.dart';
import 'package:flutter_mockup_bloc/common/loading/lottie_loading.dart';
import 'package:flutter_mockup_bloc/common/loading/rive_loading.dart';

/// For Loading Widget
Widget kLoadingWidget() {
  var loadingConfig = LoadingConfig.fromJson(Configurations.lottieLoadingIcon ?? {});
  switch (loadingConfig.layout) {
    case LoadingLayout.image:
      return ImageLoading(loadingConfig);
    case LoadingLayout.rive:
      return RiveLoading(loadingConfig);
    case LoadingLayout.lottie:
      return LottieLoading(loadingConfig);
    default:
      return ImageLoading(loadingConfig);
  } 
}
