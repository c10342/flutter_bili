import 'package:flutter/material.dart';
import 'package:flutter_blibli/utils/color.dart';

//登录按钮
class LoginButton extends StatelessWidget {
  final String title;
  final bool enable;
  final VoidCallback? onPressed;
  const LoginButton(
      {Key? key, required this.title, this.enable = true, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          height: 45,
          // onPressed为null就表示被禁用了，很奇怪
          onPressed: enable ? onPressed : null,
          disabledColor: primary[50],
          color: primary,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
