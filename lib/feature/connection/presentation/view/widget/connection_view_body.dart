import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ConnectionViewBody extends StatefulWidget {
  const ConnectionViewBody({super.key});

  @override
  _ConnectionViewBodyState createState() => _ConnectionViewBodyState();
}

class _ConnectionViewBodyState extends State<ConnectionViewBody> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  BluetoothConnection? _connection;
  bool isConnecting = false;

  @override
  void initState() {
    super.initState();
    initBluetooth();
  }

  // Initialize Bluetooth
  void initBluetooth() async {
    _bluetoothState = await FlutterBluetoothSerial.instance.state;
    setState(() {});
  }

  // Simulate Bluetooth connection (using HC-05 sensor)
  Future<void> connect() async {
    setState(() {
      isConnecting = true;
    });

    try {
      // Find paired devices (You can specify the device here)
      List<BluetoothDevice> devices =
          await FlutterBluetoothSerial.instance.getBondedDevices();
      BluetoothDevice? targetDevice;

      // Search for your HC-05 device by name (you can replace this with the exact device name or address)
      for (var device in devices) {
        if (device.name == "HC-05") {
          targetDevice = device;
          break;
        }
      }

      if (targetDevice == null) {
        throw Exception("Bluetooth device not found");
      }

      // Try to establish a connection with the device
      await BluetoothConnection.toAddress(targetDevice.address)
          .then((connection) {
        _connection = connection;
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomePage()),
        // );
      });

      setState(() {
        isConnecting = false;
      });
    } catch (e) {
      setState(() {
        isConnecting = false;
      });
      showErrorDialog("Failed to connect: ${e.toString()}");
    }
  }

  // Show error dialog if Bluetooth fails to connect
  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Connection Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Bluetooth Control"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Tap to Connect",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: isConnecting
                  ? null
                  : connect, // Disable button when connecting
              child:
                  isConnecting ? CircularProgressIndicator() : Text("Connect"),
            ),
          ],
        ),
      ),
    );
  }
}
