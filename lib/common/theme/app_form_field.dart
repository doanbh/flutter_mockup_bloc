import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/common/theme/app_border_and_radius.dart';
import 'package:flutter_mockup_bloc/common/theme/app_decoration.dart';
import 'package:flutter_mockup_bloc/common/theme/app_padding.dart';
import 'package:flutter_mockup_bloc/resource/app_text_styles.dart';


class AppFormField {
  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    hintStyle: AppTextStyles.hintText,
    errorMaxLines: 2,
    contentPadding: AppPad.formFieldContent,
    enabledBorder: AppBorderAndRadius.outlineShadowInputBorder,
    disabledBorder: AppBorderAndRadius.outlineShadowInputDisabledBorder,
    focusedBorder: AppBorderAndRadius.outlineShadowInputFocusedBorder,
    errorBorder: AppBorderAndRadius.outlineShadowInputErrorBorder,
    focusedErrorBorder: AppBorderAndRadius.outlineShadowInputErrorBorder,
    filled: true,
    fillColor: Colors.white,
    floatingLabelBehavior: FloatingLabelBehavior.never,
  );

  static final InputDecoration shadowInputDecoration = InputDecoration(
    hintStyle: AppTextStyles.hintText,
    hintMaxLines: 2,
    errorMaxLines: 2,
    helperMaxLines: 2,
    contentPadding: AppPad.formFieldContent,
    enabledBorder: AppBorderAndRadius.outlineShadowInputBorder,
    disabledBorder: AppBorderAndRadius.outlineShadowInputDisabledBorder,
    focusedBorder: AppBorderAndRadius.outlineShadowInputFocusedBorder,
    errorBorder: AppBorderAndRadius.outlineShadowInputErrorBorder,
    focusedErrorBorder: AppBorderAndRadius.outlineShadowInputErrorBorder,
    filled: true,
    fillColor: Colors.white,
    floatingLabelBehavior: FloatingLabelBehavior.never,
  );

  static final InputDecoration outlineInputDecoration = InputDecoration(
    hintStyle: AppTextStyles.hintText,
    hintMaxLines: 2,
    errorMaxLines: 2,
    helperMaxLines: 2,
    contentPadding: AppPad.formFieldContent,
    enabledBorder: AppBorderAndRadius.outlineInputBorder,
    disabledBorder: AppBorderAndRadius.outlineInputDisabledBorder,
    focusedBorder: AppBorderAndRadius.outlineInputFocusedBorder,
    errorBorder: AppBorderAndRadius.outlineInputErrorBorder,
    focusedErrorBorder: AppBorderAndRadius.outlineInputErrorBorder,
    filled: true,
    fillColor: Colors.white,
    floatingLabelBehavior: FloatingLabelBehavior.never,
  );

  static final InputDecoration multilineShadowInputDecoration = InputDecoration(
    hintStyle: AppTextStyles.hintText,
    hintMaxLines: 2,
    errorMaxLines: 2,
    contentPadding: AppPad.formFieldContent,
    enabledBorder: AppBorderAndRadius.outlineMultilineInputBorder,
    disabledBorder: AppBorderAndRadius.outlineMultilineInputDisabledBorder,
    focusedBorder: AppBorderAndRadius.outlineMultilineInputFocusedBorder,
    errorBorder: AppBorderAndRadius.outlineMultilineInputErrorBorder,
    focusedErrorBorder: AppBorderAndRadius.outlineMultilineInputErrorBorder,
    filled: true,
    fillColor: Colors.white,
    floatingLabelBehavior: FloatingLabelBehavior.never,
  );

  static final BoxDecoration dropdownButton = BoxDecoration(
    color: Colors.white,
    border: AppBorderAndRadius.uniformBorder,
    borderRadius: AppBorderAndRadius.formBorderRadius,
    boxShadow: AppDecoration.formShadow,
  );
}
