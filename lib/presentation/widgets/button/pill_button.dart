import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/app_text_styles.dart';

enum ButtonType {
  CTA,
  OUTLINED_PRIMARY,
  OUTLINED,
  FILLED,
  BOTTOM_NAV,
}

extension on ButtonType {
  Color get backgroundColor {
    switch (this) {
      case ButtonType.CTA:
      case ButtonType.OUTLINED:
        return AppColors.primary;
      case ButtonType.BOTTOM_NAV:
        return Colors.transparent;
      case ButtonType.OUTLINED_PRIMARY:
      case ButtonType.FILLED:
        return Colors.white;
    }
  }

  Color get borderColor {
    switch (this) {
      case ButtonType.CTA:
      case ButtonType.OUTLINED_PRIMARY:
        return AppColors.primary;
      case ButtonType.BOTTOM_NAV:
        return Colors.transparent;
      case ButtonType.OUTLINED:
      case ButtonType.FILLED:
        return Colors.white;
    }
  }

  Color get textColor {
    switch (this) {
      case ButtonType.CTA:
      case ButtonType.OUTLINED:
      case ButtonType.BOTTOM_NAV:
        return Colors.white;
      case ButtonType.FILLED:
      case ButtonType.OUTLINED_PRIMARY:
        return AppColors.primary;
    }
  }

  FontWeight? get fontWeight {
    switch (this) {
      case ButtonType.CTA:
      case ButtonType.OUTLINED_PRIMARY:
      case ButtonType.OUTLINED:
      case ButtonType.FILLED:
        return FontWeight.w600;
      case ButtonType.BOTTOM_NAV:
        return null;
    }
  }
}

class PillButton extends StatelessWidget {
  const PillButton({
    Key? key,
    this.width = 200,
    required this.type,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),
  }) : /*assert(type == ButtonType.BOTTOM_NAV && backgroundColor != null,
            'Button type == BOTTOM_NAV must have backgroundColor'),*/
        super(key: key);

  final double? width;
  final ButtonType type;
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    Widget current = ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: type == ButtonType.BOTTOM_NAV
            ? AppTextStyles.bottomNavButton.copyWith(color: textColor)
            : AppTextStyles.button.copyWith(
                color: type.textColor,
                fontWeight: type.fontWeight,
              ),
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: type == ButtonType.BOTTOM_NAV
              ? borderColor ?? textColor ?? backgroundColor!
              : type.borderColor,
        ),
        shape: StadiumBorder(),
        primary: type == ButtonType.BOTTOM_NAV
            ? backgroundColor
            : type.backgroundColor,
        padding: padding,
        shadowColor: Colors.black,
        elevation: 4,
      ),
    );

    if (width != null) current = SizedBox(width: width, child: current);

    return current;
  }
}
