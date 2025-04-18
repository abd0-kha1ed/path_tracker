import 'package:flutter/material.dart';

class ControlView extends StatelessWidget {
  static const routeName = '/controlPage';
  const ControlView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control'),
      ),
    );
  }
}
