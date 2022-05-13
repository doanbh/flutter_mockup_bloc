import 'package:flutter_mockup_bloc/core/net/api.dart';
import 'package:flutter_mockup_bloc/core/net/dio_utils.dart';
import 'package:flutter_mockup_bloc/model/LoginResponse.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';

class LoginRepository extends BaseRepo{

  Future<LoginResponse> login(user, pass) async {
     return requestNetwork<LoginResponse>(Method.get, url: Api.LOGIN);
  }
}