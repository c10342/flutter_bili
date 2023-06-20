import 'package:flutter/material.dart';
import 'package:flutter_blibli/utils/color.dart';

class LoginInput extends StatefulWidget {
//  标题
  final String label;

//  输入框占位符
  final String hint;

//  文本发生变化回调
  final ValueChanged<String>? onChange;

//  焦点变化回调
  final ValueChanged<bool>? focusChange;

//键盘类型
  final TextInputType? keyboardType;

//  是否为密码输入
  final bool password;

  final double labelWidth;

  const LoginInput(
      {Key? key,
      required this.label,
      this.hint = '请输入',
      this.onChange,
      this.focusChange,
      this.keyboardType,
      this.password = false,
      this.labelWidth = 100})
      : super(key: key);

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
//  获取光标对象
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // 监听是否获取到了光标
    _focusNode.addListener(() {
      if (widget.focusChange != null) {
        widget.focusChange!(_focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    // 销毁
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 10),
      // decoration: const BoxDecoration(
      //     border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: widget.labelWidth,
                child: Text(
                  widget.label,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              _input()
            ],
          ),
          const Divider(
            height: 1,
            thickness: 0.5,
          )
        ],
      ),
    );
  }

  _input() {
    return Expanded(
        flex: 1,
        child: TextField(
          focusNode: _focusNode,
          onChanged: widget.onChange,
          // 是否为密码输入
          obscureText: widget.password,
//          键盘类型
          keyboardType: widget.keyboardType,
//          是否自动获取焦点
          autofocus: false,
          // 光标颜色
          cursorColor: primary,
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
          // 输入框的样式
          decoration: InputDecoration(
              // 内容边距
              contentPadding: const EdgeInsets.only(left: 20, right: 20),
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: const TextStyle(fontSize: 15, color: Colors.grey)),
        ));
  }
}
