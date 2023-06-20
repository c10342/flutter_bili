import 'package:flutter/material.dart';
import 'package:flutter_blibli/dao/home_dao.dart';
import 'package:flutter_blibli/model/banner_model.dart';
import 'package:flutter_blibli/model/home_nav_model.dart';
import 'package:flutter_blibli/model/video_item_model.dart';
import 'package:flutter_blibli/utils/color.dart';
import 'package:flutter_blibli/widget/home_video_card.dart';
import 'package:flutter_blibli/widget/swiper_banner.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_blibli/core/tab_base_state.dart';

class HomeTabPage extends StatefulWidget {
  final HomeNavModel navModel;
  const HomeTabPage({Key? key, required this.navModel}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends TabBaseState<HomeTabPage> {
  List<BannerModel> bannerList = [];

  int currentIndex = 1;

  List<VideoItemModel> videoList = [];

  @override
  void initState() {
    super.initState();
    getBanner();
    loadData();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   super.build(context);
  //
  //   return RefreshIndicator(
  //     color: primary,
  //     onRefresh: onRefresh,
  //     child: SingleChildScrollView(
  //       controller: scrollController,
  //       child: Container(
  //         padding: const EdgeInsets.all(10),
  //         child: Column(
  //           children: [
  //             if (widget.navModel.value == 1)
  //               Container(
  //                 margin: const EdgeInsets.only(bottom: 10),
  //                 child: SwiperBanner(list: bannerList),
  //               ),
  //             getVideoView()
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void getBanner() {
    HomeDao.getBanner(context).then((value) {
      setState(() {
        bannerList = value;
      });
    });
  }

  Future loadData({bool loadMore = false}) {
    setState(() {
      isLoading = true;
    });
    return HomeDao.getList(context, currentIndex).then((value) {
      setState(() {
        if (loadMore == true) {
          videoList = [...videoList, ...value];
        } else {
          videoList = value;
        }
      });
      return value;
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  bool get wantKeepAlive => true;

  getVideoView() {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: MasonryGridView.count(
          // 展示几列
          crossAxisCount: 2,
          // 元素总个数
          itemCount: videoList.length,
          // 单个子元素
          itemBuilder: (BuildContext context, int index) => HomeVideoCard(
            model: videoList[index],
          ),
          // 纵向元素间距
          mainAxisSpacing: 10,
          // 横向元素间距
          crossAxisSpacing: 10,
          //本身不滚动，让外面的singlescrollview来滚动
          physics: const NeverScrollableScrollPhysics(),
          // 必须要有下面这个，不然会报错
          shrinkWrap: true, //收缩，让元素宽度自适应
        ));
  }

  @override
  get contentChild {
    return SingleChildScrollView(
      controller: scrollController,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            if (widget.navModel.value == 1)
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: SwiperBanner(list: bannerList),
              ),
            getVideoView()
          ],
        ),
      ),
    );
  }

  @override
  Future<void> onRefresh() {
    currentIndex = 1;
    return loadData(loadMore: false);
  }

  @override
  onScrollToBottom() {
    if (currentIndex >= 3) {
      return;
    }
    currentIndex++;
    loadData(loadMore: true);
  }

  @override
  bool isLoading = false;
}
