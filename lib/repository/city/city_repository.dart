import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/repository/base_repository.dart';
import 'package:flutter_mockup_bloc/repository/common_data_repo.dart';

class CityRepository extends BaseRepo {
  getListCityRepo(BuildContext context){
    return context.read<CommonDataRepo>().getCity();
  }
}