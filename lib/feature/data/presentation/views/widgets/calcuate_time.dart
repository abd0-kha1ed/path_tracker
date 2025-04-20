import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting date and time

class TimeTrackingPage extends StatefulWidget {
  const TimeTrackingPage({Key? key}) : super(key: key);

  @override
  _TimeTrackingPageState createState() => _TimeTrackingPageState();
}

class _TimeTrackingPageState extends State<TimeTrackingPage> {
  DateTime? startTime;
  DateTime? stopTime;
  Duration duration = Duration.zero;

  bool isRobotMoving = true;

  // Start tracking time when robot starts moving
  void startRobotMovement() {
    setState(() {
      startTime = DateTime.now(); // Capture start time
      isRobotMoving = true;
    });
  }

  // Stop the robot and capture stop time
  void stopRobotMovement() {
    setState(() {
      stopTime = DateTime.now(); // Capture stop time
      duration = stopTime!.difference(startTime!); // Calculate duration
      isRobotMoving = false; // Mark robot as stopped
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Tracking"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display start and stop time with duration
            if (isRobotMoving)
              Text(
                "Robot is Moving\nStarted at: ${DateFormat('hh:mm:ss a').format(startTime!)}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            if (!isRobotMoving && stopTime != null)
              Column(
                children: [
                  Text(
                    "Stopped at: ${DateFormat('hh:mm:ss a').format(stopTime!)}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Duration: ${duration.inSeconds} seconds",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: isRobotMoving ? stopRobotMovement : startRobotMovement,
              child: Text(isRobotMoving ? "Stop Robot" : "Start Robot"),
            ),
          ],
        ),
      ),
    );
  }
}
