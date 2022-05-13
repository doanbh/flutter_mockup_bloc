import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_page.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/presentation/router/app_pages.dart';
import 'package:flutter_mockup_bloc/presentation/router/app_router.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/common_widget.dart';
import 'package:flutter_mockup_bloc/presenters/splash_presenter.dart';
import 'package:flutter_mockup_bloc/repository/common_data_repo.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with BasePageMixin<SplashScreen, SplashPresenter> implements SplashView  {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: theme.colorsTheme.primary,
        body: BlocProvider(
          create: (_) => presenter!.cubit,
          child: BlocBuilder<SplashCubit, BaseState>(
            builder: (context, state) {
              if (state is LoadSuccessState){
                int a = state.model as int;
                showToast("model: $a");
              }
              print("state: ${state}");
              return const Center(
                child: CommonWidget.centerLoadingCircle,
              );
            },
          ),
        )
    );
  }

  @override
  SplashPresenter createPresenter() => new SplashPresenter();

  @override
  void gotoHome() {
    // TODO: implement gotoHome
    AppRouter.toPage(context, AppPages.Navigation);
  }

  @override
  void gotoLogin() {
    // TODO: implement gotoLogin
    AppRouter.toPage(
      context,
      AppPages.Auth_Login,
      arguments: {'canNavigateBack': true},
    );
  }

  @override
  void initViewDone() {
    // TODO: implement initViewDone
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      context.read<CommonDataRepo>().loadCommonData();
    });
  }

}
