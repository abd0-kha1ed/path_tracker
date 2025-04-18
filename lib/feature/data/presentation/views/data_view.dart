import 'package:flutter/material.dart';
import 'package:robotics_app/feature/data/presentation/views/widgets/speed_calcualte.dart';

class DataView extends StatelessWidget {
  static const routeName = '/dataPage';
  const DataView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data'),
        ),
        body: SpeedometerPage());
  }
}
