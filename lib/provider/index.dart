import 'package:flutter_blibli/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

//所有provider通过这里暴露出去
List<SingleChildWidget> topProviders = [
  ChangeNotifierProvider(create: (_) => UserProvider())
];
