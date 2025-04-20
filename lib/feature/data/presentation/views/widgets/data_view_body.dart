import 'package:flutter/material.dart';
import 'package:robotics_app/feature/data/data/model/data_model.dart';
import 'package:robotics_app/feature/data/presentation/views/widgets/speed_card.dart';

class DataViewBody extends StatelessWidget {
  final DataModel data;

  const DataViewBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SpeedCard(speed: 30, isRunning: true)],
    );
  }
}
