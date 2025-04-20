import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:robotics_app/core/utils/widgets/custom_app_bar.dart';
import 'package:robotics_app/feature/data/presentation/views/widgets/distance_calcuate.dart';

class DataView extends StatelessWidget {
  static const routeName = '/dataPage';
  const DataView({super.key});
  @override
  Widget build(BuildContext context) {
    final BluetoothConnection connection =
        ModalRoute.of(context)!.settings.arguments as BluetoothConnection;
    return Scaffold(
        appBar: CustomAppBar(text: 'Data', icon: Icons.bar_chart),
        body: DistanceCalcute());
  }
}
