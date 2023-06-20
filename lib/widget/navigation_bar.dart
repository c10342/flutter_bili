// 自定义样式的沉浸式导航栏

import 'package:flutter/material.dart';
import 'package:lifecycle_aware_state/lifecycle_aware_state.dart';

import '../utils/view_util.dart';

class MyNavigationBar extends StatefulWidget {
  final Color color;
  final double height;
  final Widget child;
  final StatusStyle statusStyle;

  const MyNavigationBar(
      {Key? key,
      this.color = Colors.white,
      this.height = 46,
      required this.child,
      this.statusStyle = StatusStyle.DARK_CONTENT})
      : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends LifecycleAwareState<MyNavigationBar> {
  @override
  void initState() {
    super.initState();
    setStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    // 获取状态栏高度，刘海屏
    double top = MediaQuery.of(context).padding.top;
    return Container(
      // 屏幕宽度
      width: MediaQuery.of(context).size.width,
      height: top + widget.height,
      padding: EdgeInsets.only(top: top),
      decoration: BoxDecoration(color: widget.color),
      child: widget.child,
    );
  }

  setStatusBar() {
    changeStatusBar(color: widget.color, statusStyle: widget.statusStyle);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    setStatusBar();
  }
}
