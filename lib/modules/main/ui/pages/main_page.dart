import 'package:dough/dough.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:s_house/common/constants/app_config.dart';
import 'package:s_house/common/localization/locale_keys.g.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';
import 'package:s_house/common/uikit/menu/cin_menu.dart';
import 'package:s_house/common/utils/locale_helper.dart';
import 'package:s_house/common/utils/modal_helper.dart';
import 'package:s_house/common/utils/status_bar.dart';
import 'package:s_house/shared/items/blocs/items_bloc.dart';
import 'package:s_house/shared/items/models/item.dart';
import 'package:s_house/shared/items/ui/widgets/item_tile.dart';

import '../../../settings/ui/modals/add_item_modal.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: StatusBar.page(context),
        child: Scaffold(
          body: ListView(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50, 40, 30, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(LocaleKeys.main_titlePrefix.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500)),
                          ),
                          CinMenu<Locale>(
                            onSelected: (Locale selectedLocale) {
                              if (selectedLocale != context.locale) {
                                context.setLocale(selectedLocale);
                                GoRouter.of(context).refresh();
                              }
                            },
                            items: AppConfig.supportedLocales,
                            resolveItemText: (Locale locale) =>
                                locale.languageName,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.language_rounded,
                                    color: ColorPalette.of(context).icon,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    LocaleKeys.language.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                            color:
                                                ColorPalette.of(context).icon),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          IconButton(
                            onPressed: () {
                              // context.push(R.settings);
                              context.showModal(const AddItemModal());
                            },
                            icon: const Icon(Icons.add_rounded, size: 18),
                          ),
                        ],
                      ),
                      PressableDough(
                        child: Text(LocaleKeys.main_title.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontSize: 40, fontWeight: FontWeight.w800)),
                      ),
                    ],
                  ),
                ),
              ),
              Selector<ItemsBloc, List<Item>?>(
                  selector: (context, bloc) => bloc.items,
                  builder: (context, items, child) {
                    return GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      children: List<Widget>.from(
                          (items ?? []).map((e) => ItemTile(e))),
                    );
                  })
            ],
          ),
        ),
      );
}
