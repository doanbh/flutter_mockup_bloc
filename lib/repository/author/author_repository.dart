import 'package:flutter_mockup_bloc/core/net/api.dart';
import 'package:flutter_mockup_bloc/core/net/dio_utils.dart';
import 'package:flutter_mockup_bloc/model/AuthorResponse.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';

class AuthorRepository extends BaseRepo{

  getListAuthorRepository(currentPos, maxPos) async {
    final Map<String, dynamic> params = <String, dynamic>{};
    params['currentPos'] = currentPos;
    params['maxPos'] = maxPos;
    return requestNetwork<AuthorResponse>(Method.get, url: Api.GET_LIST_AUTHOR, queryParameters: params,);
  }
}