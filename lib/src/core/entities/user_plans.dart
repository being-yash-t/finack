import 'package:equatable/equatable.dart';

enum IncomeType { tpa, lpa, cpa }

class FinancialMargin extends Equatable{
  final String title;
  final double percentage;

  const FinancialMargin({
    required this.title,
    required this.percentage,
  });

  @override
  List<Object?> get props => [title, percentage];
}

class UserPlans extends Equatable{
  final String userId;
  final double yearlyIncome;
  final IncomeType incomeUnit;
  final List<FinancialMargin> margins;

  const UserPlans({
    required this.userId,
    required this.incomeUnit,
    required this.yearlyIncome,
    required this.margins,
  }) : assert(margins.length <= 10);

  @override
  List<Object?> get props => [userId, yearlyIncome, incomeUnit, margins];
}
