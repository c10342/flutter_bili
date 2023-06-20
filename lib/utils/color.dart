//定义主题色
import 'package:flutter/material.dart';

//材料设计颜色
// Colors.blue['50']
//主色调
const MaterialColor primary =
    MaterialColor(0xfffb7299, <int, Color>{50: Color(0xffff9bd5)});

const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    350: Color(
        0xFFFFFFFF), // only for raised button while pressed in light theme
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    850: Color(0xFFFFFFFF), // only for background color in dark theme
    900: Color(0xFFFFFFFF),
  },
);

class HiColor {
  static const Color red = Color(0xFFFF4759);
  static const Color dark_red = Color(0xFFE03E4E);
  static const Color dark_bg = Color(0xFF18191A);
}
