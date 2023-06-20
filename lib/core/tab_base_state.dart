import 'package:flutter/material.dart';
import 'package:flutter_blibli/utils/color.dart';

abstract class TabBaseState<T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin {
  ScrollController scrollController = ScrollController();

  abstract bool isLoading;

  get contentChild;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      double dis = scrollController.position.maxScrollExtent -
          scrollController.position.pixels;
      // fix当列表高度不满屏幕高度时不执行加载更多
      if (dis == 0 &&
          scrollController.position.maxScrollExtent != 0 &&
          !isLoading) {
        onScrollToBottom();
      }
    });
  }

  onScrollToBottom();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      color: primary,
      onRefresh: onRefresh,
      child: contentChild,
    );
  }

  Future<void> onRefresh();
}
