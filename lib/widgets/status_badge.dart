import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final bool isLive;

  const StatusBadge({super.key, required this.isLive});

  @override
  Widget build(BuildContext context) {
    final color = isLive ? Colors.red : Colors.grey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 9, color: color),
          const SizedBox(width: 6),
          Text(
            isLive ? 'SEDANG LIVE' : 'OFFLINE',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
