import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/common/theme/app_decoration.dart';
import 'package:flutter_mockup_bloc/common/theme/app_padding.dart';
import 'package:flutter_mockup_bloc/model/AuthorResponse.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/load_image.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/widget_utils.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/dialog/app_dialogs.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/app_fonts.dart';
import 'package:flutter_mockup_bloc/resource/app_text_styles.dart';
import 'package:flutter_mockup_bloc/utils/ui/icon_utils.dart';

class AuthorItem extends StatelessWidget {
  const AuthorItem({
    Key? key,
    required this.model,
    this.switchTitlePositionWithSubtitle = false,
    this.showSaveBtn = false,
    this.showSaveAndChatBtn = false,
    this.explicitDate = true,
    this.additionalWidget,
    this.margin,
    this.addDeleteBtnBehind = false,
    this.onDeleteBtnBehindTap,
  }) : super(key: key);

  final ItemsAuthorResponse model;
  final bool switchTitlePositionWithSubtitle;
  final bool showSaveBtn;
  final bool showSaveAndChatBtn;
  final bool explicitDate;
  final Widget? additionalWidget;
  final EdgeInsetsGeometry? margin;
  final bool addDeleteBtnBehind;
  final void Function()? onDeleteBtnBehindTap;

  _onTap(BuildContext context){

  }

  _onSaveBtnTap(BuildContext context) {

  }

  _onChatBtnTap(BuildContext context) {

  }

  // _onChatBtnBehindTap(BuildContext context) => _onChatBtnTap(context)
  //     ?.whenComplete(() => slidableController?.activeState?.close());

  static const BorderRadius _borderRadius = BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
    bottomRight: Radius.circular(10),
    bottomLeft: Radius.circular(10),
  );

  static const TextStyle _title = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.text,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 23 / 16,
  );

  static const TextStyle _subtitle = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.primary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
  );

  static const TextStyle titleSwitched = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.primary,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 23 / 16,
  );

  static const TextStyle subtitleSwitched = TextStyle(
    fontFamily: AppFonts.roboto,
    color: AppColors.text,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
  );

  @override
  Widget build(BuildContext context) {
    final IconButton saveBtn, chatBtn;

    saveBtn = IconButton(
      onPressed: () => AppDialogs.showLoginDialog(
        context,
        'Bạn chưa đăng nhập. Vui lòng đăng nhập để lưu ứng viên này!',
      ),
      icon: IconUtils.dialog_check_icon,
    );
    chatBtn = IconButton(
      onPressed: () => AppDialogs.showLoginDialog(
        context,
        'Bạn chưa đăng nhập. Vui lòng đăng nhập để chat với ứng viên này!',
      ),
      icon: IconUtils.dialog_check_icon,
    );

    late final Widget avatar = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LoadImage(model.avatar!),
    );

    /*
    late final Widget avatar = CachedNetworkImage(
      key: Key(model.avatarUrl),
      imageUrl: model.avatarUrl,
      width: 80,
      height: 80,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (_, __, ___) => const DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border.fromBorderSide(
            BorderSide(
              color: AppColors.border,
            ),
          ),
          // borderRadius: _borderRadius,
          shape: BoxShape.circle,
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, 0),
          //     spreadRadius: 0.7,
          //     color: AppColors.border,
          //   ),
          // ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: WidgetUtils.loadingCircle,
        ),
      ),
      imageBuilder: (_, imageProvider) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border.fromBorderSide(
            BorderSide(
              color: AppColors.border,
            ),
          ),
          // borderRadius: _borderRadius,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      errorWidget: (_, __, ___) => model.isFemale == true
          ? Image.asset(AssetPath.anonymous_female_avatar)
          : Image.asset(AssetPath.anonymous_male_avatar),
      // const DecoratedBox(
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: _borderRadius,
      //     boxShadow: [
      //       BoxShadow(
      //         offset: Offset(0, 0),
      //         spreadRadius: 0.7,
      //         color: AppColors.border,
      //       ),
      //     ],
      //   ),
      //   child: AnonymousCandidateAvatarPainter.customPaint,
      // ),
      //
      // model.isFemale == true
      //   ? const CustomPaint(
      //       size: Size(80, 80),
      //       painter: AnonymousFemaleCandidateAvatarPainter(),
      //     )
      //   : const CustomPaint(
      //       size: Size(80, 80),
      //       painter: AnonymousMaleCandidateAvatarPainter(),
      //     ),
    );
    */

    Widget current = InkWell(
      onTap: () => _onTap(context),
      borderRadius: _borderRadius,
      child: Ink(
        padding: AppPad.a16,
        decoration: AppDecoration.cardBox.copyWith(borderRadius: _borderRadius),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                avatar,
                const SizedBox(height: 7),
                if (showSaveAndChatBtn)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [saveBtn, chatBtn],
                  )
                else if (showSaveBtn)
                  saveBtn
              ],
            ),
            SizedBoxExt.w10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: WidgetUtils.addSizedBoxAsSeparator(SizedBoxExt.h10, [
                  Text(
                    model.name!,
                    style: titleSwitched,
                    overflow: TextOverflow.visible,
                  ),
                  _getItemDataWithIcon(
                    Icons.insert_drive_file,
                    model.id!,
                  ),
                  _getItemDataWithIcon(
                    Icons.calendar_today_outlined,
                    model.createdAt!,
                  ),
                ]),
              ),
            ),
            SizedBoxExt.w10,
          ],
        ),
      ),
    );

    if (margin != null) {
      current = Padding(padding: margin!, child: current);
    }

    return current;
  }

  Row _getItemDataWithIcon(IconData icon, String data) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Icon(icon),
          SizedBoxExt.w5,
          Expanded(
            child: Text(
              data,
              style: AppTextStyles.itemData,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      );

  Text _getItemDataWithLabel(String? label, String data) => Text.rich(
        TextSpan(children: [
          TextSpan(
            text: label != null ? label + ': ' : null,
            style: AppTextStyles.itemDataLabel,
          ),
          TextSpan(
            text: data,
            style: AppTextStyles.itemData,
          ),
        ]),
      );
}
