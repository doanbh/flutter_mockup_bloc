import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/common/theme/app_border_and_radius.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/widget_utils.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    Key? key,
    required this.children,
    required this.padding,
    required this.seperator,
  }) : super(key: key);

  final EdgeInsetsGeometry padding;
  final List<Widget> children;
  final SizedBox seperator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: AppBorderAndRadius.defaultRadius,
          topRight: AppBorderAndRadius.defaultRadius,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -1),
            blurRadius: 4,
            color: AppColors.shadow10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: WidgetUtils.addSizedBoxAsSeparator(
          seperator,
          WidgetUtils.uniformWidth(children),
        ),
      ),
    );
  }
}
