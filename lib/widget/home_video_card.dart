import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blibli/model/video_item_model.dart';
import 'package:flutter_blibli/model/video_model.dart';
import 'package:flutter_blibli/navigator/router.dart';
import 'package:flutter_blibli/utils/format_util.dart';
import 'package:flutter_blibli/utils/view_util.dart';

class HomeVideoCard extends StatelessWidget {
  final VideoItemModel model;
  const HomeVideoCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouterName.VideoDetail,
            arguments: {"videoModel": VideoModel(1)});
      },
      child: SizedBox(
        height: 200,
        child: Card(
          //取消卡片默认边距
          margin: const EdgeInsets.all(0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_itemImage(), _infoText()],
            ),
          ),
        ),
      ),
    );
  }

  _itemImage() {
    return Stack(
      children: [
        // 图片淡入效果
        FractionallySizedBox(
          widthFactor: 1,
          child: cacheImage(model.url, height: 120),
        ),

        // Image.network(
        //   model.url,
        //   height: 120,
        //   fit: BoxFit.fill,
        // ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 3, top: 5),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black54, Colors.transparent])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconText(Icons.ondemand_video, model.viewCount),
                  _iconText(Icons.favorite_border, model.likeCount),
                  _iconText(null, model.totalTime),
                ],
              ),
            ))
      ],
    );
  }

  _iconText(IconData? iconData, int count) {
    String views = '';
    if (iconData != null) {
      views = countFormat(count);
    } else {
      views = durationTransform(count);
    }
    return Row(
      children: [
        if (iconData != null)
          Icon(
            iconData,
            color: Colors.white,
            size: 12,
          ),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text(
            views,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        )
      ],
    );
  }

  _infoText() {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
          _owner()
        ],
      ),
    ));
  }

  _owner() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                model.avatar,
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                model.userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 11, color: Colors.black87),
              ),
            ),
          ],
        ),
        const Icon(
          Icons.more_vert_sharp,
          size: 15,
          color: Colors.grey,
        )
      ],
    );
  }
}
