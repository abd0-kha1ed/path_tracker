import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_app/core/utils/widgets/custom_app_bar.dart';
import 'package:robotics_app/feature/data/presentation/manger/cubit/robot_data_state.dart';
import 'package:robotics_app/feature/data/presentation/views/widgets/data_view_body.dart';
import '../manger/cubit/robot_data_cubit.dart';

class DataView extends StatelessWidget {
  static const routeName = '/dataPage';
  const DataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Data',
        icon: Icons.bar_chart,
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<RobotDataCubit, RobotDataState>(
        builder: (context, state) {
          if (state is RobotDataUpdated) {
            return DataViewBody(data: state.data);
          } else if (state is RobotDataInitial) {
            return const Center(child: Text("Waiting for data..."));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
