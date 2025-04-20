import 'package:robotics_app/feature/data/data/model/data_model.dart';

abstract class RobotDataState {}

class RobotDataInitial extends RobotDataState {}

class RobotDataUpdated extends RobotDataState {
  final DataModel data;
  RobotDataUpdated(this.data);
}

