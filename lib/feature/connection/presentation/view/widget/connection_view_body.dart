import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_app/feature/data/presentation/manger/cubit/robot_data_cubit.dart';
import 'package:robotics_app/feature/home/presentation/view/home_view.dart';
import '../../manager/cubit/bluetooth_cubit.dart';

class BluetoothConnectViewBody extends StatefulWidget {
  const BluetoothConnectViewBody({super.key});

  @override
  State<BluetoothConnectViewBody> createState() =>
      _BluetoothConnectViewBodyState();
}

class _BluetoothConnectViewBodyState extends State<BluetoothConnectViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _pulseController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _pulseController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _pulseController.forward();
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BluetoothCubit, BluetoothState>(
      builder: (context, state) {
        String displayText = "Press to connect";
        bool isConnecting = false;
        Color containerColor = Colors.blueAccent;

        if (state is BluetoothConnecting) {
          displayText = "Connecting...";
          isConnecting = true;
          containerColor = Colors.orangeAccent; // Chang color during connecting
          _pulseController.forward(); // Start pulse animation
        } else if (state is BluetoothConnected) {
  displayText = "Connected ";
  isConnecting = false;
  containerColor = Colors.greenAccent;
  _pulseController.stop();

  final connection = context.read<BluetoothCubit>().connection;
  final dataCubit = context.read<RobotDataCubit>();

  if (connection != null) {
    // ✅ اسمع البيانات من البلوتوث وسلمها لـ DataCubit
    connection.input!
  .transform(StreamTransformer<Uint8List, String>.fromBind(utf8.decoder.bind))
  .transform(const LineSplitter())
  .listen((rawData) {
    dataCubit.updateFromRaw(rawData);
  });


    // ✅ روح لصفحة Home بعد بدء الاستماع
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(
        context,
        HomeView.routeName,
        arguments: connection,
      );
    });
  }
}
 else if (state is BluetoothError) {
          displayText = "Connection Failed ";
          isConnecting = false;
          containerColor = Colors.redAccent; // Change color on error
          _pulseController.stop(); // Stop pulse animation
        } else {
          _pulseController.stop();
        }

        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  if (state is! BluetoothConnecting) {
                    context.read<BluetoothCubit>().connectToRobot(context);
                  }
                },
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: containerColor,
                      boxShadow: [
                        BoxShadow(
                          color: containerColor.withOpacity(0.4),
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        displayText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              if (state is BluetoothConnecting)
                const SizedBox(
                  width: 150,
                  child: LinearProgressIndicator(
                    color: Colors.blueAccent,
                    backgroundColor: Colors.blueGrey,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
