import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/common/theme/app_padding.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/custom_text_field.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/app_text_styles.dart';

class CustomTextFieldLabel extends StatelessWidget {
  const CustomTextFieldLabel(
      this.textField,
    this.data, {
    Key? key,
    this.isRequire = false,
    this.autoMarginTop = true,
  }) : super(key: key);

  final String data;
  final bool isRequire;
  final bool autoMarginTop;
  final CustomTextField textField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPad.a20.copyWith(
        top: autoMarginTop ? null : 0,
        bottom: 7,
      ),
      child: Column(
        children: [
          isRequire
              ? Text.rich(TextSpan(
            style: AppTextStyles.formFieldLabel,
            children: [
              TextSpan(text: data),
              TextSpan(
                text: ' *',
                style: AppTextStyles.formFieldLabel.copyWith(
                  color: AppColors.red,
                ),
              ),
            ],
          ))
              : Text(data, style: AppTextStyles.formFieldLabel),
          textField
        ],
      ),
    );
  }
}
