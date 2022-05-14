import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'loading_config.dart';

class LottieLoading extends StatelessWidget {
  final LoadingConfig loadingConfig;
  const LottieLoading(this.loadingConfig);

  @override
  Widget build(BuildContext context) {
    if (loadingConfig.path?.isEmpty ?? true) return const SizedBox();
    var name = loadingConfig.path!;

    if (name.startsWith('http')) {
      return Center(
        child: Lottie.network(
          name,
          errorBuilder: (_, __, ___) {
            return const SizedBox();
          },
        ),
      );
    }
    return Center(
      child: Lottie.asset(
        name,
        errorBuilder: (_, __, ___) {
          return const SizedBox();
        },
      ),
    );
  }
}
