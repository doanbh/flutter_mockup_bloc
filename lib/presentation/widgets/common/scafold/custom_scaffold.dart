import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/common/theme/app_border_and_radius.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/button/app_bar_back_button.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/scafold/bottom_container.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/scafold/will_unfocus_form_scope.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/widget_utils.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/app_text_styles.dart';


class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    this.resizeToAvoidBottomInset = false,
    this.automaticallyHandleBackButtonPress = false,
    required this.title,
    this.showBackBtn = true,
    this.bottomAppBar,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    required this.body,
    this.bottomNavigationBar,
    this.onBackBtnPressed,
    this.bottomContainer,
  }) : super(key: key);

  final bool resizeToAvoidBottomInset;

  /// if you provide [onBackBtnPressed],
  /// so [automaticallyHandleBackButtonPress] must be false
  final bool automaticallyHandleBackButtonPress;
  final String title;
  final bool showBackBtn;
  final PreferredSizeWidget? bottomAppBar;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final Widget body;
  final Widget? bottomNavigationBar;
  final void Function()? onBackBtnPressed;
  final BottomContainer? bottomContainer;

  @override
  Widget build(BuildContext context) {
    // final double height = AppPadding.defaultAppBarHeight +
    //     (bottomAppBar != null ? bottomAppBar!.preferredSize.height : 0);

    Widget current = Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: AppBar(
        // toolbarHeight: height,
        leading: showBackBtn == false
            ? null
            : AppBarBackButton(onBackBtnPressed: onBackBtnPressed),
        centerTitle: true,
        title: Text(
                title.toUpperCase(),
                style: AppTextStyles.appbarTitle,
                overflow: TextOverflow.ellipsis,
              ),
        bottom: bottomAppBar,
        shape: AppBorderAndRadius.defaultAppBarBorder,
        elevation: 4,
        shadowColor: AppColors.appBarShadow,
      ),
      // backgroundColor: AppColors.white,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: Colors.white,
      extendBody: extendBody,
      body: Padding(
        padding: extendBodyBehindAppBar
            ? EdgeInsets.only(
                top: bottomAppBar == null
                    ? 5
                    : bottomAppBar!.preferredSize.height + 30,
                bottom: 0,
              )
            : const EdgeInsets.all(0),
        child: body,
      ),
      bottomNavigationBar: bottomContainer,
    );

    if (automaticallyHandleBackButtonPress)
      current = WidgetUtils.getWillPopScope(context, current);
    else if (onBackBtnPressed != null)
      current = WillPopScope(
        child: current,
        onWillPop: () async {
          if (onBackBtnPressed == null) return true;

          onBackBtnPressed!();
          return false;
        },
      );

    return ColoredBox(
      color: AppColors.primary,
      child: SafeArea(
        child: WillUnfocusFormScope(
          child: current,
        ),
      ),
    );
  }
}
