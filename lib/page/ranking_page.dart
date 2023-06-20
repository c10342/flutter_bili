import 'package:flutter/material.dart';
import 'package:flutter_blibli/utils/view_util.dart';
import 'package:flutter_blibli/widget/navigation_bar.dart';
import 'package:flutter_blibli/widget/tabs.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late TabController controller;

  List<String> tabList = ['最新', '最热'];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabList.length, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [_appBar()],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  _appBar() {
    return Material(
      elevation: 5,
      shadowColor: Colors.grey,
      color: Colors.white,
      child: MyNavigationBar(
        color: Colors.transparent,
        statusStyle: StatusStyle.DARK_CONTENT,
        child: Center(
          child: Tabs(
              controller: controller,
              tabs: tabList
                  .map((e) => Tab(
                        text: e,
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
