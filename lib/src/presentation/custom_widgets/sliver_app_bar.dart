import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CSliverAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  const CSliverAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final parentScaffold = Scaffold.of(Scaffold.of(context).context);
    return SliverAppBar(
      pinned: true,
      leading: parentScaffold.hasDrawer
          ? IconButton(
              icon: const Icon(FluentIcons.navigation_20_regular),
              onPressed: parentScaffold.openDrawer,
            )
          : null,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(color: theme.scaffoldBackgroundColor),
        centerTitle: true,
        title: Text(title, style: theme.textTheme.headline6),
      ),
      actions: actions,
      expandedHeight: mediaQuery.size.height / 5,
    );
  }
}
