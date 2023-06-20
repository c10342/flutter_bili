//缓存图片
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blibli/utils/format_util.dart';

Widget cacheImage(String url, {double? width, double? height}) {
  return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (
        BuildContext context,
        String url,
      ) =>
          Container(color: Colors.grey[200]),
      errorWidget: (
        BuildContext context,
        String url,
        dynamic error,
      ) =>
          const Icon(Icons.error));
}

///黑色线性渐变
blackLinearGradient({bool fromTop = false}) {
  return LinearGradient(
      begin: fromTop ? Alignment.topCenter : Alignment.bottomCenter,
      end: fromTop ? Alignment.bottomCenter : Alignment.topCenter,
      colors: const [
        Colors.black54,
        Colors.black45,
        Colors.black38,
        Colors.black26,
        Colors.black12,
        Colors.transparent
      ]);
}

enum StatusStyle { LIGHT_CONTENT, DARK_CONTENT }

changeStatusBar(
    {Color color = Colors.white,
    StatusStyle statusStyle = StatusStyle.DARK_CONTENT}) {
  // 沉浸式状态栏样式
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: color, //全局设置颜色
        statusBarIconBrightness: statusStyle == StatusStyle.DARK_CONTENT
            ? Brightness.dark
            : Brightness.light
        //light:黑色图标 dark：白色图标
        //在此处设置statusBarIconBrightness为全局设置
        );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

smallIconText(var text, IconData? iconData) {
  if (text is int) {
    text = countFormat(text);
  }
  return Row(
    children: [
      Icon(
        iconData,
        size: 12,
        color: Colors.grey,
      ),
      Text(
        ' $text',
        style: TextStyle(fontSize: 12, color: Colors.grey),
      )
    ],
  );
}
