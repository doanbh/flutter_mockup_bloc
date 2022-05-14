import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/common/loading/loading_config.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/load_image.dart';


class ImageLoading extends StatelessWidget {
  final LoadingConfig loadingConfig;
  const ImageLoading(this.loadingConfig);

  @override
  Widget build(BuildContext context) {
    if (loadingConfig.path?.isEmpty ?? true) return const SizedBox();
    return LoadImage(loadingConfig.path!);
  }
}
