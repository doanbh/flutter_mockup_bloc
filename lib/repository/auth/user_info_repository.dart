import 'package:flutter_mockup_bloc/core/net/api.dart';
import 'package:flutter_mockup_bloc/core/net/dio_utils.dart';
import 'package:flutter_mockup_bloc/model/UserItem.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';

class UserInfoRepository extends BaseRepo{

  getUserInfo() {
    return requestNetwork<UserItem>(Method.get, url: Api.USER_INFO);
  }
}