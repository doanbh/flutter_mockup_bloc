import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_presenter.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/dialog/progress_dialog.dart';
import 'package:flutter_mockup_bloc/utils/device/toast_utils.dart';
import 'base_state_view.dart';
import 'package:flutter_mockup_bloc/common/common_export.dart';

mixin BasePageMixin<T extends StatefulWidget, P extends BasePresenter> on State<T> implements BaseView {

  P? presenter;

  P createPresenter();

  @override
  BuildContext getContext() {
    return context;
  }
  
  @override
  void closeProgress() {
    if (mounted && _isShowDialog) {
      _isShowDialog = false;
      Navigator.pop(context);
    }
  }

  bool _isShowDialog = false;

  @override
  void showProgress() {
    if (mounted && !_isShowDialog) {
      _isShowDialog = true;
      try {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          barrierColor: const Color(0x00FFFFFF),
          builder:(_) {
            return WillPopScope(
              onWillPop: () async {
                _isShowDialog = false;
                return Future.value(true);
              },
              child: buildProgress(),
            );
          },
        );
      } catch(e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  void showToast(String string) {
    Toast.show(string);
  }
  
  Widget buildProgress() => const ProgressDialog(hintText: 'Đang tải...');

  @override
  void didChangeDependencies() {
    presenter?.didChangeDependencies();
    logger.debug('$T ==> didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    presenter?.dispose();
    logger.debug('$T ==> dispose');
    super.dispose();
  }

  @override
  void deactivate() {
    presenter?.deactivate();
    logger.debug('$T ==> deactivate');
    super.deactivate();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    presenter?.didUpdateWidgets<T>(oldWidget);
    logger.debug('$T ==> didUpdateWidgets');
    super.didUpdateWidget(oldWidget);

  }

  @override
  void initState() {
    logger.debug('$T ==> initState');
    presenter = createPresenter();
    presenter?.view = this;
    // print("view: ${presenter?.view}");
    presenter?.initStateDone();
    super.initState();
  }
  
}
