import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blibli/utils/toast.dart';
import 'package:flutter_blibli/widget/blur.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/course_model.dart';

class CourseCard extends StatelessWidget {
  List<CourseModel> list;

  CourseCard({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 5, top: 15),
      child: Column(
        children: [_buildTitle(), _buildCard()],
      ),
    );
  }

  _buildTitle() {
    return Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            const Text('增值服务',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.only(left: 10)),
            Text(
              '带你突破技术瓶颈',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            )
          ],
        ));
  }

  _buildCard() {
    return Row(
      children: list.map((e) => _buildCardItem(e)).toList(),
    );
  }

  Widget _buildCardItem(CourseModel model) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(right: 5, bottom: 7),
      child: InkWell(
        onTap: () async {
          if (model.courseNo != null) {
            FlutterClipboard.copy('${model.courseNo}').then((value) {
              showToast('${model.courseNo} 已帮你拷贝到剪切板');
            });
          } else if (model.url != null) {
            Uri url = Uri.parse(model.url!);
            // if (await canLaunchUrl(url)) {
            //   launchUrl(url);
            // } else {
            //   showWarnToast('Could not launch $url');
            // }
            try {
              await launchUrl(url);
            } catch (e) {
              showWarnToast('Could not launch $url');
            }
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.deepOrangeAccent),
              child: Stack(
                children: [
                  const Positioned.fill(child: Blur()),
                  Positioned.fill(
                      child: Center(
                    child: Text(
                      model.title,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
