import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_app/feature/connection/presentation/view/widget/connection_view_body.dart';

import '../manager/cubit/bluetooth_cubit.dart';

class BluetoothConnectionView extends StatelessWidget {
  const BluetoothConnectionView({super.key});
  static const String routeName = '/connection_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: ConnectionViewBody(),
=======
      appBar: AppBar(
        title: const Text("Connect to Robot"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider(
        create: (context) => BluetoothCubit(),
        child: BluetoothConnectViewBody(),
      ),
>>>>>>> 2e07e575b852caa9aed3d6ab50afbc2f923c24be
    );
  }
}
