import 'package:flutter/material.dart';

class StreakIndicator extends StatelessWidget {
  const StreakIndicator({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.local_fire_department,
          size: 32,
          color: Color(0xFFFF6D00),
        ),
        const SizedBox(width: 8),
        Text(
          '$count',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
