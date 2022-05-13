import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';

import 'ouline_shadow_input_border.dart';
import 'app_decoration.dart';

class AppBorderAndRadius {
  static final uniformBorder = Border.fromBorderSide(BorderSide(
    color: AppColors.border,
    width: 0.5,
  ));

  static final tabBarBorder = Border.fromBorderSide(BorderSide(
    color: AppColors.tabBarBorder,
    width: 0.5,
  ));

  static final Radius defaultRadius = Radius.circular(20);

  static final Radius formRadius = Radius.circular(48);

  static final Radius multilineFormRadius = Radius.circular(20);

  // static final Border defaultBorder = Border.all(color: AppColors.lightGray, width: 0.5);

  static final BorderRadius defaultBorderRadius =
      BorderRadius.all(defaultRadius);

  static final BorderRadius formBorderRadius = BorderRadius.all(formRadius);

  static final BorderRadius multilineFormBorderRadius =
      BorderRadius.all(multilineFormRadius);

  static final BorderRadius mbsBorderRadius =
      BorderRadius.vertical(top: defaultRadius);

  static final BorderRadius chatInputFieldBorderRadius =
      BorderRadius.vertical(top: defaultRadius);

  static final RoundedRectangleBorder roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: defaultBorderRadius);

  static final RoundedRectangleBorder defaultAppBarBorder =
      RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
    ),
  );

  static final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.lightGray,
      width: 0.5,
    ),
    borderRadius: formBorderRadius,
  );

  static final OutlineShadowInputBorder outlineShadowInputBorder =
      OutlineShadowInputBorder(
    borderSide: BorderSide(
      color: AppColors.lightGray,
      width: 0.5,
    ),
    borderRadius: formBorderRadius,
    boxShadow: AppDecoration.formShadow,
  );

  static final OutlineShadowInputBorder outlineMultilineInputBorder =
      OutlineShadowInputBorder(
    borderSide: BorderSide(
      color: AppColors.lightGray,
      width: 0.5,
    ),
    borderRadius: multilineFormBorderRadius,
    boxShadow: AppDecoration.formShadow,
  );

  static final OutlineShadowInputBorder outlineShadowInputDisabledBorder =
      OutlineShadowInputBorder(
    borderSide: BorderSide(color: AppColors.inactive),
    borderRadius: formBorderRadius,
    boxShadow: AppDecoration.formShadow,
  );

  static final OutlineInputBorder outlineInputDisabledBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.inactive),
    borderRadius: formBorderRadius,
  );

  static final OutlineShadowInputBorder outlineMultilineInputDisabledBorder =
      OutlineShadowInputBorder(
    borderSide: BorderSide(color: AppColors.inactive),
    borderRadius: multilineFormBorderRadius,
    boxShadow: AppDecoration.formShadow,
  );

  static final OutlineShadowInputBorder outlineShadowInputFocusedBorder =
      OutlineShadowInputBorder(
    borderSide: BorderSide(color: AppColors.active),
    borderRadius: formBorderRadius,
    boxShadow: AppDecoration.formShadow,
  );

  static final OutlineInputBorder outlineInputFocusedBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.active),
    borderRadius: formBorderRadius,
  );

  static final OutlineShadowInputBorder outlineMultilineInputFocusedBorder =
      OutlineShadowInputBorder(
    borderSide: BorderSide(color: AppColors.active),
    borderRadius: multilineFormBorderRadius,
    boxShadow: AppDecoration.formShadow,
  );

  static final OutlineShadowInputBorder outlineShadowInputErrorBorder =
      OutlineShadowInputBorder(
    borderSide: BorderSide(color: AppColors.error),
    borderRadius: formBorderRadius,
    boxShadow: AppDecoration.formShadow,
  );

  static final OutlineInputBorder outlineInputErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.error),
    borderRadius: formBorderRadius,
  );

  static final OutlineShadowInputBorder outlineMultilineInputErrorBorder =
      OutlineShadowInputBorder(
    borderSide: BorderSide(color: AppColors.error),
    borderRadius: multilineFormBorderRadius,
    boxShadow: AppDecoration.formShadow,
  );

  static final OutlineInputBorder chatOutlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.suvaGrey,
      width: 0.5,
    ),
    borderRadius: formBorderRadius,
  );
}
