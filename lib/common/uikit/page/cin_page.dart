import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:s_house/common/uikit/clickable/push_down_clickable.dart';
import 'package:s_house/common/utils/status_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CinPage extends StatefulWidget {
  const CinPage({
    required this.children,
    this.title,
    this.footer,
    this.actions,
    this.canLoadMore = false,
    this.canRefresh = false,
    this.onLoading,
    this.onRefresh,
    this.hasBackButton = true,
    this.hasBottomSpace = true,
    this.childrenPadding,
    Key? key,
  }) : super(key: key);

  final String? title;
  final List<Widget> children;
  final Widget? footer;
  final List<Widget>? actions;
  final bool canLoadMore;
  final bool canRefresh;
  final VoidCallback? Function(RefreshController)? onLoading;
  final VoidCallback? Function(RefreshController)? onRefresh;
  final bool hasBackButton;
  final bool hasBottomSpace;
  final EdgeInsetsGeometry? childrenPadding;

  @override
  State<CinPage> createState() => _CinPageState();
}

class _CinPageState extends State<CinPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: StatusBar.page(context),
        child: Scaffold(
          body: SafeArea(
            child: SmartRefresher(
              controller: _refreshController,
              enablePullUp: widget.canLoadMore,
              onLoading: widget.onLoading == null
                  ? null
                  : widget.onLoading!(_refreshController),
              enablePullDown: widget.canRefresh,
              onRefresh: widget.onRefresh == null
                  ? null
                  : widget.onRefresh!(_refreshController),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    leading: widget.hasBackButton
                        ? PushDownClickable(
                            onTap: () {
                              context.pop();
                            },
                            child: const Icon(Icons.arrow_back_ios_rounded))
                        : null,
                    pinned: true,
                    floating: true,
                    snap: true,
                    title: Text(
                      widget.title ?? '',
                    ),
                    actions: widget.actions,
                  ),
                  SliverPadding(
                    padding: widget.childrenPadding ?? EdgeInsets.zero,
                    sliver: SliverList(
                        delegate: SliverChildListDelegate(widget.hasBottomSpace
                            ? (widget.children..add(const SizedBox(height: 24)))
                            : widget.children)),
                  ),
                ],
              ),
            ),
          ),
          persistentFooterButtons: widget.footer == null
              ? null
              : [
                  Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: widget.footer,
                  ),
                ],
        ),
      );
}
