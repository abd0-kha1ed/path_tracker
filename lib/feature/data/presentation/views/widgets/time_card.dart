import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final int seconds;
  final bool isReversing;
  final bool isFinished;

  const TimeCard({
    super.key,
    required this.seconds,
    required this.isReversing,
    required this.isFinished,
  });

  @override
  Widget build(BuildContext context) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;

    Color color = Colors.blue;
    if (isFinished) {
      color = Colors.grey.shade800;
    } else if (isReversing) {
      color = Colors.orange;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.access_time, color: color, size: 32),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Time Elapsed",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
