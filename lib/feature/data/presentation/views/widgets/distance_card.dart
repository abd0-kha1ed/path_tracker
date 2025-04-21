import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DistanceCard extends StatelessWidget {
  final double distance;
  final List<double> distanceHistory;

  const DistanceCard({
    super.key,
    required this.distance,
    required this.distanceHistory,
  });

  Color getDistanceColor(double value) {
    if (value < 10) return Colors.redAccent;
    if (value < 20) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final color = getDistanceColor(distance);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.sensor_door, color: color),
              const SizedBox(width: 8),
              Text(
                "Distance",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: distance),
            duration: const Duration(milliseconds: 600),
            builder: (context, value, _) {
              return Text(
                "${value.toStringAsFixed(1)} cm",
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold, color: color),
              );
            },
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    spots: distanceHistory
                        .asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), e.value))
                        .toList(),
                    color: color,
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: color.withOpacity(0.2),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}