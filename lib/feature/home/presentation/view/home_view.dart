import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:robotics_app/core/utils/widgets/custom_app_bar.dart';
import 'package:robotics_app/feature/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/homePage';
  const HomeView({super.key});

  @override
Widget build(BuildContext context) {
  final args = ModalRoute.of(context)?.settings.arguments;

  if (args == null || args is! BluetoothConnection) {
    return const Scaffold(
      body: Center(
        child: Text(
          "❌ No Bluetooth connection provided.",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  final BluetoothConnection connection = args;

  return Scaffold(
    appBar: CustomAppBar(text: 'Home', icon: Icons.home),
    body: HomeViewBody(connection: connection),
  );
}
}
