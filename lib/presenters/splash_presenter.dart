import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/common/loading/loading.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_presenter.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_cubit.dart';
import 'package:flutter_mockup_bloc/model/UserItem.dart';
import 'package:flutter_mockup_bloc/repository/auth/user_info_repository.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';
import 'package:flutter_mockup_bloc/repository/multi_repository.dart';
import 'package:flutter_mockup_bloc/repository/splash/splash_repo.dart';

/*
┌────────────────────────────────────────────────────────────────────────────┐
│                                                                            │
│                                                                            │
│                                                                            │
│     ┌───────────────┐         ┌─────────────┐         ┌─────────────┐      │
│     │               │         │             │ False   │             │      │
│     │    Splash     ├─────────► Check Token ├─────────►   Login     │      │
│     │               │         │             │         │             │      │
│     └───────────────┘         └──────┬──────┘         └─────────────┘      │
│                                      │                                     │
│                                      │ True                                │
│                               ┌──────▼──────┐                              │
│                               │             │                              │
│                               │    Home     │                              │
│                               │             │                              │
│                               └─────────────┘                              │
│                                                                            │
│                                                                            │
│                                                                            │
└────────────────────────────────────────────────────────────────────────────┘
 */

abstract class SplashView implements BaseView {

  void gotoHome(UserInfoRepository userInfoRepository);

  void gotoLogin();
}

class SplashCubit extends BaseCubit with BaseRepoMixin<PowerRepo>{

  late SplashRepo _splashRepo;
  late UserInfoRepository _userInfoRepository;

  // SplashCubit() : super(repo: SplashRepo());

  getInfoUser(){

  }

  @override
  PowerRepo createRepo() {
    // TODO: implement createRepo
    final PowerRepo powerPresenter = PowerRepo<dynamic>();
    _splashRepo = SplashRepo();
    _userInfoRepository = UserInfoRepository();
    powerPresenter.requestListRepo([_splashRepo, _userInfoRepository]);
    return powerPresenter;
  }
}

class SplashPresenter extends BasePresenter<SplashView, SplashCubit>  {
  // nếu cần view thì gọi trong initStateDone, ko thì khởi tạo luôn trong constructor
  SplashPresenter()
      : _hasInfoUpdated = false,
        super(cubit: SplashCubit()) {

    //
    cubit.initRepo();
  }

  late bool _hasInfoUpdated;
  bool get hasInfoUpdated => _hasInfoUpdated;

  _checkToken() async {
    if (cubit._splashRepo.checkTokenExits()){
      view.showCustomProgress(loader: kLoadingWidget());
      UserItem user = await cubit._userInfoRepository.getUserInfo();
      cubit._userInfoRepository.userInfo = user.data!.userInfo!;
      Future.delayed(const Duration(seconds: 2));
      emitState(LoadSuccessState(model: 2));
      view.gotoHome(cubit._userInfoRepository);
      // UserItem user = cubit.getInfoUser();
    } else {
      //goto auth
      view.gotoLogin();
    }
  }

  _loadData() async {

  }

  test(){

  }

  @override
  void initStateDone() {
    // TODO: implement initState
    cubit._userInfoRepository.setViewRepo(view);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _checkToken();
    });
    super.initStateDone();
  }
}


