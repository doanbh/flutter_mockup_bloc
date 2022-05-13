import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    Key? key,
    this.onBackBtnPressed,
  }) : super(key: key);

  final void Function()? onBackBtnPressed;

  @override
  Widget build(BuildContext context) {
    navigateBack() => Navigator.pop(context);

    return IconButton(
      icon: const RotatedBox(
        quarterTurns: -2,
        child: Icon(
          Icons.play_circle_filled_rounded,
          size: 24,
          color: AppColors.primary,
        ),
      ),
      onPressed: onBackBtnPressed ?? navigateBack,
    );
  }
}
