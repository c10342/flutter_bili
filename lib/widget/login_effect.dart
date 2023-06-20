import 'package:flutter/material.dart';

double imageSize = 90;

//登录动效
class LoginEffect extends StatefulWidget {
  final bool protect;
  const LoginEffect({Key? key, required this.protect}) : super(key: key);

  @override
  State<LoginEffect> createState() => _LoginEffectState();
}

class _LoginEffectState extends State<LoginEffect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _leftImage(),
          Image.asset(
            'assets/images/logo.png',
            height: imageSize,
            width: imageSize,
          ),
          _rightImage()
        ],
      ),
    );
  }

  _leftImage() {
    String url = widget.protect
        ? 'assets/images/head_left_protect.png'
        : 'assets/images/head_left.png';
    return Image.asset(url, height: imageSize);
  }

  _rightImage() {
    String url = widget.protect
        ? 'assets/images/head_right_protect.png'
        : 'assets/images/head_right.png';
    return Image.asset(url, height: imageSize);
  }
}
