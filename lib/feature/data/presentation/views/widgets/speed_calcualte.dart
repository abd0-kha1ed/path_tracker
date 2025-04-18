import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedometerPage extends StatefulWidget {
  const SpeedometerPage({Key? key}) : super(key: key);

  @override
  _SpeedometerPageState createState() => _SpeedometerPageState();
}

class _SpeedometerPageState extends State<SpeedometerPage> {
  double speed = 0.0; // Default speed is 0
  BluetoothConnection? connection;
  bool isRobotMoving = false;

  // Simulate Bluetooth connection and data reading
  BluetoothConnection? robotConnection;

  @override
  void initState() {
    super.initState();
    connectToRobot();
  }

  // Simulate Bluetooth connection and getting real-time speed data
  Future<void> connectToRobot() async {
    try {
      // Replace this with your robot's Bluetooth address
      String robotAddress = "00:14:06:16:8A:69"; // Example address
      robotConnection = await BluetoothConnection.toAddress(robotAddress);
      print("Connected to the robot");

      // Listen to the incoming data from the robot
      robotConnection!.input!.listen((data) {
        String message = String.fromCharCodes(data);
        double newSpeed =
            double.parse(message); // Assuming robot sends speed as a string
        updateSpeed(newSpeed);
      });

      // Mark the robot as moving after connection
      setState(() {
        isRobotMoving = true;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  // Update speed on the UI
  void updateSpeed(double newSpeed) {
    setState(() {
      speed = newSpeed; // Update the speed with the real data from the robot
    });
  }

  @override
  void dispose() {
    robotConnection
        ?.dispose(); // Close the connection when the page is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Radial Gauge using syncfusion_flutter_gauges
        SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum:
                  100, // Adjust the max speed according to your robot's speed range
              interval: 10,
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: speed,
                  needleColor: Colors.black, // Needle color set to black
                  needleLength: 0.75,
                  needleStartWidth: 2,
                  needleEndWidth: 7,
                  tailStyle: TailStyle(length: 0.15),
                ),
              ],
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: 30,
                  color: Colors.green, // White color range for 0 to 50
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 30,
                  endValue: 60,
                  color: Colors.orange, // White color range for 50 to 80
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 60,
                  endValue: 70,
                  color: Colors.deepOrange, // White color range for 50 to 80
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 70,
                  endValue: 100,
                  color: Colors.red, // White color range for 80 to 100
                  startWidth: 10,
                  endWidth: 10,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Display the current speed below the gauge
        Text(
          "${speed.toStringAsFixed(2)} cm/s",
          style: const TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
