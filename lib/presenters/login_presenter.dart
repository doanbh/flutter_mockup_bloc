import 'package:flutter_mockup_bloc/core/mvp/base_cubit.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_presenter.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/model/LoginResponse.dart';
import 'package:flutter_mockup_bloc/model/UserItem.dart';
import 'package:flutter_mockup_bloc/repository/auth/login_repository.dart';
import 'package:flutter_mockup_bloc/repository/auth/user_info_repository.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';
import 'package:flutter_mockup_bloc/common/common_export.dart';
import 'package:flutter_mockup_bloc/repository/multi_repository.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:sp_util/sp_util.dart';

abstract class LoginView implements BaseView {
  void gotoHome(UserInfoRepository userInfoRepo);

  void tryAgain();
}

class LoginCubit extends BaseCubit with BaseRepoMixin<PowerRepo>{
  late LoginRepository _loginRepo;
  late UserInfoRepository _userInfoRepo;

  LoginRepository get loginRepo => _loginRepo;
  UserInfoRepository get userInfoRepo => _userInfoRepo;

  @override
  PowerRepo createRepo() {
    // TODO: implement createRepo
    final PowerRepo powerPresenter = PowerRepo<dynamic>();
    _loginRepo = LoginRepository();
    _userInfoRepo = UserInfoRepository();
    powerPresenter.requestListRepo([_loginRepo, _userInfoRepo]);
    return powerPresenter;
  }

  saveToken(LoginResponse loginResponse){
    SpUtil.putString(AppConstants.accessToken, loginResponse.data!.accessToken!);
    SpUtil.putString(AppConstants.refreshToken, loginResponse.data!.refreshToken!);
  }
}

class LoginPresenter extends BasePresenter<LoginView, LoginCubit>{
  LoginPresenter() : super(cubit: LoginCubit()){
    cubit.initRepo();
  }

  loginUser(email, pass) async {
    try {
      emitState(LoadingState());
      LoginResponse loginResponse = await cubit.loginRepo.login(email, pass);
      emitState(LoadSuccessState(model: loginResponse));
      UserItem user = await cubit.userInfoRepo.getUserInfo();
      cubit.userInfoRepo.userInfo = user.data!.userInfo!;
      view.gotoHome(cubit.userInfoRepo);
      // view.showToast(loginResponse.data!.accessToken!);
      cubit.saveToken(loginResponse);
    } catch (e){
      logger.e(e.toString());
      view.tryAgain();
    }
  }
}