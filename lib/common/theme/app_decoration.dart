import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';

import 'app_border_and_radius.dart';

class AppDecoration {
  static const defaultGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: const [0, 1],
    colors: const [
      AppColors.primary,
      Color(0xFF978ECF),
    ],
  );

  static ui.Gradient getIconGradientShader(Size size) => ui.Gradient.linear(
        Offset(size.width * 7.443397e-7, size.height * 0.4972973),
        Offset(size.width, size.height * 0.4972973),
        const [Color(0xff4C5BD4), Color(0xff978ECF)],
        const [0, 1],
      );

  static const defaultShadow = [
    BoxShadow(
      offset: Offset(0, 3),
      blurRadius: 4,
      color: AppColors.shadow20,
    )
  ];

  static const formShadow = [
    BoxShadow(
      offset: Offset(0, 3),
      blurRadius: 4,
      color: AppColors.shadow25,
    )
  ];

  static const buttonShadow = formShadow;

  static final BoxDecoration cardBox = BoxDecoration(
    color: Colors.white,
    border: AppBorderAndRadius.uniformBorder,
    boxShadow: defaultShadow,
  );

  static final BoxDecoration tabBar = BoxDecoration(
    border: AppBorderAndRadius.tabBarBorder,
    borderRadius: AppBorderAndRadius.defaultBorderRadius,
  );

}
