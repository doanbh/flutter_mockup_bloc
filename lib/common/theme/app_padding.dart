import 'package:flutter/material.dart';

class AppPad {
  static const a10 = EdgeInsets.all(10);
  static const a16 = EdgeInsets.all(16);
  static const a20 = EdgeInsets.all(20);

  static const horiz16 = EdgeInsets.symmetric(horizontal: 16);
  static const vert16 = EdgeInsets.symmetric(vertical: 16);

  static const horiz20 = EdgeInsets.symmetric(horizontal: 20);
  static const vert20 = EdgeInsets.symmetric(vertical: 20);

  static const horiz16Vert10 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const horiz16Vert4 = EdgeInsets.symmetric(horizontal: 16, vertical: 4);

  static const scaffoldListView = EdgeInsets.only(
    top: 74, // 44 + 30
    right: 16,
    bottom: 16,
    left: 16,
  );

  static const formFieldContent = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 10,
  );
  static const formFieldPrefixIcon = EdgeInsets.only(
    top: 8,
    left: 18,
    bottom: 8,
    right: 8,
  );
  static const formFieldSuffixIcon = EdgeInsets.only(
    top: 8,
    left: 8,
    bottom: 8,
    right: 18,
  );

  static const customTabBarLabel = EdgeInsets.only(
    top: 8,
    bottom: 5,
    left: 16,
    right: 16
  );

  static const inputButton = EdgeInsets.symmetric(horizontal: 20);

  static const inputButtonSuffixIcon = EdgeInsets.symmetric(vertical: 10);
}
