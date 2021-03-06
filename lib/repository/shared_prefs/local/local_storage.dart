import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/common/common_export.dart';
import 'package:flutter_mockup_bloc/repository/secure_storage/auth/auth_storage.dart';
import 'package:flutter_mockup_bloc/utils/extension/iterable_extensions.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class LocalStorage {
  @factoryMethod
  factory LocalStorage(AuthStorage storage, SharedPreferenceStorage preferences) = _LocalStorage;

  Future<void> checkForNewInstallation();

  ThemeMode getThemeMode();

  Future<void> updateThemeMode(ThemeMode themeMode);
}

class _LocalStorage implements LocalStorage {
  static const _uninstallCheckKey = 'UNINSTALL_CHECK';
  static const _appearanceThemeKey = 'APPEARANCE_THEME';

  final AuthStorage _authStorage;
  final SharedPreferenceStorage _sharedPreferences;

  _LocalStorage(this._authStorage, this._sharedPreferences);

  @override
  Future<void> checkForNewInstallation() async {
    final result = _sharedPreferences.getBoolean(_uninstallCheckKey);
    if (result == null) {
      await _sharedPreferences.saveBoolean(key: _uninstallCheckKey, value: true);
      await _authStorage.clear();
    }
  }

  @override
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await _sharedPreferences.saveString(key: _appearanceThemeKey, value: themeMode.toString());
  }

  @override
  ThemeMode getThemeMode() {
    final themeString = _sharedPreferences.getString(_appearanceThemeKey);
    final theme = ThemeMode.values.find((element) => element.toString() == themeString);
    return theme ?? ThemeMode.system;
  }
}
