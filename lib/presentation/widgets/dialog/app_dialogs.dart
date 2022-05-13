import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/presentation/router/app_pages.dart';
import 'package:flutter_mockup_bloc/presentation/router/app_router.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/button/pill_button.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/dialog/custom_dialog.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/dialog/input_dialog.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:flutter_mockup_bloc/utils/ui/icon_utils.dart';

_navigateBack(BuildContext context) => AppRouter.back(context, result: false);

class AppDialogs {

  static Future<void> showLoginDialog(
          BuildContext context, String description) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.dialogBarrier,
        builder: (context) => CustomDialog(
          icon: IconUtils.login_icon,
          description: description,
          affirmativeText: AppConstants.login,
          placeButtonsInColumn: true,
          additionalWidget: false
              ? null
              : PillButton(
                  type: ButtonType.OUTLINED_PRIMARY,
                  text: AppConstants.signUp,
                  onPressed: () => AppRouter.toPage(
                    context,
                    AppPages.Auth_Login,
                    arguments: {
                      'replaceAllByLoginPageAfterSuccess': true,
                    },
                  ),
                ),
          onAffirmativeBtnPressed: () => AppRouter.toPage(
            context,
            AppPages.Auth_Login,
            arguments: {
              // 'onSuccess': () => AppRouter.back(context, result: true),
              'canNavigateBack': true,
            },
          ),
          onCancel: () => hideDialog(context),
        ),
        routeSettings: const RouteSettings(name: 'login'),
      );

  static Future<void> showConfirmSignOutDialog(
    BuildContext context, {
    required void Function() onConfirm,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.dialogBarrier,
        builder: (context) => CustomDialog(
          icon: IconUtils.dialog_power_icon,
          description: 'Bạn có chắc chắn muốn đăng xuất?',
          affirmativeText: AppConstants.signOut,
          placeButtonsInColumn: true,
          switchButtonsPositionAndStyle: true,
          onAffirmativeBtnPressed: onConfirm,
          onCancel: () => hideDialog(context),
        ),
        routeSettings: const RouteSettings(name: 'confirm_sign_out'),
      );

  static Future<void> showInfoDialog(BuildContext context, String message,
          [void Function()? onAffirmativeBtnPressed]) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.dialogBarrier,
        builder: (context) => CustomDialog(
          icon: IconUtils.dialog_info_icon,
          description: message,
          isMessageDialog: true,
          onAffirmativeBtnPressed:
              onAffirmativeBtnPressed ?? () => hideDialog(context),
          onCancel: () => hideDialog(context),
        ),
        routeSettings: RouteSettings(name: 'infomation', arguments: message),
      );

  static Future<void> _showReqestUseOrBuyPointDialog(
    BuildContext context, {
    required int points,
    required String action,
    required void Function() onAgreeUsingPointBtnPressed,
    void Function()? onCancelBtnPressed,
    required String routeNameWhenPointIsGreaterThanZero,
    required String routeNameWhenPointIsEqualZero,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.dialogBarrier,
        builder: (context) => points > 0
            ? CustomDialog(
                icon: IconUtils.dialog_info_icon,
                description: "Hiện bạn còn $points điểm. "
                    "$action ứng viên này bạn phải mất 1 điểm.",
                affirmativeText: AppConstants.agree,
                switchButtonsPositionAndStyle: true,
                onAffirmativeBtnPressed: () {
                  hideDialog(context);
                  onAgreeUsingPointBtnPressed();
                },
                onCancel: onCancelBtnPressed ?? () => hideDialog(context),
              )
            : CustomDialog(
                icon: IconUtils.dialog_info_icon,
                description: 'Hiện bạn còn 0 điểm. '
                    "$action ứng viên này bạn phải mất 1 điểm, "
                    'hãy liên lạc với chuyên viên tư vấn của timviec365 để mua điểm.',
                affirmativeText: 'Mua điểm',
                switchButtonsPositionAndStyle: true,
                placeButtonsInColumn: true,
                onAffirmativeBtnPressed: () async {
                  // await SystemUtils.openUrlInBrowser(
                  //   WebPageUri.servicesPricingPage,
                  // );
                  hideDialog(context);
                },
                onCancel: onCancelBtnPressed ?? () => hideDialog(context),
              ),
        routeSettings: RouteSettings(
          name: points > 0
              ? routeNameWhenPointIsGreaterThanZero
              : routeNameWhenPointIsEqualZero,
        ),
      );

  static Future<void> showReqestUseOrBuyPointDialog(
    BuildContext context, {
    required int points,
    required void Function() onAgreeUsingPointBtnPressed,
  }) =>
      _showReqestUseOrBuyPointDialog(
        context,
        points: points,
        action: 'Để xem và chat với',
        onAgreeUsingPointBtnPressed: onAgreeUsingPointBtnPressed,
        routeNameWhenPointIsGreaterThanZero: 'request_use_point',
        routeNameWhenPointIsEqualZero: 'request_buy_point',
      );

  static Future<void> showRequestUseOrBuyPointToChatDialog(
    BuildContext context, {
    required int points,
    required void Function() onAgreeUsingPointBtnPressed,
    required void Function() onBuyPointBtnPressed,
  }) =>
      _showReqestUseOrBuyPointDialog(
        context,
        points: points,
        action: 'Để tiếp tục chat với',
        onAgreeUsingPointBtnPressed: onAgreeUsingPointBtnPressed,
        routeNameWhenPointIsGreaterThanZero: 'request_use_point_to_chat',
        routeNameWhenPointIsEqualZero: 'request_buy_point_to_chat',
      );

  static Future<void> showRequestUseOrBuyPointToViewCvDialog(
    BuildContext context, {
    required int points,
    required void Function() onAgreeUsingPointBtnPressed,
    required void Function() onCancelBtnPressed,
  }) =>
      _showReqestUseOrBuyPointDialog(
        context,
        points: points,
        action: 'Để xem hồ sơ của',
        onAgreeUsingPointBtnPressed: onAgreeUsingPointBtnPressed,
        onCancelBtnPressed: onCancelBtnPressed,
        routeNameWhenPointIsGreaterThanZero: 'request_use_point_to_chat',
        routeNameWhenPointIsEqualZero: 'request_buy_point_to_chat',
      );

  static Future<void> showConfirmDeleteDialog(
    BuildContext context, {
    required String target,
    required void Function() onConfirm,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.dialogBarrier,
        builder: (context) => CustomDialog(
          icon: IconUtils.dialog_trash_icon,
          description: "Bạn có chắc chắn muốn xóa $target này?",
          affirmativeText: AppConstants.agree,
          switchButtonsPositionAndStyle: true,
          onAffirmativeBtnPressed: onConfirm,
          onCancel: () => hideDialog(context),
        ),
        routeSettings: const RouteSettings(name: 'confirm_delete'),
      );

  static Future<void> showInputNoteDialog(
    BuildContext context, {
    required String data,
    required void Function() onSave,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.dialogBarrier,
        builder: (context) => InputDialog(
          data: data,
          onSaveBtnPressed: onSave,
        ),
        routeSettings: const RouteSettings(name: 'input_note'),
      );

  static Future<void> showRequestPermissionDialog(
    BuildContext context, {
    required String message,
    String affirmativeText = AppConstants.agree,
    bool? placeButtonsInColumn,
    required void Function() onAgreeBtnPressed,
    void Function()? onCancelBtnPressed,
    String? routeName,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.dialogBarrier,
        builder: (context) => CustomDialog(
          icon: IconUtils.dialog_info_icon,
          description: message,
          affirmativeText: affirmativeText,
          placeButtonsInColumn: placeButtonsInColumn ?? false,
          onAffirmativeBtnPressed: () {
            hideDialog(context);
            onAgreeBtnPressed();
          },
          onCancel: onCancelBtnPressed ?? () => hideDialog(context),
        ),
        routeSettings: RouteSettings(name: routeName),
      );

  static Future<void> showDialogFeatureInDevelopment(BuildContext context) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.dialogBarrier,
        builder: (context) => CustomDialog(
          isMessageDialog: true,
          icon: IconUtils.dialog_info_icon,
          description: AppConstants.featureInDevelopment,
          onAffirmativeBtnPressed: () => hideDialog(context),
          onCancel: () => hideDialog(context),
        ),
        routeSettings: const RouteSettings(name: 'confirm_delete'),
      );

  static Future<void> showSuccessDialog(BuildContext context, String msg,
          [void Function()? onAffirmativeBtnPressed]) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.dialogBarrier,
        builder: (_) => CustomDialog(
          isMessageDialog: true,
          icon: IconUtils.dialog_check_icon,
          description: msg,
          onAffirmativeBtnPressed:
              onAffirmativeBtnPressed ?? () => hideDialog(context),
          onCancel: () => hideDialog(context),
        ),
        routeSettings: RouteSettings(name: 'success', arguments: msg),
      );

  static Future<void> showErrorDialog(BuildContext context, String msg,
          [void Function()? onAffirmativeBtnPressed]) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.dialogBarrier,
        builder: (_) => CustomDialog(
          isMessageDialog: true,
          icon: IconUtils.dialog_x_icon,
          description: msg,
          onAffirmativeBtnPressed:
              onAffirmativeBtnPressed ?? () => hideDialog(context),
          onCancel: () => hideDialog(context),
        ),
        routeSettings: RouteSettings(name: 'error', arguments: msg),
      );

  static hideDialog(BuildContext context) => _navigateBack(context);

  static showLoadingCircle(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColors.dialogBarrier,
        builder: (_) => WillPopScope(
          onWillPop: () async => false,
          child: SizedBox.expand(
            child: Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
        ),
        routeSettings: const RouteSettings(name: 'loading'),
      );

  static hideLoadingCircle(BuildContext context) => _navigateBack(context);

  static resolveSuccessState(BuildContext context, String message,
          [void Function()? affirmativeBtnPressedCallback]) =>
      showSuccessDialog(context, message, () {
        // hide this dialog
        hideDialog(context);
        hideLoadingCircle(context);
        affirmativeBtnPressedCallback?.call();
      });

  static resolveFailedState(BuildContext context, String error) =>
      showErrorDialog(context, error, () {
        // hide this dialog
        hideDialog(context);
        hideLoadingCircle(context);
      });

  static Future<bool?> showToast(BuildContext context, String msg) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          Future.delayed(
            Duration(milliseconds: 1500),
            () => Navigator.pop(context, false),
          );

          return WillPopScope(
            onWillPop: () async {
              Navigator.pop(context, true);
              return false;
            },
            child: IgnorePointer(
              child: Material(
                type: MaterialType.transparency,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Chip(
                      label: Text(
                        msg,
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.black.withOpacity(0.8),
                      labelPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
