import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:s_house/common/styles/appTheme/app_theme_helper.dart';
import 'package:s_house/common/styles/colorPalette/color_palette_helper.dart';
import 'package:s_house/common/uikit/clickable/push_down_clickable.dart';
import 'package:s_house/common/uikit/loading_widget.dart';
import 'package:s_house/common/uikit/shimmer_container.dart';
import 'package:s_house/common/utils/logging/log_helper.dart';
import 'package:separated_row/separated_row.dart';

class CinModalMenuTile extends StatefulWidget {
  const CinModalMenuTile({this.title, this.icon, Key? key, this.onPressed}) : super(key: key);

  final String? title;
  final IconData? icon;
  final AsyncCallback? onPressed;

  @override
  State<CinModalMenuTile> createState() => _CinModalMenuTileState();

  static Widget shimmer() => const ShimmerContainer(height: 60);
}

class _CinModalMenuTileState extends State<CinModalMenuTile> {
  bool loading = false;

  @override
  Widget build(BuildContext context) => PushDownClickable(
        onTap: () async {
          if (mounted) {
            setState(() => loading = true);
          }
          try {
            if (widget.onPressed != null) {
              await widget.onPressed!();
            }
          } catch (e) {
            e.log();
          }
          if (mounted) {
            setState(() => loading = false);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: context.colors.background,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(15),
          child: SeparatedRow(
            children: [
              if (widget.icon != null)
                loading
                    ? LoadingWidget(
                        size: 20,
                        color: context.colors.textDisabled,
                      )
                    : Icon(
                        widget.icon,
                        size: 20,
                        color: context.colors.textDisabled,
                      ),
              if (widget.title != null)
                Text(
                  widget.title!,
                  style: context.textTheme.subtitle2!.copyWith(color: context.colors.textCaption),
                ),
            ],
            separatorBuilder: (_, __) => const SizedBox(width: 12),
          ),
        ),
      );
}
