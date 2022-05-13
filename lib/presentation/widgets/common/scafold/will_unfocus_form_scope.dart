import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/utils/extension/system_chrome_extension.dart';

class WillUnfocusFormScope extends StatelessWidget {
  const WillUnfocusFormScope({
    Key? key,
    required this.child,
    this.willUnfocusCallback,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? willUnfocusCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemChromeExtension.hideKeyboardIfVisible();
        willUnfocusCallback?.call();
      },
      child: child,
    );
  }
}
