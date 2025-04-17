import 'package:flutter/material.dart';
import 'package:robotics_app/feature/connection/presentation/view/widget/connection_view_body.dart';

class ConnectionView extends StatelessWidget {
  const ConnectionView({super.key});
  static const String routeName = '/connection_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectScreen(),
    );
  }
}
