import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_app/core/helper/on_generate_routes.dart';
import 'package:robotics_app/feature/connection/presentation/manager/cubit/bluetooth_cubit.dart';
import 'package:robotics_app/feature/data/presentation/manger/cubit/robot_data_cubit.dart';
import 'package:robotics_app/feature/data/presentation/views/data_view.dart';

void main() {
  runApp(RoboticsApp());
  
}

class RoboticsApp extends StatelessWidget {
  const RoboticsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BluetoothCubit()),
        BlocProvider(create: (_) => RobotDataCubit()), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: DataView.routeName,
        onGenerateRoute: onGenerateRoutes,
      ),
    );
  }
}
