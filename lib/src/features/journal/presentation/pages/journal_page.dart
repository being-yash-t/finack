import 'package:auto_route/auto_route.dart';
import 'package:finack/src/presentation/routing/router.gr.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'add_bucket',
        label: const Text("Add bucket"),
        onPressed: () => context.router.navigate(
          AddEditBucketScreen(
            bucket: null,
          ),
        ),
        icon: const Icon(FluentIcons.add_20_regular),
      ),
      body: Center(
        child: Text(runtimeType.toString()),
      ),
    );
  }
}
