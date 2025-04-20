
import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final String label;
  final bool status;

  const StatusIndicator({
    super.key,
    required this.label,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 4),
        Icon(
          status ? Icons.check_circle : Icons.cancel,
          color: status ? Colors.green : Colors.red,
        ),
      ],
    );
  }
}
