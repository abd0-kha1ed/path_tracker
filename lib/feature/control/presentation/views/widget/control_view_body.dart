import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_app/feature/control/presentation/views/widget/status_indicator.dart';
import 'package:robotics_app/feature/data/presentation/views/data_view.dart';
import '../manager/cubit/control_cubit.dart';
import '../manager/cubit/control_state.dart';

class ControlViewBody extends StatelessWidget {
  const ControlViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlCubit, ControlState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ✅ Status Indicators - Styled
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatusIndicator(
                    label: "Bluetooth",
                    status: state.isConnected,
                  ),
                  StatusIndicator(
                    label: "Robot",
                    status: state.isRobotRunning,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // ▶ Start Button
              ElevatedButton.icon(
                onPressed: () {
                  context.read<ControlCubit>().startRobot();
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text("Start Robot"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 32),

              // 📊 Navigate to Data Page
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, DataView.routeName);
                },
                icon: const Icon(Icons.bar_chart),
                label: const Text("View Data"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}