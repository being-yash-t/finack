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
    return SliverAppBar(
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(color: theme.scaffoldBackgroundColor),
        titlePadding: const EdgeInsets.all(8),
        title: Text(title, style: theme.textTheme.headline6),
      ),
      actions: actions,
      expandedHeight: mediaQuery.size.height / 5,
    );
  }
}
