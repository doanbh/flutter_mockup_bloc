// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i20;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../common/common_export.dart' as _i3;
import '../core/view_model/global/global_viewmodel.dart' as _i17;
import '../repository/debug/debug_repository.dart' as _i4;
import '../repository/locale/locale_repository.dart' as _i13;
import '../repository/refresh/refresh_repository.dart' as _i16;
import '../repository/secure_storage/auth/auth_storage.dart' as _i11;
import '../repository/secure_storage/secure_storage.dart' as _i9;
import '../repository/shared_prefs/local/local_storage.dart' as _i12;
import '../utils/preferences/preferences_storage.dart' as _i5;
import 'injectable.dart' as _i21; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.ConnectivityHelper>(registerModule.connectivityHelper());
  gh.lazySingleton<_i4.DebugRepository>(
      () => _i4.DebugRepository(get<_i5.SharedPreferenceStorage>()));
  gh.lazySingleton<_i6.FlutterSecureStorage>(() => registerModule.storage());
  gh.lazySingleton<_i9.SecureStorage>(
      () => _i9.SecureStorage(get<_i6.FlutterSecureStorage>()));
  await gh.singletonAsync<_i10.SharedPreferences>(() => registerModule.prefs(),
      preResolve: true);
  gh.lazySingleton<_i3.SharedPreferenceStorage>(
      () => registerModule.sharedPreferences(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i3.SimpleKeyValueStorage>(() =>
      registerModule.keyValueStorage(
          get<_i3.SharedPreferenceStorage>(), get<_i9.SecureStorage>()));
  gh.lazySingleton<_i11.AuthStorage>(
      () => _i11.AuthStorage(get<_i3.SimpleKeyValueStorage>()));
  gh.lazySingleton<_i12.LocalStorage>(() => _i12.LocalStorage(
      get<_i11.AuthStorage>(), get<_i3.SharedPreferenceStorage>()));
  gh.lazySingleton<_i13.LocaleRepository>(
      () => _i13.LocaleRepository(get<_i3.SharedPreferenceStorage>()));
  gh.lazySingleton<_i16.RefreshRepository>(
      () => _i16.RefreshRepository(get<_i11.AuthStorage>()));
  gh.factory<_i17.GlobalViewModel>(() => _i17.GlobalViewModel(
      get<_i13.LocaleRepository>(),
      get<_i4.DebugRepository>(),
      get<_i12.LocalStorage>()));
  return get;
}

class _$RegisterModule extends _i21.RegisterModule {}
