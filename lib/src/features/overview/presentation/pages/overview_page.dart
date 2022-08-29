import 'dart:math';

import 'package:finack/src/presentation/custom_widgets/sliver_app_bar.dart';
import 'package:finack/src/presentation/custom_widgets/target_summary_chart.dart';
import 'package:finack/src/presentation/custom_widgets/transaction_log_widget.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CSliverAppBar(title: "Overview"),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  const TargetSummaryChart(value: -10),
                  const TargetSummaryChart(value: 30),
                  const TargetSummaryChart(value: 80),
                  const TargetSummaryChart(value: -40),
                  TargetSummaryChart(value: Random().nextInt(100).toDouble()),
                  const TargetSummaryChart(value: 10),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => TransactionLogWidget(
                log: TransactionLog(
                  type: TransactionType.values[random.nextInt(3)],
                  amount: random.nextDouble() * 256,
                  comment: random.nextBool() ? "Test transaction": null,
                ),
              ),
              childCount: 100,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'new_record',
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
