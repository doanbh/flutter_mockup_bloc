import 'package:flutter/cupertino.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_cubit.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_presenter.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/model/AuthorResponse.dart';
import 'package:flutter_mockup_bloc/model/selectable_item.dart';
import 'package:flutter_mockup_bloc/repository/author/author_repository.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';
import 'package:flutter_mockup_bloc/common/common_export.dart';
import 'package:flutter_mockup_bloc/repository/city/city_repository.dart';
import 'package:flutter_mockup_bloc/repository/multi_repository.dart';

abstract class HomeView extends BaseView{

}

class HomeCubit extends BaseCubit with BaseRepoMixin<PowerRepo>{
  late AuthorRepository _authRepo;
  late CityRepository _cityRepo;

  AuthorRepository get authRepo => _authRepo;
  CityRepository get cityRepo => _cityRepo;

  List<ItemsAuthorResponse> _listAuthorsItem = [];
  List<ItemsAuthorResponse> get listAuthorsItem => _listAuthorsItem;

  List<SelectableItem> _listCity = [];
  List<SelectableItem> get listCity => _listCity;

  late int _currentAuthorPosition;
  late bool _canLoadMore = true;
  bool get canLoadMore => _canLoadMore;
  int get currentAuthorPosition => (_listAuthorsItem.length - 1);

  set setListAuthorsItem(List<ItemsAuthorResponse> value) {
    _listAuthorsItem = value;
  }

  addAllAuthorItem(List<ItemsAuthorResponse> list){
    _listAuthorsItem.addAll(list);
  }

  clearListAuthors(){
    _listAuthorsItem.clear();
  }

  @override
  PowerRepo createRepo() {
    final PowerRepo powerPresenter = PowerRepo<dynamic>();
    _authRepo = AuthorRepository();
    _cityRepo = CityRepository();
    powerPresenter.requestListRepo([_authRepo, _cityRepo]);
    return powerPresenter;
  }

}

class HomePresenter extends BasePresenter<HomeView, HomeCubit>{
  HomePresenter() : super(cubit: HomeCubit()){
    cubit.initRepo();
    getListAuthor();
  }

  getListAuthor() async {
    try {
      emitState(LoadingState());
      AuthorResponse authorResponse = await cubit.authRepo.getListAuthorRepository(cubit.currentAuthorPosition + 1, 15);
      cubit.addAllAuthorItem(authorResponse.data!.items!);
      emitState(LoadSuccessState(model: authorResponse));
    } catch (e){
      logger.e(e.toString());
    }
  }

  refreshListAuthor() async {
    try {
      cubit.clearListAuthors();
      emitState(LoadingState());
      AuthorResponse authorResponse = await cubit.authRepo.getListAuthorRepository(cubit.currentAuthorPosition + 1, 15);
      cubit.setListAuthorsItem = authorResponse.data!.items!;
      emitState(LoadSuccessState(model: authorResponse));
    } catch (e){
      logger.e(e.toString());
    }
  }

  getListCity(BuildContext context) async {
    try {
      List<SelectableItem> list = await cubit.cityRepo.getListCityRepo(context);
      cubit._listCity = list;
    } catch (e){
      logger.e(e.toString());
    }
  }
}