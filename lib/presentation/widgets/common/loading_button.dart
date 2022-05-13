import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final String? title;
  Icon? icon;
  final bool? isLoading;
  final Function()? onSubmit;
  LoadingButton({Key? key, this.title, this.isLoading : false, this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isLoading! ? null : onSubmit!,
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16.0)),
      icon: isLoading!
          ? Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(2.0),
        child: const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 3,
        ),
      ) : icon ?? SizedBox(),
      label: Text(title!),
    );
  }
}
