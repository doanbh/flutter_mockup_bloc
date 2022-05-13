import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';

class PowerRepo<IMvpView> extends BaseRepo {

  // late BasePageMixin _state;
  List<BaseRepo> _listRepo = [];

  void requestListRepo(List<BaseRepo> presenters) {
    _listRepo = presenters;
    // _presenters.forEach(_requestPresenter);
  }

  // void _requestPresenter(BaseRepo presenter) {
  //   // presenter.view = _state;
  // }
}
