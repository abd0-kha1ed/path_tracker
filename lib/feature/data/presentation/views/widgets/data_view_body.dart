import 'package:flutter/material.dart';
import 'package:robotics_app/feature/data/data/model/data_model.dart';
import 'package:robotics_app/feature/data/presentation/views/widgets/speed_card.dart';
import 'package:robotics_app/feature/data/presentation/views/widgets/distance_card.dart';
import 'package:robotics_app/feature/data/presentation/views/widgets/robot_status_card.dart';
import 'package:robotics_app/feature/data/presentation/views/widgets/time_card.dart';

class DataViewBody extends StatefulWidget {
  final DataModel data;

  const DataViewBody({super.key, required this.data});

  @override
  State<DataViewBody> createState() => _DataViewBodyState();
}

class _DataViewBodyState extends State<DataViewBody> {
  List<double> _distanceHistory = [];
  List<double> _speedHistory = [];

  @override
  void didUpdateWidget(covariant DataViewBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data.distanceFromObstacle != oldWidget.data.distanceFromObstacle) {
      _distanceHistory.add(widget.data.distanceFromObstacle);
      if (_distanceHistory.length > 20) _distanceHistory.removeAt(0);
    }

    double avgSpeed = (widget.data.leftMotorSpeed + widget.data.rightMotorSpeed) / 2;
    if (_speedHistory.isEmpty || avgSpeed != _speedHistory.last) {
      _speedHistory.add(avgSpeed);
      if (_speedHistory.length > 20) _speedHistory.removeAt(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final averageSpeed = (widget.data.leftMotorSpeed + widget.data.rightMotorSpeed) / 2;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          RobotStatusCard(isRunning: widget.data.isRunning),
          const SizedBox(height: 16),
          SpeedCard(speed: averageSpeed, isRunning: widget.data.isRunning),
          const SizedBox(height: 16),
          DistanceCard(
            distance: widget.data.distanceFromObstacle,
            distanceHistory: _distanceHistory,
          ),
          const SizedBox(height: 16),
          TimeCard(seconds: widget.data.isRunning ? _calculateElapsedTime() : 0),
        ],
      ),
    );
  }

  // هنا بنحسب الوقت ببساطة، لو حابب تخزن التوقيت بدقة ممكن نخليها DateTime
  int _calculateElapsedTime() {
    // مجرد قيمة عشوائية، لكن تقدر تعدلها حسب الوقت الفعلي
    return DateTime.now().second + (DateTime.now().minute * 60);
  }
}