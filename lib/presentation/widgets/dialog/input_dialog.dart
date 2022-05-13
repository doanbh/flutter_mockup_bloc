

import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/common/theme/app_border_and_radius.dart';
import 'package:flutter_mockup_bloc/common/theme/app_padding.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/button/pill_button.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/common_widget.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/outline_text_form_field.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/scafold/will_unfocus_form_scope.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/dialog/app_dialogs.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:flutter_mockup_bloc/resource/app_text_styles.dart';

class InputDialog extends StatelessWidget {
  const InputDialog({
    Key? key,
    required this.data,
    required this.onSaveBtnPressed,
  }) : super(key: key);

  final String data;
  final void Function() onSaveBtnPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderAndRadius.defaultBorderRadius,
      ),
      backgroundColor: Colors.transparent,
      child: WillUnfocusFormScope(
        child: SingleChildScrollView(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: AppBorderAndRadius.defaultBorderRadius,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: AppBorderAndRadius.defaultRadius,
                      topRight: AppBorderAndRadius.defaultRadius,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 5, left: 20),
                    child: Text(
                      'Ghi chú cho nhà tuyển dụng',
                      style: AppTextStyles.dialogTitle,
                    ),
                  ),
                ),
                //
                Padding(
                  padding: AppPad.a20,
                  child: OutlineTextFormField(
                    data: data,
                    hintText: 'Nhập ghi chú',
                    maxLines: 8,
                    multiline: true,
                  ),
                ),
                SizedBoxExt.h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PillButton(
                      type: ButtonType.OUTLINED_PRIMARY,
                      text: AppConstants.cancel,
                      width: 100,
                      onPressed: () => AppDialogs.hideDialog(context),
                    ),
                    SizedBoxExt.w20,
                    PillButton(
                      type: ButtonType.CTA,
                      text: AppConstants.agree,
                      width: 100,
                      onPressed: onSaveBtnPressed,
                    ),
                  ],
                ),
                SizedBoxExt.h20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
