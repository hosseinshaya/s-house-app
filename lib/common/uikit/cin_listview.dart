import 'package:flutter/material.dart';
import 'package:s_house/common/uikit/shimmer_container.dart';

class CinListView<T> extends StatelessWidget {
  const CinListView({
    required this.items,
    required this.itemBuilder,
    this.emptyListBuilder,
    this.separatorBuilder,
    this.loadingBuilder,
    this.controller,
    this.padding,
    this.physics = const BouncingScrollPhysics(),
    this.loading = false,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.shrinkWrap = false,
    this.prefixWidget,
    Key? key,
    this.primary,
    this.showPrefixOnEmpty,
  }) : super(key: key);

  factory CinListView.manual({
    bool loading = false,
    bool shrinkWrap = false,
    required List<T> children,
    Widget Function(BuildContext context)? separatorBuilder,
    Widget Function(BuildContext context)? loadingBuilder,
    EdgeInsetsGeometry? padding,
    Widget? prefixWidget,
  }) =>
      CinListView<T>(
        loading: loading,
        shrinkWrap: shrinkWrap,
        items: children,
        itemBuilder: (context, item) => item as Widget,
        separatorBuilder: separatorBuilder,
        loadingBuilder: loadingBuilder,
        padding: padding,
        prefixWidget: prefixWidget,
      );

  final bool loading;
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final Widget Function(BuildContext context)? separatorBuilder;
  final Widget Function(BuildContext context, Widget? prefixWidget)? emptyListBuilder;
  final Widget Function(BuildContext context)? loadingBuilder;
  final Widget? prefixWidget;

  final Axis scrollDirection;
  final bool reverse;
  final bool shrinkWrap;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final bool? showPrefixOnEmpty;

  Widget _defaultLoadingBuilder(BuildContext context) => ShimmerContainer(
        height: 80,
        width: scrollDirection == Axis.vertical ? double.infinity : 100,
      );

  Widget _defaultSeparatorBuilder(BuildContext context) => const SizedBox();

  Widget _defaultEmptyListBuilder(BuildContext context) => const SizedBox();

  @override
  Widget build(BuildContext context) => items.isEmpty && !loading
      ? ListView(
          scrollDirection: scrollDirection,
          reverse: reverse,
          shrinkWrap: shrinkWrap,
          controller: controller,
          primary: primary,
          physics: physics,
          padding: padding,
          children: [
            if ((showPrefixOnEmpty ?? (emptyListBuilder == null)) && prefixWidget != null) prefixWidget!,
            if (emptyListBuilder == null)
              _defaultEmptyListBuilder(context)
            else
              emptyListBuilder!(context, prefixWidget),
          ],
        )
      : ListView.separated(
          scrollDirection: scrollDirection,
          reverse: reverse,
          shrinkWrap: shrinkWrap,
          controller: controller,
          primary: primary,
          physics: physics,
          padding: padding,
          itemCount: (loading ? 5 : items.length) + (prefixWidget != null ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == 0 && prefixWidget != null) {
              return prefixWidget!;
            }
            return loading
                ? (loadingBuilder ?? _defaultLoadingBuilder).call(context)
                : itemBuilder(context, items[index - (prefixWidget != null ? 1 : 0)]);
          },
          separatorBuilder: (context, _) => (separatorBuilder ?? _defaultSeparatorBuilder).call(context),
        );
}
