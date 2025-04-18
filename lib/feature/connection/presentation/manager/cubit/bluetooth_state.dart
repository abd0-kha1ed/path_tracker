part of 'bluetooth_cubit.dart';

abstract class BluetoothState {}

class BluetoothInitial extends BluetoothState {}

class BluetoothConnecting extends BluetoothState {}

class BluetoothConnected extends BluetoothState {
  final BluetoothDevice device;
  BluetoothConnected(this.device);
}

class BluetoothError extends BluetoothState {
  final String message;
  BluetoothError(this.message);
}
