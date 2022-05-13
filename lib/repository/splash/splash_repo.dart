import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:sp_util/sp_util.dart';

class SplashRepo extends BaseRepo {

  bool checkTokenExits() {
    // print("getCity: ${SpUtil.getString("city")}");
    if (SpUtil.getString(AppConstants.accessToken, defValue: "")!.isNotEmpty){
      return true;
    }
    return false;
  }

}