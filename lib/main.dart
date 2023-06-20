import 'package:flutter/material.dart';
import 'package:flutter_blibli/navigator/router.dart';
import 'package:flutter_blibli/page/not_found_page.dart';
import 'package:flutter_blibli/provider/index.dart';
import 'package:flutter_blibli/utils/color.dart';
import 'package:lifecycle_aware_state/lifecycle_aware_state.dart';
import 'package:provider/provider.dart';

import 'db/cache.dart';

void main() {
  LifecycleAwareState.logClassSuffixes = ['Page'];
  LifecycleAwareState.logSuffixedClassesOnly = true;
  runApp(MultiProvider(
    providers: topProviders,
    child: const BiliApp(),
  ));
}

class BiliApp extends StatelessWidget {
  const BiliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: Cache.preInit(), builder: builder);
  }

  Widget builder(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    return MaterialApp(
      title: 'Flutter Bili',
      theme: ThemeData(
        primarySwatch: white,
      ),
      initialRoute: RouterName.Login,
      navigatorObservers: [LifecycleAwareState.routeObserver],
      onGenerateRoute: (settings) {
        // 要访问的路由地址不存在，就显示404页面
        final String name = settings.name ?? RouterName.NotFound;
        final Function? controllerFn = routers[name];
        if (controllerFn == null) {
          return routePageWrap(const NotFoundPage());
        } else {
          if (settings.arguments == null) {
            return controllerFn();
          }
          return controllerFn(settings.arguments);
        }
      },
      onUnknownRoute: (settings) {
        return routePageWrap(const NotFoundPage());
      },
    );
  }
}
