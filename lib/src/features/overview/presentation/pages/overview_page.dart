import 'package:finack/src/presentation/custom_widgets/sliver_app_bar.dart';
import 'package:finack/src/presentation/themes/themes.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CSliverAppBar(title: "Overview"),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (_, index) => ListTile(
              title: Text("eee $index"),
            ),
            childCount: 100,
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _newEntry,
        label: const Text('New Record'),
        icon: const Icon(FluentIcons.add_20_regular),
      ),
    );
  }

  void _newEntry() {
    throw UnimplementedError("Create new record implementation pending.");
  }
}
