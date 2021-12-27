import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: const FlexibleSpaceBar(
              title: Text("Overview"),
              centerTitle: true,
            ),
            expandedHeight: mediaQuery.size.height / 4.5,
          ),
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
