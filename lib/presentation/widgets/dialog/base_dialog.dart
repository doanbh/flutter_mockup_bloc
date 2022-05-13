import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/my_button.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/app_text_styles.dart';
import 'package:flutter_mockup_bloc/resource/gaps.dart';
import 'package:flutter_mockup_bloc/utils/device/device_utils.dart';

class BaseDialog extends StatelessWidget {

  const BaseDialog({
    Key? key,
    this.title,
    this.onPressed,
    this.hiddenTitle = false,
    required this.child
  }) : super(key : key);

  final String? title;
  final VoidCallback? onPressed;
  final Widget child;
  final bool hiddenTitle;

  @override
  Widget build(BuildContext context) {

    final Widget dialogTitle = Visibility(
      visible: !hiddenTitle,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          hiddenTitle ? '' : title ?? '',
          style: AppTextStyles.appbarTitle,
        ),
      ),
    );

    final Widget bottomButton = Row(
      children: <Widget>[
        _DialogButton(
          text: 'Cancel',
          textColor: AppColors.text_gray,
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(
          height: 48.0,
          width: 0.6,
          child: VerticalDivider(),
        ),
        _DialogButton(
          text: 'OK',
          textColor: Theme.of(context).primaryColor,
          onPressed: onPressed,
        ),
      ],
    );
    
    final Widget content = Material(
      borderRadius: BorderRadius.circular(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Gaps.vGap24,
          dialogTitle,
          Flexible(child: child),
          Gaps.vGap8,
          Gaps.line,
          bottomButton,
        ],
      ),
    );

    final Widget body = MediaQuery.removeViewInsets(
      removeLeft: true,
      removeTop: true,
      removeRight: true,
      removeBottom: true,
      context: context,
      child: Center(
        child: SizedBox(
          width: 270.0,
          child: content,
        ),
      ),
    );

    if (Device.getAndroidSdkInt() >= 30) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: body,
      );
    } else {
      return AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeInCubic, // easeOutQuad
        child: body,
      );
    }
  }
}

class _DialogButton extends StatelessWidget {
  
  const _DialogButton({
    Key? key,
    required this.text,
    this.textColor,
    this.onPressed,
  }): super(key: key);
  
  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MyButton(
        text: text,
        textColor: textColor,
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
