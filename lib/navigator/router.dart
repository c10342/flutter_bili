import 'package:flutter/material.dart';
import 'package:flutter_blibli/navigator/bottom_navigator.dart';
import 'package:flutter_blibli/page/login_page.dart';
import 'package:flutter_blibli/page/not_found_page.dart';
import 'package:flutter_blibli/page/register_page.dart';
import 'package:flutter_blibli/page/video_detail_page.dart';

import '../page/test_page.dart';

// enum RouterName {
//   Home('/'),
//   Login('/login'),
//   Register('/register'),
//   VideoDetail('/video-detail'),
//   NotFound('/not-found');
//
//   final String value;
//   const RouterName(this.value);
// }

class RouterName {
  static String Home = '/';
  static String Login = '/login';
  static String Register = '/register';
  static String VideoDetail = '/video-detail';
  static String NotFound = '/not-found';
  static String TestPage = '/test';

  RouterName._();
}

//创建路由页面
routePageWrap(Widget child) {
  return MaterialPageRoute(builder: (BuildContext context) {
    return child;
  });
}

final routers = {
  RouterName.Home: () => routePageWrap(const BottomNavigator()),
  RouterName.Login: () => routePageWrap(const LoginPage()),
  RouterName.Register: () => routePageWrap(const RegisterPage()),
  RouterName.VideoDetail: (Map<String, dynamic> args) {
    return routePageWrap(VideoDetailPage(
      videoModel: args['videoModel'],
    ));
  },
  RouterName.NotFound: () => routePageWrap(const NotFoundPage()),
  RouterName.TestPage: () => routePageWrap(const TestPage())
};
