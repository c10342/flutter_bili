import 'package:flutter/material.dart';
import 'package:flutter_blibli/model/banner_model.dart';
import 'package:flutter_blibli/model/video_model.dart';
import 'package:flutter_blibli/navigator/router.dart';
import 'package:flutter_blibli/utils/view_util.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class SwiperBanner extends StatelessWidget {
  final List<BannerModel> list;
  final double height;
  final EdgeInsetsGeometry? padding;
  const SwiperBanner(
      {Key? key, required this.list, this.height = 160, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 裁剪
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: SizedBox(
        height: height,
        child: _banner(context),
      ),
    );
  }

  _banner(BuildContext context) {
    double right = 10 + (padding?.horizontal ?? 0) / 2;
    return Swiper(
      itemBuilder: (context, index) {
        return _image(list[index], context);
      },
      itemCount: list.length,
      pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(right: right, bottom: 10),
          builder: const DotSwiperPaginationBuilder(
              color: Colors.white60, size: 6, activeSize: 6)),
      autoplay: true,
    );
  }

  _image(BannerModel model, BuildContext context) {
    // GestureDetector 使用点击无水波纹出现，InkWell可以实现水波纹效果
    return InkWell(
        onTap: () {
          // 类型为1的打开详情页
          if (model.type == 1) {
            Navigator.pushNamed(context, RouterName.VideoDetail,
                arguments: {'videoModel': VideoModel(1)});
          } else {
            // 其他的用浏览器打开
            print('type:${model.type} ,url:${model.url}');
          }
        },
        child: cacheImage(model.url)
        // Image.network(
        //   model.url,
        //   fit: BoxFit.fill,
        // ),
        );
  }
}
