import 'dart:convert';

import 'package:flutter/material.dart';

Future loadJson(BuildContext context, String path) async {
  String result = await DefaultAssetBundle.of(context).loadString(path);
  return json.decode(result.toString());
}
