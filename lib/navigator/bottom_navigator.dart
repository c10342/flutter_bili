import 'package:flutter/material.dart';
import 'package:flutter_blibli/page/favorite_page.dart';
import 'package:flutter_blibli/page/home_page.dart';
import 'package:flutter_blibli/page/profile_page.dart';
import 'package:flutter_blibli/page/ranking_page.dart';
import 'package:flutter_blibli/utils/color.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
//  默认颜色
  final defaultColor = Colors.grey;
//  激活的颜色
  final activeColor = primary;
//  当前在那个tab
  int currentIndex = 0;
//  默认展示第一页
  PageController controller = PageController(initialPage: 0);

  @override
  void dispose() {
    // 记得销毁
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
//        禁止滑动
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: const [
          HomePage(),
          RankingPage(),
          FavoritePage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: activeColor,
        unselectedItemColor: defaultColor,
        // 固定文字，默认情况下，只有被激活了才显示文字
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          bottomItem('首页', Icons.home),
          bottomItem(
            '排行',
            Icons.local_fire_department,
          ),
          bottomItem(
            '收藏',
            Icons.favorite,
          ),
          bottomItem(
            '我的',
            Icons.live_tv,
          ),
        ],
      ),
    );
  }

  bottomItem(String label, IconData icon) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
