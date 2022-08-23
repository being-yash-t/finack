import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core/constants/firebase.dart';

class PersonalTarget extends Equatable {
  final String? id;
  final String title;
  final bool isArchived;
  final double targetPercentage;
  final double achievedPercentage;

  const PersonalTarget({
    this.id,
    required this.title,
    required this.isArchived,
    required this.targetPercentage,
    required this.achievedPercentage,
  });

  @override
  List<Object?> get props => [id, title, isArchived, targetPercentage];
}

class TargetSummaryChart extends StatelessWidget {
  final double value;
  const TargetSummaryChart({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 80,
        width: 80,
        child: Stack(
          children: [
            Positioned.fill(
              child: value < 0
                  ? Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: circularProgressIndicator(value * -1),
                    )
                  : circularProgressIndicator(value),
            ),
            Center(child: Text(value.toString())),
          ],
        ),
      ),
    );
  }

  Widget circularProgressIndicator(double value) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: value),
      duration: animationDuration,
      builder: (context, value, _) => CircularProgressIndicator(
        value: value / 100,
        strokeWidth: 8,
      ),
    );
  }
}
