import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/utils/ui/dialog/check_icon_painter.dart';
import 'package:flutter_mockup_bloc/utils/ui/dialog/info_icon_painter.dart';
import 'package:flutter_mockup_bloc/utils/ui/dialog/power_icon_painter.dart';
import 'package:flutter_mockup_bloc/utils/ui/dialog/trash_icon_painter.dart';
import 'package:flutter_mockup_bloc/utils/ui/dialog/x_icon_painter.dart';
import 'package:flutter_mockup_bloc/utils/ui/drawer/login_icon_painter.dart';

class IconUtils {
  static const dataItemIconSize = Size(20, 20);
  static const defaultIconSize = Size(24, 24);
  static const navIconSize = Size(25, 25);
  static const homeBtnIconSize = Size(73, 73);
  static const sectionIconSize = Size(153, 153);
  static const dialogIconSize = Size(70, 70);
  static const chatOptionIconSize = Size(50, 50);
  static const inlineTextIconSize = Size(13, 13);
  
  // Dialog

  static const dialog_x_icon = CustomPaint(
    size: dialogIconSize,
    painter: XIconPainter(),
  );

  static const dialog_check_icon = CustomPaint(
    size: dialogIconSize,
    painter: CheckIconPainter(),
  );

  static const dialog_info_icon = CustomPaint(
    size: dialogIconSize,
    painter: InfoIconPainter(),
  );

  static const dialog_power_icon = CustomPaint(
    size: dialogIconSize,
    painter: PowerIconPainter(),
  );

  static const dialog_trash_icon = CustomPaint(
    size: dialogIconSize,
    painter: TrashIconPainter(),
  );
  // Other

  static const login_icon = CustomPaint(
    size: dialogIconSize,
    painter: LoginIconPainter(),
  );
  
}
