import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_house/common/styles/colorPalette/color_palette_helper.dart';
import 'package:s_house/common/uikit/shimmer_container.dart';
import 'package:s_house/common/utils/locale_helper.dart';

class CachedImageComponent extends StatelessWidget {
  const CachedImageComponent(this.url,
      {Key? key, this.width, this.height, this.padding = EdgeInsets.zero, this.radius, this.fit})
      : super(key: key);

  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final String? url;
  final double? radius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: url ?? '',
        fit: fit ?? BoxFit.fill,
        placeholder: (_, __) => const ShimmerContainer(),
        errorWidget: (_, __, ___) => Container(
          color: context.colors.background,
          alignment: Alignment.center,
          child: SvgPicture.asset(context.localeLogoType, height: 30, color: context.colors.disabled),
        ),
      );
}
