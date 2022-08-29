import 'package:equatable/equatable.dart';

class BucketTag extends Equatable {
  final String? id;
  final String title;

  const BucketTag({
    this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}

class Bucket extends Equatable {
  final String? id;
  final String title;
  final bool isArchived;
  final double targetAmount;
  final double achievedAmount;
  final List<BucketTag> tags;

  const Bucket({
    this.id,
    required this.title,
    required this.isArchived,
    required this.targetAmount,
    required this.achievedAmount,
    required this.tags,
  });

  @override
  List<Object?> get props => [id, title, isArchived, targetAmount, tags];
}
