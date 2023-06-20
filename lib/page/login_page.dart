import 'package:flutter/material.dart';
import 'package:flutter_blibli/model/user_model.dart';
import 'package:flutter_blibli/navigator/router.dart';
import 'package:flutter_blibli/provider/user_provider.dart';
import 'package:flutter_blibli/widget/app_bar.dart';
import 'package:flutter_blibli/widget/login_button.dart';
import 'package:flutter_blibli/widget/login_effect.dart';
import 'package:flutter_blibli/widget/login_input.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool protect = false;

  String userName = '';

  String password = '';

  bool loginEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('密码登录', '注册', () {
        Navigator.pushNamed(context, RouterName.Register);
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
          const Padding(padding: EdgeInsets.only(top: 20, left: 20, right: 20)),
          LoginButton(
            title: '登录',
            enable: loginEnable,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  void checkInput() {
    bool enable = false;
    if (userName.isNotEmpty && password.isNotEmpty) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  void onPressed() {
    context
        .read<UserProvider>()
        .setUserModel(UserModel(userName: userName, id: '1'));
    Navigator.pushNamed(context, RouterName.Home);
  }
}
