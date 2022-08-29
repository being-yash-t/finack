import 'package:equatable/equatable.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../core/constants/firebase.dart';
import '../../core/utils/context_extensions.dart';
enum TransactionType {
  credit,
  debit,
  selfTransfer;

  IconData get icon {
    switch (this) {
      case TransactionType.credit:
        return FluentIcons.chevron_up_20_regular;
      case TransactionType.debit:
        return FluentIcons.chevron_down_20_regular;
      case TransactionType.selfTransfer:
        return FluentIcons.send_20_regular;
    }
  }

  String get name {
    switch (this) {
      case TransactionType.credit:
        return 'Credit';
      case TransactionType.debit:
        return 'Debit';
      case TransactionType.selfTransfer:
        return 'Self-Transfer';
    }
  }
}

class TransactionLog extends Equatable {
  final String? id;
  final TransactionType type;
  final double amount;
  final String? comment;

  const TransactionLog({
    this.id,
    required this.type,
    required this.amount,
    required this.comment,
  });

  @override
  List<Object?> get props => [id, type, amount];
}

class TransactionLogWidget extends StatelessWidget {
  final TransactionLog log;
  const TransactionLogWidget({
    Key? key,
    required this.log,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(log.type.icon),
      title: Text(log.amount.toStringAsFixed(2)),
      subtitle: log.comment != null ? Text(log.comment!) : null,
      onTap: () => _bottomSheet(context),
    );
  }

  void _bottomSheet(BuildContext context) => showMaterialModalBottomSheet(
        context: context,
        duration: kAnimationDuration,
        builder: (context) => TransactionLogSheet(
          log: log,
        ),
      );
}

class TransactionLogSheet extends StatelessWidget {
  final TransactionLog log;

  const TransactionLogSheet({
    Key? key,
    required this.log,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Transaction Details',
              style: context.textTheme.headline6,
            ),
          ),
        ),
        // icon: const Icon(FluentIcons.dismiss_20_regular),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Amount:'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            log.amount.toString(),
            style: context.textTheme.headline5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  log.type.name,
                  style: context.textTheme.headline6,
                ),
              ),
              Icon(log.type.icon),
            ],
          ),
        ),
      ],
    );
  }
}
