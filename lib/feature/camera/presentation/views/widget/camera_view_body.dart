import 'package:flutter/material.dart';

class CameraViewBody extends StatelessWidget {
  const CameraViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.videocam_off, size: 90, color: Colors.grey.shade700),
            const SizedBox(height: 24),
            Text(
              "Camera Not Available",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "This feature is under development.\nWe'll be adding camera support very soon!",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Back"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blueGrey,
                side: const BorderSide(color: Colors.blueGrey),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
