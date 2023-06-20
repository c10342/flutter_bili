import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blibli/dao/video_dao.dart';
import 'package:flutter_blibli/model/video_detail_model.dart';
import 'package:flutter_blibli/model/video_item_model.dart';
import 'package:flutter_blibli/model/video_model.dart';
import 'package:flutter_blibli/utils/color.dart';
import 'package:flutter_blibli/utils/format_util.dart';
import 'package:flutter_blibli/utils/view_util.dart';
import 'package:flutter_blibli/widget/app_bar.dart';
import 'package:flutter_blibli/widget/loading_container.dart';
import 'package:flutter_blibli/widget/tabs.dart';
import 'package:flutter_blibli/widget/video_card.dart';
import 'package:flutter_blibli/widget/video_view.dart';

class VideoDetailPage extends StatefulWidget {
  VideoModel videoModel;

  VideoDetailPage({Key? key, required this.videoModel}) : super(key: key);

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage>
    with TickerProviderStateMixin {
  List<String> tabs = ["简介", "评论288"];

  late TabController tabController;

  VideoDetailModel? videoDetailModel;

  bool isLoading = true;

  bool _expand = false;

  @override
  void initState() {
    super.initState();
    changeStatusBar(
        color: Colors.transparent, statusStyle: StatusStyle.LIGHT_CONTENT);
    tabController = TabController(length: tabs.length, vsync: this);
    loadData();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: LoadingContainer(
        isLoading: isLoading,
        child: Column(
          children: [_buildVideoView(), _buildTabs(), _buildTabView()],
        ),
      ),
    ));
  }

  _buildVideoView() {
    return VideoView(
      url: videoDetailModel?.playUrl ?? '',
      cover:
          'https://i1.hdslb.com/bfs/archive/da944021b5cebf843069dc49789d28ed5c49394f.jpg',
      overlayUI: videoAppBar(),
      autoPlay: true,
    );
  }

  _buildTabs() {
    // 使用Material实现阴影效果
    return Material(
      elevation: 5,
      shadowColor: Colors.grey.shade100,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: 40,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Tabs(
              controller: tabController,
              tabs: tabs
                  .map((e) => Tab(
                        text: e,
                      ))
                  .toList(),
            ),
            const Icon(
              Icons.live_tv_rounded,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  _buildTabView() {
    return Flexible(
        child: TabBarView(
      controller: tabController,
      children: [_buildInfo(), const Text('敬请期待')],
    ));
  }

  _buildInfo() {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [_buildTitle(), _buildExpandTitle(), _buildIconText()],
          ),
        ),
        const Divider(
          height: 1,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: const _VideoRecommendList(),
        )
      ],
    );
  }

  _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: cacheImage(videoDetailModel?.avatar ?? '',
                  width: 30, height: 30),
            ),
            const Padding(padding: EdgeInsets.only(left: 10)),
            Column(
              children: [
                Text(
                  videoDetailModel?.userName ?? '',
                  style: const TextStyle(
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${countFormat(videoDetailModel?.fansCount ?? 0)}粉丝',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
          ],
        ),
        MaterialButton(
          color: primary,
          onPressed: () {},
          height: 28,
          child: const Text(
            '+ 关注',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        )
      ],
    );
  }

  void loadData() {
    setState(() {
      isLoading = true;
    });
    VideoDao.getVideoDetail(context).then((value) {
      setState(() {
        videoDetailModel = value;
      });
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  _buildExpandTitle() {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 10)),
        InkWell(
          onTap: () {
            setState(() {
              _expand = !_expand;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                videoDetailModel?.title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
              Icon(
                _expand
                    ? Icons.keyboard_arrow_up_sharp
                    : Icons.keyboard_arrow_down_sharp,
                color: Colors.grey,
                size: 16,
              )
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        Row(
          children: [
            smallIconText(
              videoDetailModel?.viewCount ?? 0,
              Icons.ondemand_video,
            ),
            const Padding(padding: EdgeInsets.only(right: 10)),
            smallIconText(videoDetailModel?.viewCount ?? 0, Icons.list_alt),
            const Padding(padding: EdgeInsets.only(right: 10)),
            const Text(
              '11-15',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
        _buildRemark()
      ],
    );
  }

  _buildRemark() {
    if (_expand == false) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        videoDetailModel?.remark ?? '',
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }

  _buildIconText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _iconText(
              Icons.thumb_up_alt_rounded, videoDetailModel?.likeCount ?? 0),
          _iconText(Icons.thumb_down_alt_rounded, '不喜欢'),
          _iconText(Icons.monetization_on, videoDetailModel?.rewardCount ?? 0),
          _iconText(Icons.grade_rounded, videoDetailModel?.collectCount ?? 0),
          _iconText(Icons.share_rounded, videoDetailModel?.shareCount ?? 0)
        ],
      ),
    );
  }

  _iconText(IconData iconData, var text) {
    if (text is int) {
      //显示格式化
      text = countFormat(text);
    } else {
      text ??= '';
    }
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.grey,
          size: 20,
        ),
        const Padding(padding: EdgeInsets.only(top: 5)),
        Text(text, style: const TextStyle(color: Colors.grey, fontSize: 12))
      ],
    );
  }
}

class _VideoRecommendList extends StatefulWidget {
  const _VideoRecommendList({Key? key}) : super(key: key);

  @override
  State<_VideoRecommendList> createState() => _VideoRecommendListState();
}

class _VideoRecommendListState extends State<_VideoRecommendList>
    with AutomaticKeepAliveClientMixin {
  List<VideoItemModel> list = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadData();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return LoadingContainer(
        isLoading: isLoading,
        child: Column(
          children: list
              .map((e) => VideoCard(
                    model: e,
                  ))
              .toList(),
        ));
  }

  void loadData() {
    setState(() {
      isLoading = true;
    });
    VideoDao.getRecommendList(context).then((value) {
      setState(() {
        list = value;
      });
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  bool get wantKeepAlive => true;
}
