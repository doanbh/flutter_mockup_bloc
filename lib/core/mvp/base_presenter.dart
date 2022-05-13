
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_cubit.dart';
abstract class ILifecycle<C extends BaseCubit> extends Cubit<BaseState>{
  ILifecycle(BaseState initialState) : super(initialState);


  void initStateDone();

  void didChangeDependencies();

  void didUpdateWidgets<W>(W oldWidget);

  void deactivate();

  void dispose();

  void emitState(BaseState s);
}


class BasePresenter<V extends BaseView, C extends BaseCubit> extends ILifecycle {

  late V view;
  late C cubit;

  BasePresenter({required this.cubit}) : super(InitSate());
  // late S state;

  @override
  void deactivate() {}

  @override
  void didChangeDependencies() {}

  @override
  void didUpdateWidgets<W>(W oldWidget) {}

  @override
  void initStateDone() {
    // TODO: implement initState
    view.initViewDone();
  }

  @override
  void dispose() {}

  @override
  void emitState(BaseState s) {
    // TODO: implement emitState
    print("emitState: ${s}");
    cubit.emit(s);
  }

}
