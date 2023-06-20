import 'package:flutter/material.dart';
import 'package:flutter_blibli/utils/color.dart';

class LoadingContainer extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  ///加载动画是否覆盖在原有界面上
  final bool cover;
  const LoadingContainer(
      {Key? key,
      required this.child,
      this.isLoading = false,
      this.cover = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cover) {
      return Stack(
        children: [child, isLoading ? _loadingView : Container()],
      );
    } else {
      return isLoading ? _loadingView : child;
    }
  }

  Widget get _loadingView {
    return const Center(
      child: CircularProgressIndicator(
        color: primary,
      ),
    );
  }
}
