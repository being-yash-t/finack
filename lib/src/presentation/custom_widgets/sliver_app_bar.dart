import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../core/utils/context_extensions.dart';
import '../dashboard/dashboard_screen.dart';
import 'dashboard_scaffold.dart';

class CSliverAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final bool pinned;
  final bool usesDashboardScaffold;
  final bool usesDashboardActions;
  final bool? forceElevated;
  final double? flexibleHeight;
  final double? collapsedHeight;
  final Widget? flexibleSpace;

  const CSliverAppBar({
    Key? key,
    required this.title,
    this.actions = const [],
    this.pinned = true,
    this.usesDashboardScaffold = false,
    this.usesDashboardActions = false,
    this.forceElevated,
    this.flexibleHeight,
    this.flexibleSpace,
    this.collapsedHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget? leadingWidget;

    final scaffoldState = usesDashboardScaffold
        ? DashboardScaffold.of(context)
        : Scaffold.of(context);
    if (usesDashboardScaffold) {
      assert(
        usesDashboardScaffold && scaffoldState != null,
        "usesDashboardScaffold should be only true when DashboardScaffold is present above this widget",
      );
    }

    if (ModalRoute.of(context)?.canPop ?? false) {
      leadingWidget = IconButton(
        icon: const Icon(FluentIcons.chevron_left_20_regular),
        onPressed: () => Navigator.maybePop(context),
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      );
    }

    if (scaffoldState!.hasDrawer) {
      leadingWidget = IconButton(
        icon: const Icon(FluentIcons.navigation_20_regular),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        onPressed: scaffoldState.openDrawer,
      );
    }

    List<Widget>? appBarActions = usesDashboardActions
        ? context.findAncestorWidgetOfExactType<DashboardScaffold>()?.actions
        : actions;
    if (usesDashboardActions && appBarActions == null) {
      debugPrint("usesDashboardActions flag set when dashboard is not used");
      debugPrint("getting actions from DashboardScreen.getActions");
      appBarActions = DashboardScreen.getActions;
    }

    return SliverAppBar(
      pinned: pinned,
      floating: true,
      leading: leadingWidget,
      automaticallyImplyLeading: false,
      forceElevated: forceElevated ?? false,
      elevation: forceElevated == false ? 0 : null,
      titleSpacing: leadingWidget != null ? 0 : 16,
      title: flexibleSpace == null ? null : Text(title),
      snap: true,
      flexibleSpace: flexibleSpace ??
          FlexibleSpaceBar(
            background: Container(color: theme.scaffoldBackgroundColor),
            centerTitle: true,
            title: Text(title, style: theme.textTheme.headline6),
          ),
      expandedHeight: flexibleHeight ?? context.screenHeight / 5,
      actions: appBarActions,
      collapsedHeight: collapsedHeight,
    );
  }
}
