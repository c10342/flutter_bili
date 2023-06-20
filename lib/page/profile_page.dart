import 'package:flutter/material.dart';
import 'package:flutter_blibli/model/course_model.dart';
import 'package:flutter_blibli/provider/user_provider.dart';
import 'package:flutter_blibli/utils/view_util.dart';
import 'package:flutter_blibli/widget/blur.dart';
import 'package:flutter_blibli/widget/course_card.dart';
import 'package:provider/provider.dart';

import '../widget/flexible_header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  ScrollController controller = ScrollController();

  List<CourseModel> courseList = [
    CourseModel(title: '交流群', courseNo: 1111),
    CourseModel(title: '百度', url: 'https://www.baidu.com/'),
    CourseModel(title: 'CSDN', url: 'https://blog.csdn.net/'),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // 嵌套滚动，滚动吸顶
      body: NestedScrollView(
        controller: controller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              // 禁止出现appBar
              automaticallyImplyLeading: false,
//            扩展高度
              expandedHeight: 160,
//            标题栏是否固定
              pinned: true,
//            定义固定空间
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 0),
                title: _buildHead(),
                // 背景
                background: Stack(
                  children: [
                    // Positioned.fill方法将填充Stack的整个空间。
                    Positioned.fill(
                        child: cacheImage(
                            'https://www.devio.org/img/beauty_camera/beauty_camera4.jpg')),
                    const Positioned.fill(
                        child: Blur(
                      sigma: 20,
                    )),
                    Positioned(
                      child: _buildTab(),
                      bottom: 0,
                      left: 0,
                      right: 0,
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            CourseCard(
              list: courseList,
            )
          ],
        ),
      ),
    );
  }

  _buildHead() {
    // 获取provider的值
    return Consumer<UserProvider>(
      builder:
          (BuildContext context, UserProvider userProvider, Widget? child) {
        return FlexibleHeader(
          face: 'assets/images/avatar.png',
          name: userProvider.getUserModel()?.userName ?? '',
          controller: controller,
        );
      },
    );
    // return FlexibleHeader(
    //   face: 'assets/images/avatar.png',
    //   name: '张三',
    //   controller: controller,
    // );
  }

  @override
  bool get wantKeepAlive => true;

  _buildTab() {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 20),
      color: Colors.white54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildText(
            12,
            '收藏',
          ),
          _buildText(
            13,
            '点赞',
          ),
          _buildText(
            226,
            '浏览',
          ),
          _buildText(
            888,
            '金币',
          ),
          _buildText(
            66,
            '粉丝',
          ),
        ],
      ),
    );
  }

  _buildText(int i, String s) {
    return Column(
      children: [
        Text('$i', style: const TextStyle(fontSize: 15, color: Colors.black87)),
        Text(s, style: TextStyle(fontSize: 12, color: Colors.grey[600]))
      ],
    );
  }
}
