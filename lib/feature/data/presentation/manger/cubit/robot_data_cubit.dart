import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_app/feature/data/data/model/data_model.dart';
import 'package:robotics_app/feature/data/presentation/manger/cubit/robot_data_state.dart';

class RobotDataCubit extends Cubit<RobotDataState> {
  RobotDataCubit() : super(RobotDataInitial());

  void updateFromRaw(String raw) {
    final data = DataModel.fromRawString(raw);
    emit(RobotDataUpdated(data));
  }
}

