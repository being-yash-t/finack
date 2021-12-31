import 'package:equatable/equatable.dart';
import 'package:finack/src/core/entities/user_plans.dart';
import 'package:finack/src/core/utils/date_utils.dart';

abstract class Transaction extends Equatable {
  final DateTime dateTime;
  final double amount;
  final String message;

  const Transaction({
    required this.dateTime,
    required this.amount,
    required this.message,
  });

  String get id => dateTime.getDocIdFromDate();

  Map<String, dynamic> get toMap;
}

class DebitTransaction extends Transaction {
  final FinancialMargin debitedFromMargin;

  const DebitTransaction({
    required DateTime dateTime,
    required double amount,
    required String message,
    required this.debitedFromMargin,
  }) : super(
          dateTime: dateTime,
          amount: amount,
          message: message,
        );

  @override
  List<Object?> get props => [debitedFromMargin, dateTime, amount, message];

  @override
  Map<String, dynamic> get toMap => {
        'amount': amount,
        'message': message,
        'debitedFromMargin': debitedFromMargin.id,
      };
}

class CreditTransaction extends Transaction {
  final bool isExtraSalary;
  final FinancialMargin? creditedForMargin;

  const CreditTransaction({
    required DateTime dateTime,
    required double amount,
    required String message,
    required this.isExtraSalary,
    required this.creditedForMargin,
  })  : assert((isExtraSalary && creditedForMargin == null) ||
            ((!isExtraSalary) && creditedForMargin != null)),
        super(
          dateTime: dateTime,
          amount: amount,
          message: message,
        );

  @override
  List<Object?> get props => [
        isExtraSalary,
        creditedForMargin,
        dateTime,
        amount,
        message,
      ];

  @override
  Map<String, dynamic> get toMap => {
    'amount':amount,
    'message':message,
    'isExtraSalary': isExtraSalary,
    'creditedForMargin': creditedForMargin?.id,
  };
}
