import 'package:flutter_mockup_bloc/core/mvp/base_cubit.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_presenter.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/model/AuthorResponse.dart';
import 'package:flutter_mockup_bloc/repository/author/author_repository.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';
import 'package:flutter_mockup_bloc/common/common_export.dart';

abstract class HomeView extends BaseView{

}

class HomeCubit extends BaseCubit with BaseRepoMixin<AuthorRepository>{
  List<ItemsAuthorResponse> _listAuthorsItem = [];
  List<ItemsAuthorResponse> get listAuthorsItem => _listAuthorsItem;

  set setListAuthorsItem(List<ItemsAuthorResponse> value) {
    _listAuthorsItem = value;
  }

  @override
  AuthorRepository createRepo() => AuthorRepository();

}

class HomePresenter extends BasePresenter<HomeView, HomeCubit>{
  HomePresenter() : super(cubit: HomeCubit()){
    cubit.initRepo();
    getListAuthor();
  }

  getListAuthor() async {
    try {
      emitState(LoadingState());
      AuthorResponse authorResponse = await cubit.repo.getListAuthorRepository();
      cubit.setListAuthorsItem = authorResponse.data!.items!;
      emitState(LoadSuccessState(model: authorResponse));
    } catch (e){
      logger.e(e.toString());
    }
  }
}