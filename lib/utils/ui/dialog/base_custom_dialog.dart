import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/load_image.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:flutter_mockup_bloc/resource/app_text_styles.dart';
import 'package:flutter_mockup_bloc/resource/dimens.dart';
import 'package:flutter_mockup_bloc/resource/gaps.dart';

class BaseCustomDialog extends StatelessWidget {

  const BaseCustomDialog({
    required this.title,
    this.titleSubmit = 'OK',
    required this.onPressed,
    this.hiddenTitle : false,
    this.isShowCancel : false,
    required this.child
  }) : super();

  final String title;
  final String titleSubmit;
  final Function onPressed;
  final Widget child;
  final bool hiddenTitle;
  final bool isShowCancel;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    var dialogTitle = Visibility(
      visible: !hiddenTitle,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          hiddenTitle ? '' : title,
          style: AppTextStyles.dialogTitle,
        ),
      ),
    );
    
    var bottomButton = Row(
      children: <Widget>[
        _DialogButton(
          text: 'Hủy',
          textColor: AppColors.text_gray,
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(
          height: 40.0,
          width: 0.6,
          child: const VerticalDivider(),
        ),
        _DialogButton(
          text: titleSubmit,
          textColor: AppColors.text,
          onPressed: onPressed(),
        ),
      ],
    );

    var bottomButtonNotCancel = Row(
      children: <Widget>[
        _DialogButton(
          text: titleSubmit,
          textColor: AppColors.primary,
          onPressed: onPressed(),
        ),
      ],
    );
    
    var body = Material(
      borderRadius: BorderRadius.circular(5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Gaps.vGap24,
          LoadImage(AppConstants.logo_app, width: _width / 4, height: _width / 4, fit: BoxFit.contain,),
          // IconSVG(IconSVGPath.ic_logo, _width / 4, _width / 4, null),
          Gaps.vGap20,
//          dialogTitle,
          Flexible(child: child),
          Gaps.vGap8,
          Gaps.line,
          isShowCancel ? bottomButton : bottomButtonNotCancel,
        ],
      ),
    );
    
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets + const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeInCubic,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: SizedBox(
            width: 270.0,
            child: body,
          ),
        ),
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  
  const _DialogButton({
    required this.text,
    required this.textColor,
    required this.onPressed,
  }): super();
  
  final String text;
  final Color textColor;
  final Function()? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40.0,
        child: FlatButton(
          child: Text(
            text,
            style: TextStyle(fontSize: Dimens.font_sp14),
          ),
          textColor: textColor,
          onPressed: onPressed,
        ),
      ),
    );
  }
}