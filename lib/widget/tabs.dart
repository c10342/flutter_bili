import 'package:flutter/material.dart';
import 'package:flutter_blibli/utils/color.dart';

class Tabs extends StatelessWidget {
  final TabController controller;

  final List<Widget> tabs;

  const Tabs({Key? key, required this.controller, required this.tabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      // 是否滚动
      isScrollable: true,
      // 控制器，必须有
      controller: controller,
      // 标签
      labelColor: primary,
      unselectedLabelColor: Colors.black,
      // 指示器
      indicatorColor: primary,
      // 指示器长度跟随文本长度
      indicatorSize: TabBarIndicatorSize.label,
      // 指示器的权重，即线条高度
      indicatorWeight: 4.0,
      tabs: tabs,
    );
  }
}
