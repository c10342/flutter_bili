import 'package:flutter/material.dart';

//可动态改变位置的Header组件
// 性能优化：局部刷新的应用@刷新原理
class FlexibleHeader extends StatefulWidget {
  final String name;
  final String face;
  final ScrollController controller;
  const FlexibleHeader(
      {Key? key,
      required this.name,
      required this.face,
      required this.controller})
      : super(key: key);

  @override
  State<FlexibleHeader> createState() => _FlexibleHeaderState();
}

class _FlexibleHeaderState extends State<FlexibleHeader> {
//  距离底部的最大距离
  static const double MAX_BOTTOM = 40;
//  距离底部的最小距离
  static const double MIN_BOTTOM = 10;
  //滚动范围
  static const MAX_OFFSET = 80;
// 根据滚动距离计算具体距离底部的距离
  double _dyBottom = MAX_BOTTOM;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      // 滚动距离
      double offset = widget.controller.offset;
      // 算出padding变化系数0-1
      double dyOffset = (MAX_OFFSET - offset) / MAX_OFFSET;
      double offsetY = MAX_BOTTOM - MIN_BOTTOM;
      // 根据dyOffset算出具体的变化的padding值
      double dy = dyOffset * offsetY;
//      临界值保护
      if (dy > offsetY) {
        dy = offsetY;
      } else if (dy < 0) {
        dy = 0;
      }
      setState(() {
        //算出实际的padding
        _dyBottom = MIN_BOTTOM + dy;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(bottom: _dyBottom, left: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(23),
            child: Image.asset(
              widget.face,
              width: 46,
              height: 46,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Text(
            widget.name,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          )
        ],
      ),
    );
  }
}
