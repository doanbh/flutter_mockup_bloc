import 'package:flutter/material.dart';

import 'app_router.dart';

typedef PageBuilder = Widget Function();

class PageConfig {
  late PageBuilder pageBuilder;
  Transition? transition;
  Duration? transitionDuration;
  bool preventDuplicates = true;
  Curve? curve;
  bool opaque = true;
  bool fullscreenDialog = false;
}
