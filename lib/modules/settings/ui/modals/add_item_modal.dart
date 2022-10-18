import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:s_house/common/localization/locale_keys.g.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';
import 'package:s_house/common/styles/colorPalette/color_palette_helper.dart';
import 'package:s_house/common/uikit/button/cin_button.dart';
import 'package:s_house/common/uikit/cin_listview.dart';
import 'package:s_house/common/uikit/clickable/push_down_clickable.dart';
import 'package:s_house/common/uikit/form/cin_textfield.dart';
import 'package:s_house/common/uikit/modal.dart';
import 'package:s_house/common/uikit/modal_title.dart';
import 'package:s_house/modules/settings/blocs/add_item_bloc.dart';
import 'package:s_house/shared/items/constants/light_images.dart';
import 'package:s_house/shared/items/models/item.dart';
import 'package:s_house/shared/items/utils/item_gradient.dart';
import 'package:separated_column/separated_column.dart';

class AddItemModal extends StatelessWidget {
  const AddItemModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => AddItemBloc(context),
      builder: (context, child) {
        return Modal(
          child: Selector<AddItemBloc, Item>(
              shouldRebuild: (_, __) => true,
              selector: (context, bloc) => bloc.selectedItem,
              builder: (context, selectedItem, child) {
                return Column(
                  children: [
                    ModalTitle(LocaleKeys.items_addItem.tr()),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      child: SeparatedColumn(
                        children: [
                          CinTextField(
                            name: 'faName',
                            label: LocaleKeys.items_form_faName.tr(),
                            hint: LocaleKeys.items_form_faNameHint.tr(),
                            onChanged: (text) {
                              context.read<AddItemBloc>().faName = text;
                            },
                          ),
                          CinTextField(
                            name: 'enName',
                            label: LocaleKeys.items_form_enName.tr(),
                            hint: LocaleKeys.items_form_enNameHint.tr(),
                            onChanged: (text) {
                              context.read<AddItemBloc>().enName = text;
                            },
                          ),
                          CinTextField(
                            name: 'pin',
                            label: LocaleKeys.items_form_pin.tr(),
                            keyboardType: TextInputType.number,
                            onChanged: (text) {
                              context.read<AddItemBloc>().pin = int.tryParse(text ?? '');
                            },
                          ),
                        ],
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Selector<AddItemBloc, ColorMode?>(
                        selector: (context, bloc) => bloc.selectedColor,
                        builder: (context, selectedColor, child) {
                          return SizedBox(
                            height: 60,
                            child: CinListView<ColorMode>(
                              items: <ColorMode>[
                                context.colors.primary,
                                context.colors.wtf,
                                context.colors.success,
                                context.colors.warning,
                                context.colors.error,
                              ],
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              itemBuilder: (context, item) => PushDownClickable(
                                onTap: () =>
                                    context.read<AddItemBloc>().color = item,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    gradient: ItemGradient.from(item),
                                    border: selectedColor == item
                                        ? Border.all(
                                            color: context.colors.textPrimary,
                                            width: 4)
                                        : null,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              separatorBuilder: (context) =>
                                  const SizedBox(width: 10),
                            ),
                          );
                        }),
                    const SizedBox(height: 12),
                    Selector<AddItemBloc, ColorMode?>(
                        selector: (context, bloc) => bloc.selectedColor,
                        builder: (context, selectedColor, child) {
                          return SizedBox(
                            height: 75,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              itemCount: LightImages.count,
                              itemBuilder: (context, index) =>
                                  PushDownClickable(
                                onTap: () => context
                                    .read<AddItemBloc>()
                                    .imageIndex = index,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    gradient: selectedItem.imageIndex == index
                                        ? ItemGradient.from(selectedColor ??
                                            context.colors.background)
                                        : null,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  child: SvgPicture.asset(
                                    LightImages.getPath(index: (index + 1)),
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 10),
                            ),
                          );
                        }),
                    const SizedBox(height: 12),
                    CinButton(
                      margin: const EdgeInsets.all(12),
                      text: LocaleKeys.items_submit.tr(),
                      enabled: context.select<AddItemBloc, bool>(
                          (bloc) => bloc.isSubmitEnabled),
                      onPressed: () async {
                        context.read<AddItemBloc>().submit();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              }),
        );
      });
}
