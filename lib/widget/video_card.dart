import 'package:flutter/material.dart';
import 'package:flutter_blibli/model/video_item_model.dart';
import 'package:flutter_blibli/utils/format_util.dart';
import 'package:flutter_blibli/utils/view_util.dart';

class VideoCard extends StatelessWidget {
  final VideoItemModel model;

  const VideoCard({Key? key, required this.model}) : super(key: key);

  final double _height = 90;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              _buildImage(),
              const Padding(padding: EdgeInsets.only(right: 10)),
              _buildInfo()
            ],
          ),
        ),
        const Divider(
          height: 1,
        )
      ],
    );
  }

  _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Stack(
        children: [
          cacheImage(model.url, height: _height, width: _height * (16 / 9)),
          Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  countFormat(model.totalTime),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ))
        ],
      ),
    );
  }

  _buildInfo() {
    return Expanded(
        child: SizedBox(
      height: _height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.title),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOwner(),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      smallIconText(model.viewCount, Icons.ondemand_video),
                      smallIconText(model.likeCount, Icons.list_alt),
                    ],
                  ),
                  const Icon(
                    Icons.more_vert_sharp,
                    color: Colors.grey,
                    size: 15,
                  )
                ],
              )
            ],
          )
        ],
      ),
    ));
  }

  _buildOwner() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: Colors.grey)),
          child: const Text(
            'UP',
            style: TextStyle(
                color: Colors.grey, fontSize: 8, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(padding: EdgeInsets.only(right: 8)),
        Text(model.userName,
            style: const TextStyle(fontSize: 11, color: Colors.grey))
      ],
    );
  }
}
