import 'package:flutter/cupertino.dart';
import 'package:flutter_blibli/model/banner_model.dart';
import 'package:flutter_blibli/model/home_nav_model.dart';
import 'package:flutter_blibli/model/video_item_model.dart';
import 'package:flutter_blibli/utils/load_json.dart';

class HomeDao {
  static Future<List<HomeNavModel>> getNav(BuildContext context) async {
    List data = await loadJson(context, 'assets/json/home_nav.json');
    List<HomeNavModel> list =
        data.map((e) => HomeNavModel.fromJson(e)).toList();
    return list;
  }

  static Future<List<BannerModel>> getBanner(BuildContext context) async {
    List data = await loadJson(context, 'assets/json/banner.json');
    List<BannerModel> list = data.map((e) => BannerModel.fromJson(e)).toList();
    return list;
  }

  static Future<List<VideoItemModel>> getList(
      BuildContext context, int index) async {
    List data = await loadJson(context, 'assets/json/home_list-$index.json');
    List<VideoItemModel> list =
        data.map((e) => VideoItemModel.fromJson(e)).toList();
    return list;
  }
}
