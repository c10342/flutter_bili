import 'package:flutter/material.dart';
import 'package:flutter_blibli/model/user_model.dart';

// extension 方法向现有库的 API 或我们预定义的方法添加额外的功能
// extension <extension name> on <type>
// extension 名是您的 extension 方法名,
// type 是您的数据类型名称，如 int、 double、 string，或者也可以是 Widget。和成员定义是您的方法
// 成员定义是您自己执行返回数据的方法
// extension ThemeModeExtension on ThemeMode {
//   String get value => <String>['System', 'Light', 'Dark'][index];
// }

class UserProvider extends ChangeNotifier {
  UserModel? _userModel;

  UserModel? getUserModel() {
    return _userModel;
  }

  void setUserModel(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }
}
