import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:s_house/common/router/ui/err_page.dart';
import 'package:s_house/modules/main/ui/pages/main_page.dart';
import 'package:s_house/modules/settings/ui/pages/settings_page.dart';

class R {
  static const String main = '/';
  static const String settings = '/settings';
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
      _route(path: R.main, pageBuilder: (state) => const MainPage()),
      _route(path: R.settings, pageBuilder: (state) => const SettingsPage()),
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
