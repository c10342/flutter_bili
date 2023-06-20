import 'package:flutter/material.dart';
import 'package:flutter_blibli/dao/home_dao.dart';
import 'package:flutter_blibli/model/home_nav_model.dart';
import 'package:flutter_blibli/navigator/router.dart';
import 'package:flutter_blibli/page/home_tab_page.dart';
import 'package:flutter_blibli/core/hi_state.dart';
import 'package:flutter_blibli/widget/loading_container.dart';
import 'package:flutter_blibli/widget/navigation_bar.dart';
import 'package:flutter_blibli/widget/tabs.dart';

import '../utils/view_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HiState<HomePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List<HomeNavModel> navList = [];

  late TabController controller;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: navList.length, vsync: this);
    initNav();
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
      body: LoadingContainer(
        isLoading: isLoading,
        child: Column(
          children: [_appBar(), Flexible(child: _tabBarView())],
        ),
      ),
    );
  }

  Widget _tabBar() {
    return Tabs(
        controller: controller,
        tabs: navList
            .map((e) => Tab(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      e.name,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ))
            .toList());
  }

  Widget _tabBarView() {
    return TabBarView(
        controller: controller,
        children: navList
            .map((e) => HomeTabPage(
                  navModel: e,
                ))
            .toList());
  }

  void initNav() {
    setState(() {
      isLoading = true;
    });
    HomeDao.getNav(context).then((value) {
      // Future.delayed(const Duration(seconds: 3), () {
      //   setState(() {
      //     navList = value;
      //     // 数组长度发生变化需要重新初始化，不然会出现白屏
      //     controller = TabController(length: navList.length, vsync: this);
      //     isLoading = false;
      //   });
      // });
      setState(() {
        navList = value;
        // 数组长度发生变化需要重新初始化，不然会出现白屏
        controller = TabController(length: navList.length, vsync: this);
        isLoading = false;
      });
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  _appBar() {
    return Material(
      elevation: 5,
      shadowColor: Colors.grey,
      color: Colors.white,
      child: MyNavigationBar(
          height: 100,
          color: Colors.transparent,
          statusStyle: StatusStyle.DARK_CONTENT,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouterName.TestPage);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/avatar.png',
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          height: 32,
                          alignment: Alignment.centerLeft,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade100),
                          child: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )),
                    const Icon(
                      Icons.explore_outlined,
                      color: Colors.grey,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Icon(
                        Icons.mail_outline,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              _tabBar()
            ],
          )),
    );
  }
}
