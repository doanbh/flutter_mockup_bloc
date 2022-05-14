
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/*

╭━━━┳╮╱╱╱╱╱╱╱╱╱╱╱╭━━━╮╱╱╱╱╱╱╱╱╱╭━━━┳━━━┳╮╱╱╭╮
┃╭━╮┃┃╱╱╱╱╱╱╱╱╱╱╱╰╮╭╮┃╱╱╱╱╱╱╱╱╱╰╮╭╮┃╭━━┫╰╮╭╯┃
┃╰━╯┃╰━┳━━┳━╮╭━━╮╱┃┃┃┣━━┳━━┳━╮╱╱┃┃┃┃╰━━╋╮┃┃╭╯
┃╭━━┫╭╮┃╭╮┃╭╮┫╭╮┃╱┃┃┃┃╭╮┃╭╮┃╭╮╮╱┃┃┃┃╭━━╯┃╰╯┃
┃┃╱╱┃┃┃┃╰╯┃┃┃┃╰╯┃╭╯╰╯┃╰╯┃╭╮┃┃┃┃╭╯╰╯┃╰━━╮╰╮╭╯
╰╯╱╱╰╯╰┻━━┻╯╰┻━╮┃╰━━━┻━━┻╯╰┻╯╰╯╰━━━┻━━━╯╱╰╯
╱╱╱╱╱╱╱╱╱╱╱╱╱╭━╯┃
╱╱╱╱╱╱╱╱╱╱╱╱╱╰━━╯

*/

abstract class BaseView {

  BuildContext getContext();
  /// Show Progress
  void showProgress();

  /// Close Progress
  void closeProgress();

  /// Show Toast
  void showToast(String string);

  /// Progress
  void showCustomProgress({Widget loader});

  /// showDialogCustom
  void showDialogCustom(Widget child, {String title});

  void initViewDone();
}

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object> get props => [];
}

class InitSate extends BaseState {}

class LoadingState extends BaseState {
}

class LoadSuccessState extends BaseState {
  final dynamic model;

  const LoadSuccessState({required this.model});

  @override
  List<Object> get props => [model];
}

class LoadFailedState extends BaseState {
  final dynamic error;

  const LoadFailedState({required this.error});

  @override
  List<Object> get props => [error];
}
