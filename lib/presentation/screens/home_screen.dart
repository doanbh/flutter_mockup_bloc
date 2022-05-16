import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/common/theme/app_border_and_radius.dart';
import 'package:flutter_mockup_bloc/common/theme/app_padding.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_page.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/presentation/screens/list_online_screen.dart';
import 'package:flutter_mockup_bloc/presentation/screens/say_hi_screen.dart';
import 'package:flutter_mockup_bloc/presentation/screens/list_offline_screen.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/custom_tab_bar.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/scafold/custom_scaffold.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/widget_utils.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/dialog/select_language_dialog.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/dialog/select_theme_dialog.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/drawer/custom_drawer.dart';
import 'package:flutter_mockup_bloc/presenters/home_presenter.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';
import 'package:flutter_mockup_bloc/resource/app_text_styles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BasePageMixin<HomeScreen, HomePresenter> implements HomeView{
  final ListOnlineHandleDataFromNetwork controller = new ListOnlineHandleDataFromNetwork();
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              // toolbarHeight: height,
              leading: null,
              centerTitle: true,
              title: Text(
                "Mockup Bloc",
                style: AppTextStyles.appbarTitle,
                overflow: TextOverflow.ellipsis,
              ),
              // bottom: bottomAppBar,
              shape: AppBorderAndRadius.defaultAppBarBorder,
              elevation: 4,
              shadowColor: AppColors.appBarShadow,
            ),
          drawer: CustomDrawer(
            onTapChangeLanguage: (action){
              switch (action){
                case Action_Drawer.theme:
                  Navigator.pop(context);
                  showCupertinoDialog(
                      context: context,
                      builder: (context){
                        return SelectThemeDialog(
                          goBack: (){
                            Navigator.pop(context);
                          },
                        );
                      }
                  );
                  break;
                default:
                Navigator.pop(context);
                showCupertinoDialog(
                    context: context,
                    builder: (context){
                      return SelectLanguageDialog(
                        goBack: (){
                          Navigator.pop(context);
                        },
                      );
                    }
                );
              }
            },
          ),
          body: BlocProvider(
              create: (_) => presenter!.cubit,
            child: BlocBuilder<HomeCubit, BaseState>(
                builder: (context, state){
                  if (state is LoadSuccessState){
                    controller.notifyLoadDone();
                  }
                  return DefaultTabController(
                    length: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Center(
                        //   child: WidgetUtils.getCustomTabBar([
                        //     'DS online',
                        //     'DS Tỉnh/TP từ local',
                        //   ]),
                        // ),
                        // SizedBoxExt.h20,
                        // //
                        // Flexible(
                        //   child: FlexibleTabBarView(
                        //     children: [
                        //       ListOnlineScreen(),
                        //       ListOnlineScreen(),
                        //     ].map((e) => Padding(
                        //       padding: AppPad.horiz20,
                        //       child: e,
                        //     )).toList(),
                        //   ),
                        // ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 4,
                                color: AppColors.shadow10,
                              ),
                            ],
                          ),
                          child: Material(
                            type: MaterialType.transparency,
                            child: TabBar(
                              indicatorWeight: 2,
                              indicatorColor: AppColors.primary,
                              unselectedLabelColor: Color(0xFF7B7B7B),
                              labelColor: AppColors.text,
                              tabs: [
                                Tab(text: 'DS online'),
                                Tab(text: 'DS Tỉnh/TP từ local'),
                              ],
                            ),
                          ),
                        ),
                        SizedBoxExt.h20,
                        Expanded(
                          child: TabBarView(
                            children: [
                              ListOnlineScreen(handle: this.controller, refreshController: this._refreshController, loadMoreCallback: (){
                                presenter!.getListAuthor();
                              },),
                              ListOfflineScreen(presenter!.cubit.listCity),
                            ].map((e) => Padding(
                                padding: AppPad.horiz20,
                                child: e,
                            )).toList(),
                          ),
                        )
                      ],
                    ),
                  );
                },
            ),
          )
        )
    );
  }

  @override
  HomePresenter createPresenter() => HomePresenter();

  @override
  void initViewDone() {
    // TODO: implement initViewDone
    presenter!.getListCity(context);
  }
}
