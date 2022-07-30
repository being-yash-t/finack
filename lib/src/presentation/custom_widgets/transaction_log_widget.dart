import 'package:equatable/equatable.dart';
import 'package:finack/src/core/dependency_injection.dart';
import 'package:finack/src/core/utils/context_extensions.dart';
import 'package:finack/src/presentation/custom_widgets/sliver_app_bar.dart';
import 'package:finack/src/presentation/routing/router.gr.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

enum TransactionType {
  credit,
  debit,
  self;

  IconData get icon {
    switch (this) {
      case TransactionType.credit:
        return FluentIcons.chevron_up_20_regular;
      case TransactionType.debit:
        return FluentIcons.chevron_down_20_regular;
      case TransactionType.self:
        return FluentIcons.send_20_regular;
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
      title: Text(log.amount.toString()),
      subtitle: log.comment != null ? Text(log.comment!) : null,
      onTap: () => _bottomSheet(context),
    );
  }

  void _bottomSheet(BuildContext context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => BottomSheet(
          constraints: BoxConstraints(
            maxHeight:
             context.screenHeight * 0.7,
          ),
          onClosing: () {},
          builder: (context) => const CustomScrollView(
            slivers: [
              CSliverAppBar(
                title: 'Transaction Details',
                // icon: const Icon(FluentIcons.dismiss_20_regular),
              ),
            ],
          ),
        ),
      );
}
