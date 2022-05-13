import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';

// mixin BaseCubit<C extends Cubit> implements BaseView {
//   C? cubittt;
//
//   C? getCubit() => cubittt;
// }

abstract class BaseCubit extends Cubit<BaseState>{
  BaseCubit() : super(InitSate());
}