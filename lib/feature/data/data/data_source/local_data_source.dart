import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class LocalDataSource {
  // Simulate calculating speed from distance and time
  double calculateSpeed({required double distance, required double time}) {
    if (time == 0) {
      throw Exception("Time cannot be zero");
    }
    return distance / time; // Speed = distance / time
  }

  // Simulate calculating distance from speed and time
  double calculateDistance({required double speed, required double time}) {
    return speed * time; // Distance = speed * time
  }

  // Simulate calculating time from distance and speed
  double calculateTime({required double distance, required double speed}) {
    if (speed == 0) {
      throw Exception("Speed cannot be zero");
    }
    return distance / speed; // Time = distance / speed
  }

  // Simulate calculating obstacles (affecting distance)
  double calculateObstacles(
      {required double distance, required double obstacleFactor}) {
    if (obstacleFactor < 0 || obstacleFactor > 1) {
      throw Exception("Obstacle factor should be between 0 and 1");
    }
    return distance * obstacleFactor; // Obstacles affect distance
  }

  // Handle Bluetooth data to calculate speed, distance, time, and obstacles
  void processBluetoothData(
      BluetoothConnection connection, Function(double) onSpeedUpdated) {
    connection.input!.listen((data) {
      String message = String.fromCharCodes(data);

      // Split the incoming message assuming the format "distance,time"
      List<String> dataParts = message.split(",");
      if (dataParts.length == 2) {
        try {
          double distance = double.parse(dataParts[0]); // Distance in cm
          double time = double.parse(dataParts[1]); // Time in seconds

          // Calculate speed (speed = distance / time)
          double calculatedSpeed =
              calculateSpeed(distance: distance, time: time);

          // Call the callback function to update speed in the UI
          onSpeedUpdated(calculatedSpeed);
        } catch (e) {
          print("Error parsing Bluetooth data: $e");
        }
      }
    });
  }
}
