import 'package:flutter/material.dart';
import 'bottom_user_info.dart';
import 'custom_list_tile.dart';
import 'header.dart';

class CustomDrawer extends StatefulWidget {
  final Function(Action_Drawer)? onTapChangeLanguage;
  const CustomDrawer({Key? key, this.onTapChangeLanguage}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: _isCollapsed ? 300 : 70,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Color.fromRGBO(20, 20, 20, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomDrawerHeader(isColapsed: _isCollapsed),
              const Divider(
                color: Colors.grey,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.home_outlined,
                title: 'Trang chủ',
                infoCount: 0,
                onTap: () => Navigator.pop(context),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.brightness_4_rounded,
                title: 'Sáng/Tối',
                infoCount: 0,
                onTap: () => widget.onTapChangeLanguage!(Action_Drawer.theme),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.language,
                title: 'Ngôn ngữ',
                infoCount: 0,
                onTap: () => widget.onTapChangeLanguage!(Action_Drawer.language),
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.calendar_today,
                title: 'Lịch',
                infoCount: 0,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.pin_drop,
                title: 'Vị trí',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.message_rounded,
                title: 'Tin nhắn',
                infoCount: 8,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.cloud,
                title: 'Thời tiết',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.airplane_ticket,
                title: 'Chuyến bay',
                infoCount: 0,
                doHaveMoreOptions: Icons.arrow_forward_ios,
              ),
              const Divider(color: Colors.grey),
              const Spacer(),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.notifications,
                title: 'Thông báo',
                infoCount: 2,
              ),
              CustomListTile(
                isCollapsed: _isCollapsed,
                icon: Icons.settings,
                title: 'Cài đặt',
                infoCount: 0,
              ),
              const SizedBox(height: 10),
              BottomUserInfo(isCollapsed: _isCollapsed),
              Align(
                alignment: _isCollapsed
                    ? Alignment.bottomRight
                    : Alignment.bottomCenter,
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(
                    _isCollapsed
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Action_Drawer{
  theme, language
}