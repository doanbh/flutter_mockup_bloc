import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

class Utils {

}

/// String 空安全处理
extension StringExtension on String? {
  String get nullSafe => this ?? '';
}
