import 'package:flutter/material.dart';
import 'package:flutter_blibli/core/tab_base_state.dart';

class RankingTabPage extends StatefulWidget {
  const RankingTabPage({Key? key}) : super(key: key);

  @override
  State<RankingTabPage> createState() => _RankingTabPageState();
}

class _RankingTabPageState extends TabBaseState<RankingTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  bool isLoading = false;

  @override
  // TODO: implement contentChild
  get contentChild {
    return const Text('text');
  }

  @override
  Future<void> onRefresh() {
    throw UnimplementedError();
  }

  @override
  onScrollToBottom() {
    throw UnimplementedError();
  }

  @override
  bool get wantKeepAlive => true;
}
