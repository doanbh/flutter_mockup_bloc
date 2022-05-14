import 'package:flutter_mockup_bloc/core/mvp/base_cubit.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_presenter.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';
import 'package:flutter_mockup_bloc/repository/profile/profile_repository.dart';

abstract class ProfileView extends BaseView {

}

class ProfileCubit extends BaseCubit with BaseRepoMixin{
  @override
  BaseRepo<BaseView> createRepo() => ProfileRepo();

}

class ProfilePresenter extends BasePresenter<ProfileView, ProfileCubit> {
  ProfilePresenter() : super(cubit: ProfileCubit()){
    cubit.initRepo();
  }

  updateProfile(){

  }
}