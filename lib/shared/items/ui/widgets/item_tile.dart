import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_house/common/styles/appTheme/app_theme_helper.dart';
import 'package:s_house/common/styles/colorPalette/color_palette.dart';
import 'package:s_house/common/styles/colorPalette/color_palette_helper.dart';
import 'package:s_house/shared/items/constants/light_images.dart';
import 'package:s_house/shared/items/models/item.dart';
import 'package:s_house/shared/items/utils/item_gradient.dart';

class ItemTile extends StatelessWidget {
  const ItemTile(this.item, {Key? key}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: ItemGradient.from(
              item.color?.toColorMode() ?? context.colors.background),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: SvgPicture.asset(
                    LightImages.getPath(index: item.imageIndex! + 1),
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      item.trName(context),
                      style: context.textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: (item.color
                                          ?.toColorMode()
                                          .main
                                          .computeLuminance() ??
                                      0) >
                                  0.5
                              ? Colors.blueGrey[900]
                              : context.colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
