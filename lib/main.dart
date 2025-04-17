import 'package:flutter/material.dart';
import 'package:robotics_app/core/helper/on_generate_routes.dart';
import 'package:robotics_app/feature/spalsh/presentation/view/splash_view.dart';

void main() {
  runApp(RoboticsApp());
}

class RoboticsApp extends StatelessWidget {
  const RoboticsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      onGenerateRoute: onGenerateRoutes,
    );
  }
}
