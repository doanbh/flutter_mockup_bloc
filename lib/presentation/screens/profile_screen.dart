import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_page.dart';
import 'package:flutter_mockup_bloc/model/UserItem.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/load_image.dart';
import 'package:flutter_mockup_bloc/presenters/profile_presenter.dart';
import 'package:flutter_mockup_bloc/repository/auth/user_info_repository.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/gaps.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();


}

class _ProfileScreenState extends State<ProfileScreen> with BasePageMixin<ProfileScreen, ProfilePresenter> implements ProfileView{
  @override
  Widget build(BuildContext context) {
    final user = context.read<UserInfoRepository>().userInfo;

    return Scaffold(
      appBar: buildAppBar(context),
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
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
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

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Upgrade To PRO',
    onClicked: () {},
  );

  Widget buildAbout(UserInfo user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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

AppBar buildAppBar(BuildContext context) {
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

        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text("Đăng xuất", style: TextStyle(color: AppColors.primary),),
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
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      buildButton(context, '4.8', 'Ranking'),
      buildDivider(),
      buildButton(context, '35', 'Following'),
      buildDivider(),
      buildButton(context, '50', 'Followers'),
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