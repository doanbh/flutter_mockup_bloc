
import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/common/theme/app_border_and_radius.dart';
import 'package:flutter_mockup_bloc/common/theme/app_padding.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/button/pill_button.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/widget_utils.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:flutter_mockup_bloc/resource/app_text_styles.dart';


class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    this.isMessageDialog = false,
    this.placeButtonsInColumn = false,
    this.switchButtonsPositionAndStyle = false,
    required this.icon,
    this.affirmativeText = 'Đóng',
    this.additionalWidget,
    required this.description,
    required this.onAffirmativeBtnPressed,
    required this.onCancel,
  }) : super(key: key);

  final bool isMessageDialog;
  final bool placeButtonsInColumn;
  final bool switchButtonsPositionAndStyle;
  final Widget icon;
  final String affirmativeText;
  final String description;
  final void Function() onAffirmativeBtnPressed;
  final void Function() onCancel;

  /// available if switchButtonsPositionAndStyle == false
  final Widget? additionalWidget;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets containerPadding = isMessageDialog
        ? const EdgeInsets.symmetric(horizontal: 22, vertical: 20)
        : const EdgeInsets.symmetric(horizontal: 22, vertical: 40);
    final SizedBox spacingBetweenDescription =
        isMessageDialog ? SizedBoxExt.h20 : SizedBoxExt.h30;

    late final Widget buttonsSeperator =
        placeButtonsInColumn ? SizedBoxExt.h12 : SizedBoxExt.w20;

    late final EdgeInsets affirmativeBtnPadding =
        affirmativeText != AppConstants.agree
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
            : const EdgeInsets.symmetric(horizontal: 15, vertical: 10);

    List<Widget> buttons = [
      if (isMessageDialog)
        PillButton(
          type: ButtonType.CTA,
          text: affirmativeText,
          width: null,
          onPressed: onAffirmativeBtnPressed,
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
        )
      else if (switchButtonsPositionAndStyle == false) ...[
        PillButton(
          type: ButtonType.OUTLINED_PRIMARY,
          text: affirmativeText,
          onPressed: onAffirmativeBtnPressed,
          padding: affirmativeBtnPadding,
        ),
        if (additionalWidget != null) ...[
          buttonsSeperator,
          additionalWidget!,
        ],
        buttonsSeperator,
        PillButton(
          type: ButtonType.CTA,
          text: AppConstants.cancel,
          onPressed: onCancel,
        ),
      ] else ...[
        PillButton(
          type: ButtonType.OUTLINED_PRIMARY,
          text: AppConstants.cancel,
          onPressed: onCancel,
        ),
        buttonsSeperator,
        PillButton(
          type: ButtonType.CTA,
          text: affirmativeText,
          onPressed: onAffirmativeBtnPressed,
          padding: affirmativeBtnPadding,
        )
      ],
    ];

    if (!placeButtonsInColumn) buttons = WidgetUtils.uniformWidth(buttons);

    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderAndRadius.defaultBorderRadius,
      ),
      backgroundColor: Colors.transparent,
      // insetPadding: AppPadding.paddingAll20,
      child: SingleChildScrollView(
        child: Container(
          padding: containerPadding,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppBorderAndRadius.defaultBorderRadius,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              //
              spacingBetweenDescription,
              Text(
                description,
                style: AppTextStyles.dialogDescription,
                textAlign: TextAlign.center,
                maxLines: 5,
              ),
              spacingBetweenDescription,
              //
              if (placeButtonsInColumn)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: buttons,
                  ),
                )
              else
                Padding(
                  padding: AppPad.horiz20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buttons,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
