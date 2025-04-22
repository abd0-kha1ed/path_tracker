import 'dart:convert';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:robotics_app/feature/data/presentation/manger/cubit/robot_data_cubit.dart';

void listenToBluetoothStream(BluetoothConnection connection, RobotDataCubit cubit) {
  final buffer = StringBuffer();

  utf8.decoder.bind(connection.input!).listen(
    (data) {
      buffer.write(data);

      if (data.contains('\n')) {
        final rawData = buffer.toString();
        buffer.clear();

        print("🔵 Raw Data Received:\n$rawData");

        cubit.updateFromRaw(rawData);
      }
    },
    onDone: () {
      print('📴 Bluetooth Disconnected');
    },
    onError: (error) {
      print('❌ Bluetooth Error: $error');
    },
    cancelOnError: true,
  );
}
