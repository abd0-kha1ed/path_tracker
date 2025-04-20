import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:robotics_app/core/utils/widgets/custom_app_bar.dart';
import 'package:robotics_app/feature/control/presentation/views/manager/cubit/control_cubit.dart';
import 'package:robotics_app/feature/control/presentation/views/widget/control_view_body.dart';

class ControlView extends StatelessWidget {
  static const routeName = '/controlPage';
  const ControlView({super.key});
  @override
  Widget build(BuildContext context) {
    final BluetoothConnection connection =
        ModalRoute.of(context)!.settings.arguments as BluetoothConnection;
    return Scaffold(
      appBar: CustomAppBar(
          icon: Icons.gamepad_sharp,
          text: 'control',
          automaticallyImplyLeading: true),
      body: BlocProvider(
        create: (context) => ControlCubit(connection),
        child: const ControlViewBody(),
      ),
    );
  }
}
