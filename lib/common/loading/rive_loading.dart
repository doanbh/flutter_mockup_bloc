import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/common/loading/loading_config.dart';
import 'package:rive/rive.dart';

class RiveLoading extends StatelessWidget {
  final LoadingConfig loadingConfig;
  const RiveLoading(this.loadingConfig);

  @override
  Widget build(BuildContext context) {
    if (loadingConfig.path?.isEmpty ?? true) return const SizedBox();
    var name = loadingConfig.path!;

    if (name.startsWith('http')) {
      return Center(
        child: RiveAnimation.network(
          name,
        ),
      );
    }
    return Center(
      child: RiveAnimation.asset(
        name,
      ),
    );
  }
}
