import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SpeedCard extends StatefulWidget {
  final double speed;
  final bool isRunning;

  const SpeedCard({
    Key? key,
    required this.speed,
    required this.isRunning,
  }) : super(key: key);

  @override
  State<SpeedCard> createState() => _SpeedCardState();
}

class _SpeedCardState extends State<SpeedCard> {
  List<FlSpot> speedHistory = [];
  late double displayedSpeed;

  @override
  void initState() {
    super.initState();
    displayedSpeed = widget.speed;
    speedHistory.add(FlSpot(0, widget.speed));
  }

  @override
  void didUpdateWidget(covariant SpeedCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.speed != oldWidget.speed) {
      setState(() {
        displayedSpeed = widget.speed;
        if (speedHistory.length > 20) speedHistory.removeAt(0);
        speedHistory.add(FlSpot(speedHistory.length.toDouble(), widget.speed));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color color = widget.isRunning ? Colors.green : Colors.red;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Speed',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 8),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: displayedSpeed,
              end: widget.speed,
            ),
            duration: Duration(milliseconds: 500),
            builder: (context, value, _) => Text(
              '${value.toStringAsFixed(1)} cm/s',
              style: TextStyle(
                fontSize: 24,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: speedHistory,
                    isCurved: true,
                    dotData: FlDotData(show: false),
                    color: color,
                    barWidth: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
