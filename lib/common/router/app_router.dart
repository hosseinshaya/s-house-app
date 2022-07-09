import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:s_house/common/router/ui/err_page.dart';

class R {
  static const String main = '/';
}

class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    observers: <NavigatorObserver>[BotToastNavigatorObserver()],
    urlPathStrategy: UrlPathStrategy.path,
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      restorationId: state.pageKey.value,
      child: const ErrPage(),
    ),
    routes: <GoRoute>[
      // _route(path: R.main, pageBuilder: (state) => const MainPage()), // todo
    ],
  );

  GoRoute _route(
          {required String path,
          required Widget Function(GoRouterState state) pageBuilder,
          List<GoRoute> routes = const []}) =>
      GoRoute(
        path: path,
        routes: routes,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            CupertinoPage<void>(
          key: state.pageKey,
          restorationId: state.pageKey.value,
          child: pageBuilder(state),
        ),
      );
}
