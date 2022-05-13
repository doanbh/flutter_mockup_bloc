import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/common/theme/theme_data.dart';
import 'package:flutter_mockup_bloc/core/net/dio_utils.dart';
import 'package:flutter_mockup_bloc/core/net/intercept.dart';
import 'package:flutter_mockup_bloc/core/view_model/global/global_viewmodel.dart';
import 'package:flutter_mockup_bloc/presentation/router/app_router.dart';
import 'package:flutter_mockup_bloc/presentation/router/route_logging_observer.dart';
import 'package:flutter_mockup_bloc/presentation/screens/splash_screen.dart';
import 'package:flutter_mockup_bloc/presentation/screens/test_screen.dart';
import 'package:flutter_mockup_bloc/provider/provider_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mockup_bloc/repository/common_data_repo.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:flutter_mockup_bloc/utils/env/flavor_config.dart';
import 'package:flutter_mockup_bloc/utils/locale/localization_delegate.dart';
import 'package:flutter_mockup_bloc/utils/locale/localization_fallback_cupertino_delegate.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key){
    initDio();
  }

  void initDio() {
    final List<Interceptor> interceptors = <Interceptor>[];

    /// 统一添加身份验证请求头
    interceptors.add(AuthInterceptor());

    /// 刷新Token
    interceptors.add(TokenInterceptor());

    /// 打印Log(生产模式去除)
    if (!AppConstants.inProduction) {
      interceptors.add(LoggingInterceptor());
    }

    /// 适配数据(根据自己的数据结构，可自行选择添加)
    interceptors.add(AdapterInterceptor());
    configDio(
      // baseUrl: 'https://stoplight.io/mocks/phongdoan/test/11233479/',
      interceptors: interceptors,
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return OKToast(
        backgroundColor: Colors.black54,
        textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom,
        child:
        InternalApp()
        // DevicePreview(
        //   enabled: !kReleaseMode,
        //   builder: (context) => InternalApp()
        // )
    );
  }
}

class InternalApp extends StatelessWidget {
  final Widget? home;

  const InternalApp({Key? key})
      : home = null,
        super(key: key);

  @visibleForTesting
  const InternalApp.test({required this.home, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalViewModel>(
      lazy: FlavorConfig.isInTest(),
      consumer: (context, viewModel, consumerChild) => RepositoryProvider(
        create: (_) => CommonDataRepo(),
        child: MaterialApp(
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: !FlavorConfig.isInTest(),
          localizationsDelegates: [
            viewModel.localeDelegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            FallbackCupertinoLocalisationsDelegate.delegate,
          ],
          locale: viewModel.locale,
          supportedLocales: LocalizationDelegate.supportedLocales,
          themeMode: viewModel.themeMode,
          theme: FlutterTemplateThemeData.lightTheme(viewModel.targetPlatform),
          darkTheme: FlutterTemplateThemeData.darkTheme(viewModel.targetPlatform),
          // navigatorKey: MainNavigatorWidgetState.navigationKey,
          // initialRoute: home == null ? MainNavigatorWidgetState.initialRoute : null,
          // onGenerateRoute: MainNavigatorWidgetState.onGenerateRoute,
          // builder: home == null ? (context, child) => SplashScreen() : null,
          home: SplashScreen(),
          // navigatorObservers: [
          //   if (kDebugMode) RouteLoggingObserver(),
          //   AppRouter.createRouteObserver(),
          // ],
        ),
      ),
      create: () => GetIt.I()..init(),
    );
  }
}
