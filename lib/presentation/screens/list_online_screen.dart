import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/model/AuthorResponse.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/author/author_item.dart';
import 'package:flutter_mockup_bloc/presenters/home_presenter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListOnlineScreen extends StatefulWidget {
  ListOnlineScreen({Key? key, this.loadMoreCallback}) : super(key: key);
  final Function()? loadMoreCallback;

  @override
  State<ListOnlineScreen> createState() => _ListOnlineScreenState();
}

class _ListOnlineScreenState extends State<ListOnlineScreen> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<ItemsAuthorResponse> _listAuthorsResponseItem = [];

  _ListOnlineScreenState(){
    _listAuthorsResponseItem = context.read<HomeCubit>().listAuthorsItem;
  }

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    widget.loadMoreCallback!();
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    // if(mounted)
    //   setState(() {
    //
    //   });
    // _refreshController.loadComplete();
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
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        itemBuilder: (c, i) {
          ItemsAuthorResponse authorItem = _listAuthorsResponseItem[i];
          return AuthorItem(
            model: authorItem,
          );
        },
        itemExtent: 100.0,
        itemCount: context.read<HomeCubit>().listAuthorsItem.length,
      ),
    );
  }
}
