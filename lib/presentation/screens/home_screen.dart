import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/common/theme/app_padding.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_page.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/presentation/screens/list_online_screen.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/custom_tab_bar.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/scafold/custom_scaffold.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/widget_utils.dart';
import 'package:flutter_mockup_bloc/presenters/home_presenter.dart';
import 'package:flutter_mockup_bloc/resource/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BasePageMixin<HomeScreen, HomePresenter> implements HomeView{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScaffold(
          title: "365",
          body: BlocProvider(
              create: (_) => presenter!.cubit,
            child: BlocBuilder<HomeCubit, BaseState>(
                builder: (context, state){
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
                              ListOnlineScreen(loadMoreCallback: (){

                              },),
                              ListOnlineScreen(),
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
  }
}
