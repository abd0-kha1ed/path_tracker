import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:robotics_app/constant.dart';
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

  BluetoothConnection? robotConnection;

  @override
  void initState() {
    super.initState();
    connectToRobot();
  }

  // Connect to the robot and start receiving speed data
  Future<void> connectToRobot() async {
    try {
      // // Replace this with your robot's Bluetooth address
      // String robotAddress = hc05Address; // Example address
      // robotConnection = await BluetoothConnection.toAddress(robotAddress);
      // print("Connected to the robot");

      // Listen to the incoming data from the robot
      robotConnection!.input!.listen((data) {
        String message = String.fromCharCodes(data);

        // Split the incoming message assuming the format "distance,time"
        List<String> dataParts = message.split(",");
        if (dataParts.length == 2) {
          double distance = double.parse(dataParts[0]); // Distance in cm
          double time = double.parse(dataParts[1]); // Time in seconds

          // Calculate speed (speed = distance / time)
          double calculatedSpeed = distance / time; // Speed in cm/s
          updateSpeed(calculatedSpeed);
        }
      });

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
                  color: Colors.green, // Green color for 0 to 30 cm/s
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 30,
                  endValue: 60,
                  color: Colors.orange, // Orange color for 30 to 60 cm/s
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 60,
                  endValue: 70,
                  color:
                      Colors.deepOrange, // Deep orange color for 60 to 70 cm/s
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 70,
                  endValue: 100,
                  color: Colors.red, // Red color for 70 to 100 cm/s
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
          "${speed.toStringAsFixed(2)} cm/s", // Display speed in cm/s
          style: const TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
