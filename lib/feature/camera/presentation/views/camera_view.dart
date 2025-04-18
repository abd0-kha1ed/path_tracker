import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  static const routeName = '/cameraPage';
  const CameraView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
    );
  }
}
