import 'package:flutter/material.dart';
import 'package:flutter_blibli/navigator/router.dart';
import 'package:flutter_blibli/utils/toast.dart';
import 'package:flutter_blibli/widget/app_bar.dart';
import 'package:flutter_blibli/widget/login_button.dart';
import 'package:flutter_blibli/widget/login_effect.dart';
import 'package:flutter_blibli/widget/login_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool protect = false;
//  是否可以点击按钮
  bool loginEnable = false;
  String userName = '';
  String password = '';
  String rePassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('注册', '登录', () {
        Navigator.pushNamed(context, RouterName.Login);
      }),
      body: ListView(
        children: [
          LoginEffect(protect: protect),
          LoginInput(
            label: '用户名',
            hint: '请输入用户名',
            onChange: (text) {
              userName = text;
              checkInput();
            },
          ),
          LoginInput(
            label: '密码',
            hint: '请输入密码',
            password: true,
            onChange: (text) {
              password = text;
              checkInput();
            },
            focusChange: (focus) {
              setState(() {
                protect = focus;
              });
            },
          ),
          LoginInput(
            label: '确认密码',
            hint: '请再次输入密码',
            password: true,
            onChange: (text) {
              rePassword = text;
              checkInput();
            },
            focusChange: (focus) {
              setState(() {
                protect = focus;
              });
            },
          ),
          LoginInput(
            label: '数字键盘',
            hint: '请输入数字',
            keyboardType: TextInputType.number,
            onChange: (text) {
              print(text);
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 20, left: 20, right: 20)),
          LoginButton(
            title: '注册',
            enable: loginEnable,
            onPressed: onPressed,
          )
        ],
      ),
    );
  }

  checkInput() {
    bool enable = false;
    if (userName.isNotEmpty && password.isNotEmpty && rePassword.isNotEmpty) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  void onPressed() {
    if (password != rePassword) {
      showWarnToast('两次密码不一样');
    } else {
      showToast('注册成功');
    }
  }
}
