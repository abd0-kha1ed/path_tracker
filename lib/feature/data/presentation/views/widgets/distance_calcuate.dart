import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart'; // Bluetooth package for communication
import 'dart:async';


class DistanceCalcute extends StatefulWidget {
  const DistanceCalcute({super.key});

  @override
  _DistanceCalcuteState createState() => _DistanceCalcuteState();
}

class _DistanceCalcuteState extends State<DistanceCalcute> {
  double speed =
      0.0; // Speed of robot in cm/s (updated by real data from the robot)
  double distance = 0.0; // Distance traveled in cm
  int timeElapsed = 0; // Time elapsed in seconds
  BluetoothConnection? connection; // Bluetooth connection

  Timer? _timer; // Timer to update distance every second

  @override
  void initState() {
    super.initState();
    connectToRobot(); // Initiate Bluetooth connection and receive speed data
  }

  // Function to connect to the robot and receive speed data (simulated Bluetooth)
  Future<void> connectToRobot() async {
    try {
      // String robotAddress =
      //     hc05Address; // Example Bluetooth address of the robot
      // connection = await BluetoothConnection.toAddress(robotAddress);
      // print("Connected to the robot");

      // Listen for incoming data from the robot (simulated speed data)
      connection!.input!.listen((data) {
        String message = String.fromCharCodes(data);
        double newSpeed = double.parse(
            message); // Assuming robot sends speed as a string (in cm/s)
        updateSpeed(newSpeed); // Update the speed with the received data
      });

      // Start updating the distance as the robot moves
      _startDistanceCalculation();
    } catch (e) {
      print("Error: $e");
    }
  }

  // Function to start calculating distance based on real-time speed
  void _startDistanceCalculation() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeElapsed++; // Increment time by 1 second
        distance =
            speed * timeElapsed; // Calculate distance: distance = speed * time
      });
    });
  }

  // Function to update speed from robot
  void updateSpeed(double newSpeed) {
    setState(() {
      speed = newSpeed; // Update the speed with real-time data from the robot
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Stop the timer when the page is disposed
    connection?.dispose(); // Dispose Bluetooth connection
    super.dispose();
  }

  // Function to format the distance nicely and display it in a digital-style format

  // Widget to display the digital-style odometer for distance
  Widget _buildDistanceBox(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4), // Shadow effect
          ),
        ],
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.teal, // Modern color
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDistanceBox("$distance CM"),
      ],
    );
  }
}
