import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_app/feature/control/presentation/views/widget/status_indicator.dart';
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
              // 🟢 Connection + Robot Status
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

              // 🔘 Start / Stop Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<ControlCubit>().startRobot();
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text("Start"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<ControlCubit>().stopRobot();
                    },
                    icon: const Icon(Icons.stop),
                    label: const Text("Stop"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 🔁 Reverse Navigation
              ElevatedButton.icon(
                onPressed: () {
                  context.read<ControlCubit>().reverseRobot();
                },
                icon: const Icon(Icons.loop),
                label: const Text("Reverse Navigation"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

