//页面异常状态管理

import 'package:flutter/material.dart';
import 'package:lifecycle_aware_state/lifecycle_aware_state.dart';

abstract class HiState<T extends StatefulWidget>
    extends LifecycleAwareState<T> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    } else {
      // 捕获页面销毁后，再次进行setState会报错
      print('HiState:页面已销毁，本次setState不执行：${toString()}');
    }
  }
}
