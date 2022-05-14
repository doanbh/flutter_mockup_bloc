import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/model/AuthorResponse.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/author/author_item.dart';
import 'package:flutter_mockup_bloc/presenters/home_presenter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListOnlineHandleDataFromNetwork {
  late void Function() notifyLoadDone;
}

class ListOnlineScreen extends StatelessWidget {
  final Function()? loadMoreCallback;
  final ListOnlineHandleDataFromNetwork handle;
  final RefreshController refreshController;
  // final HomePresenter presenter;

  ListOnlineScreen({Key? key, required this.handle, required this.refreshController, this.loadMoreCallback}) : super(key: key){
    // print("controller");
    // print(this.controller);
    this.handle.notifyLoadDone = _onLoadFromServerDone;
    refreshController.footerMode!.addListener(_handleRefreshController);
  }

  void _handleRefreshController(){
   // print("_refreshController: ${refreshController.footerMode!.value}");
  }

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    loadMoreCallback!();
  }

  void _onLoadFromServerDone(){
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode){
          Widget body ;
          if(mode==LoadStatus.idle){
            body =  Text("pull up load");
          }
          else if(mode==LoadStatus.loading){
            body =  CupertinoActivityIndicator();
          }
          else if(mode == LoadStatus.failed){
            body = Text("Load Failed!Click retry!");
          }
          else if(mode == LoadStatus.canLoading){
            body = Text("release to load more");
          }
          else{
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child:body),
          );
        },
      ),
      controller: refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        // shrinkWrap: true,
        itemBuilder: (c, i) {
          ItemsAuthorResponse authorItem = context.read<HomeCubit>().listAuthorsItem[i];
          return AuthorItem(
            model: authorItem,
            margin: const EdgeInsets.only(bottom: 10),
          );
        },
        itemCount: context.read<HomeCubit>().listAuthorsItem.length,
      ),
    );
  }
}
