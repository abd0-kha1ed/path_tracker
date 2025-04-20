import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:robotics_app/constant.dart';
import 'package:robotics_app/feature/data/presentation/manger/cubit/robot_data_cubit.dart';

part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothState> {
  BluetoothConnection? _connection;

  BluetoothCubit() : super(BluetoothInitial());

  Future<void> connectToRobot(BuildContext context) async {
  await requestBluetoothPermissions();

  emit(BluetoothConnecting());
  print("Trying to connect to $hc05Address...");

  try {
    _connection = await BluetoothConnection.toAddress(hc05Address);
    print("Connected to ${_connection!.isConnected}");

    // ✅ Emit connection state
    emit(BluetoothConnected(
      BluetoothDevice(address: hc05Address, name: "HC-05"),
    ));

    // ✅ Start listening to robot data
    _connection!.input!.listen((data) {
      final message = String.fromCharCodes(data).trim();
      print("📩 Data Received: $message");

      context.read<RobotDataCubit>().updateFromRaw(message);
    });
  } catch (e) {
    print("Connection failed: $e");
    emit(BluetoothError("Connection failed: ${e.toString()}"));
  }
}


  BluetoothConnection? get connection => _connection;

  void disposeConnection() {
    _connection?.dispose();
    _connection = null;
    emit(BluetoothInitial());
  }

  Future<void> requestBluetoothPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
      Permission.location,
    ].request();

    if (statuses.values.any((status) => status.isPermanentlyDenied)) {
      openAppSettings();
    }
  }
}
