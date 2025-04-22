import 'package:flutter/material.dart';
import 'package:robotics_app/feature/camera/presentation/views/widget/camera_view_body.dart';

class CameraView extends StatelessWidget {
  static const routeName = '/cameraPage';
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: CameraViewBody(),
    );
  }
}

