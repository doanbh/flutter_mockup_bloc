import 'package:flutter/foundation.dart';
import 'package:flutter_mockup_bloc/utils/extension/string_extension.dart';

abstract class _AppIds {
  const _AppIds();

  String? get androidId => null;

  String? get iosId => null;
}

mixin AppStoreUri on _AppIds {
  String? get nativeAndroid =>
      androidId == null ? null : "market://details?id=$androidId";

  String? get androidWeb => androidId == null
      ? null
      : "https://play.google.com/store/apps/details?id=$androidId";

  String? get nativeIos => iosId == null
      ? null
      : "itms-apps://itunes.apple.com/app/apple-store/id$iosId?l=vi";

  String? get iosWeb => iosId == null
      ? null
      : "https://apps.apple.com/app/apple-store/id$iosId?l=vi";
}

///////////////////////////////////////////////////////////////////////////////

class _SkypeApp extends _AppIds with AppStoreUri {
  const _SkypeApp();

  @override
  String? get androidId => 'com.skype.raider';

  @override
  String? get iosId => '304878510';
}

class _HourJobsApp extends _AppIds with AppStoreUri {
  const _HourJobsApp();

  @override
  String? get androidId => 'vn.timviec365.myapplication';

  @override
  String? get iosId => '1439750359';
}

class _BoardingHouseApp extends _AppIds with AppStoreUri {
  const _BoardingHouseApp();

  @override
  String? get androidId => 'com.nhatro365vn';
}

class _TutorHouseApp extends _AppIds with AppStoreUri {
  const _TutorHouseApp();

  @override
  String? get androidId => 'vn.timviec365.giasu';
}

///////////////////////////////////////////////////////////////////////////////

abstract class Hotline {
  const Hotline();

  String get phoneNumber;

  String get display;

  @nonVirtual
  String get urlScheme => phoneNumber.toPhoneLaunchUri;
}

///////////////////////////////////////////////////////////////////////////////

class _Hotline1 extends Hotline {
  const _Hotline1();

  @override
  String get phoneNumber => '1900633682';

  @override
  String get display => '1900633682 - phím 1';
}

class _Hotline2 extends Hotline {
  const _Hotline2();

  @override
  String get phoneNumber => '0982079209';

  @override
  String get display => '0982.079.209';
}

///////////////////////////////////////////////////////////////////////////////

class AppUris {
  static const _SkypeApp skypeApp = _SkypeApp();

  static const _HourJobsApp hourJobsApp = _HourJobsApp();
  static const _BoardingHouseApp boardingHouseApp = _BoardingHouseApp();
  static const _TutorHouseApp tutorHouseApp = _TutorHouseApp();

  static const _Hotline1 hotline1 = _Hotline1();
  static const _Hotline2 hotline2 = _Hotline2();
}
