import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_page.dart';
import 'package:flutter_mockup_bloc/core/view_model/global/global_viewmodel.dart';
import 'package:flutter_mockup_bloc/model/UserItem.dart';
import 'package:flutter_mockup_bloc/presentation/router/app_pages.dart';
import 'package:flutter_mockup_bloc/presentation/router/app_router.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/load_image.dart';
import 'package:flutter_mockup_bloc/presenters/profile_presenter.dart';
import 'package:flutter_mockup_bloc/provider/provider_widget.dart';
import 'package:flutter_mockup_bloc/repository/auth/user_info_repository.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:flutter_mockup_bloc/resource/gaps.dart';
import 'package:flutter_mockup_bloc/utils/locale/localization.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();


}

class _ProfileScreenState extends State<ProfileScreen> with BasePageMixin<ProfileScreen, ProfilePresenter> implements ProfileView{
  @override
  Widget build(BuildContext context) {
    final user = context.read<UserInfoRepository>().userInfo;

    return ProviderWidget<GlobalViewModel>(
      create: () => GetIt.I()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => Consumer<GlobalViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          backgroundColor: theme.colorsTheme.background,
          appBar: buildAppBar(context, localization),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.userImage!,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              Center(child: buildUpgradeButton(localization)),
              const SizedBox(height: 24),
              NumbersWidget(localization),
              const SizedBox(height: 48),
              buildAbout(user, localization),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(UserInfo user) => Column(
    children: [
      Text(
        user.userName!,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.userEmail!,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildUpgradeButton(Localization localization) => ButtonWidget(
    text: localization.upToPro,
    onClicked: () {},
  );

  Widget buildAbout(UserInfo user, Localization localization) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.about,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          localization.detailAbout,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );

  @override
  ProfilePresenter createPresenter() => ProfilePresenter();

  @override
  void initViewDone() {
    // TODO: implement initViewDone

  }
}

AppBar buildAppBar(BuildContext context, Localization localization) {
  final iconMoon = CupertinoIcons.moon_stars;
  final iconSignOut = CupertinoIcons.arrow_up_right_circle_fill;

  return AppBar(
    leading: IconButton(
      icon: Icon(iconMoon, color: AppColors.primary,),
      onPressed: () {},
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      GestureDetector(
        onTap: (){
          AppRouter.replaceAllWithPage(context, AppPages.Auth_Login);
          SpUtil.putString(AppConstants.accessToken, "");
          SpUtil.putString(AppConstants.refreshToken, "");
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(localization.logOut, style: TextStyle(color: AppColors.primary),),
              Gaps.hGap5,
              Icon(iconSignOut, color: AppColors.primary)
            ],
          ),
        ),
      )
    ],
  );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      onPrimary: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    ),
    child: Text(text),
    onPressed: onClicked,
  );
}

class NumbersWidget extends StatelessWidget {
  final Localization localization;
  NumbersWidget(this.localization);

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      buildButton(context, '4.8', localization.ranking),
      buildDivider(),
      buildButton(context, '35', localization.following),
      buildDivider(),
      buildButton(context, '50', localization.followers),
    ],
  );
  Widget buildDivider() => Container(
    height: 24,
    child: VerticalDivider(),
  );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: LoadImage(imagePath, width: 128, height: 128, fit: BoxFit.cover,),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all: 8,
      child: Icon(
        Icons.edit,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}