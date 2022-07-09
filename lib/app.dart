import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:s_house/common/constants/app_config.dart';
import 'package:s_house/common/router/app_router.dart';
import 'package:s_house/common/styles/appTheme/app_theme.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';

import 'common/localization/locale_keys.g.dart';
import 'common/utils/app_scroll_behavior.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<AppRouter>(
            lazy: false,
            create: (BuildContext createContext) => AppRouter(),
          ),
        ],
        child: EasyLocalization(
          supportedLocales: AppConfig.supportedLocales,
          path: AppConfig.localePath,
          startLocale: AppConfig.startLocale,
          fallbackLocale: AppConfig.startLocale,
          useOnlyLangCode: true,
          child: RefreshConfiguration(
            headerBuilder: () => const MaterialClassicHeader(),
            footerBuilder: () => CustomFooter(
              builder: (BuildContext context, LoadStatus? mode) {
                if (mode == LoadStatus.loading) {
                  return SizedBox(
                    height: 65,
                    child: Center(
                      child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              color: ColorPalette.of(context).primary)),
                    ),
                  );
                } else if (mode == LoadStatus.failed) {
                  return SizedBox(
                    height: 55,
                    child: Center(
                      child: Text(
                        LocaleKeys.err_tryAgain.tr(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                              color: ColorPalette.of(context).textCaption,
                            ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            child: Builder(
              builder: (BuildContext context) {
                final GoRouter router =
                    Provider.of<AppRouter>(context, listen: false).router;
                return MaterialApp.router(
                  title: AppConfig.name,
                  theme: AppTheme.dark,
                  scrollBehavior: const AppScrollBehavior(),
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  builder: (BuildContext context, Widget? child) =>
                      BotToastInit()(context, child),
                  routeInformationParser: router.routeInformationParser,
                  routerDelegate: router.routerDelegate,
                  debugShowCheckedModeBanner: false,
                );
              },
            ),
          ),
        ),
      );
}
