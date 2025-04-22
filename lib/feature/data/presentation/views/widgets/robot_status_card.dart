import 'package:flutter/material.dart';

class RobotStatusCard extends StatelessWidget {
  final bool isRunning;
  final bool isReversing;
  final bool isFinished;

  const RobotStatusCard({
    super.key,
    required this.isRunning,
    required this.isReversing,
    required this.isFinished,
  });

  @override
  Widget build(BuildContext context) {
    String statusText = "Stopped";
    Color color = Colors.red;
    IconData icon = Icons.stop;

    if (isFinished) {
      statusText = "Finished";
      color = Colors.blueGrey;
      icon = Icons.flag;
    } else if (isReversing) {
      statusText = "Reversing";
      color = Colors.orange;
      icon = Icons.rotate_left;
    } else if (isRunning) {
      statusText = "Running";
      color = Colors.green;
      icon = Icons.play_arrow;
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
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Robot Status",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                statusText,
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
