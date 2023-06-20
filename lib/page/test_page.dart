import 'package:flutter/material.dart';
import 'package:flutter_blibli/model/video_model.dart';
import 'package:flutter_blibli/navigator/router.dart';
import 'package:flutter_blibli/utils/view_util.dart';
import 'package:flutter_blibli/widget/navigation_bar.dart';
import 'package:lifecycle_aware_state/lifecycle_aware_state.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends LifecycleAwareState<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MyNavigationBar(
            color: Colors.red,
            statusStyle: StatusStyle.DARK_CONTENT,
            child: Text('test'),
          ),
          GestureDetector(
            child: const Text('toDetail'),
            onTap: () {
              Navigator.pushNamed(context, RouterName.VideoDetail,
                  arguments: {"videoModel": VideoModel(1)});
            },
          )
        ],
      ),
    );
  }

  @override
  void onPause() {
    // TODO: implement onPause
    super.onPause();
    print('TestPage-----onPause');
  }

  @override
  void onResume() {
    // TODO: implement onResume
    super.onResume();
    print('TestPage-----onResume');
  }

  @override
  void didPopNext() {
    // TODO: implement didPopNext
    super.didPopNext();
    print('TestPage-----didPopNext');
  }
}
