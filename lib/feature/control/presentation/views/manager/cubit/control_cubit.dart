import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'control_state.dart';

class ControlCubit extends Cubit<ControlState> {
  final BluetoothConnection connection;

  ControlCubit(this.connection)
      : super(const ControlState(
          isRobotRunning: false,
          isConnected: true,
        ));

  void _sendCommand(String command) {
    try {
      connection.output.add(Uint8List.fromList(utf8.encode(command)));
      connection.output.allSent;
      print("Command sent: $command");
    } catch (e) {
      print("Failed to send command: $e");
    }
  }

  void startRobot() {
    _sendCommand("START\n");
    emit(state.copyWith(isRobotRunning: true));
  }
}
