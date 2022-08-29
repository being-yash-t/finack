import 'package:flutter/material.dart';

import '../../core/constants/paddings.dart';

class CChip extends StatelessWidget {
  final String title;
  final Icon deleteIcon;
  final VoidCallback deleteCallback;
  final EdgeInsets margin;

  const CChip({
    Key? key,
    required this.title,
    required this.deleteCallback,
    required this.deleteIcon,
    this.margin = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chipStyle = Theme.of(context).chipTheme;
    return Container(
      height: 40,
      margin: margin,
      decoration: BoxDecoration(
        color: chipStyle.backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          padding16,
          Text(
            title,
            style: chipStyle.labelStyle!.copyWith(color: Colors.white),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: deleteCallback,
            icon: deleteIcon,
            color: Colors.white,
          ),
          padding4,
        ],
      ),
    );
  }
}
