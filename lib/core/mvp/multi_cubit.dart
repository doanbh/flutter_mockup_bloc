//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_mockup_bloc/core/mvp/base_list_cubit.dart';
// import 'package:flutter_mockup_bloc/core/mvp/base_page.dart';
// import 'package:flutter_mockup_bloc/core/mvp/base_presenter.dart';
// import 'package:flutter_mockup_bloc/core/mvp/base_presenter.dart';
// import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
//
// /// 管理多个Presenter，实现复用。
// class PowerPresenter<IMvpView> extends BasePresenter{
//
//   PowerPresenter(BasePageMixin state) {
//     _state = state;
//   }
//
//   late BasePageMixin _state;
//   List<BaseCubit> _presenters = [];
//
//   void requestPresenter(List<BaseCubit> presenters) {
//     _presenters = presenters;
//     _presenters.forEach(_requestPresenter);
//   }
//
//   void _requestPresenter(BaseCubit presenter) {
//     presenter = _state.cubit!;
//     presenter.view = _state;
//   }
//
//   @override
//   void deactivate() {
//     _presenters.forEach(_deactivate);
//   }
//
//   void _deactivate(List<Cubit> presenter) {
//     presenter.deactivate();
//   }
//
//   @override
//   void didChangeDependencies() {
//     _presenters.forEach(_didChangeDependencies);
//   }
//
//   void _didChangeDependencies(BasePagePresenter presenter) {
//     presenter.didChangeDependencies();
//   }
//
//   @override
//   void didUpdateWidgets<W>(W oldWidget) {
//
//     void _didUpdateWidgets(BasePagePresenter presenter) {
//       presenter.didUpdateWidgets<W>(oldWidget);
//     }
//     _presenters.forEach(_didUpdateWidgets);
//   }
//
//   @override
//   void dispose() {
//     _presenters.forEach(_dispose);
//   }
//
//   void _dispose(Cubit presenter) {
//     presenter.close();
//   }
//
//   @override
//   void initState() {
//     _presenters.forEach(_initState);
//   }
//
//   void _initState(Cubit presenter) {
//     presenter.emit(InitSate());
//   }
//
// }
