import 'package:flutter/material.dart';
import 'package:flutter_blibli/model/video_detail_model.dart';
import 'package:flutter_blibli/model/video_item_model.dart';
import 'package:flutter_blibli/utils/load_json.dart';

class VideoDao {
  static Future<VideoDetailModel> getVideoDetail(BuildContext context) async {
    Map<String, dynamic> data =
        await loadJson(context, 'assets/json/video_detail.json');

    return VideoDetailModel.fromJson(data);
  }

  static Future<List<VideoItemModel>> getRecommendList(
      BuildContext context) async {
    List data = await loadJson(context, 'assets/json/recommend_list.json');
    List<VideoItemModel> list =
        data.map((e) => VideoItemModel.fromJson(e)).toList();
    return list;
  }

  static Future<List<VideoItemModel>> getRankingList(
      BuildContext context) async {
    List data = await loadJson(context, 'assets/json/recommend_list.json');
    List<VideoItemModel> list =
        data.map((e) => VideoItemModel.fromJson(e)).toList();
    return list;
  }
}
