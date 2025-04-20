import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robotics_app/feature/data/data/model/data_model.dart';
import 'package:robotics_app/feature/data/domain/use_case/data_use_case.dart';
import 'package:robotics_app/feature/data/presentation/manger/cubit/data_state.dart'; // Import the RobotUseCase

class DataCubit extends Cubit<DataState> {
  final RobotUseCase robotUseCase;

  DataCubit(this.robotUseCase) : super(DataInitial());

  // Calculate Speed
  Future<void> calculateSpeed({
    required double distance,
    required double time,
  }) async {
    try {
      emit(DataLoading());

      // Use the use case to calculate speed
      final result = await robotUseCase.startRobot(
        distance: distance,
        speed:
            time, // Passing speed as time parameter (revisit based on your logic)
        obstacleFactor:
            0.0, // Set to 0 as speed calculation doesn't need obstacles
      );

      result.fold(
        (failure) => emit(DataError(failure.message)),
        (data) => emit(DataLoaded(
          dataModel: DataModel(
              distance: data.distance,
              speed: data.speed,
              time: time,
              obstacle: data.obstacle),
        )),
      );
    } catch (e) {
      emit(DataError("Error calculating speed: ${e.toString()}"));
    }
  }

  // Calculate Distance
  Future<void> calculateDistance({
    required double speed,
    required double time,
  }) async {
    try {
      emit(DataLoading());

      // Use the use case to calculate distance
      final result = await robotUseCase.startRobot(
        distance:
            time, // Passing time as distance parameter (revisit based on your logic)
        speed: speed,
        obstacleFactor:
            0.0, // Set to 0 as distance calculation doesn't need obstacles
      );

      result.fold(
        (failure) => emit(DataError(failure.message)),
        (data) => emit(DataLoaded(
          dataModel: DataModel(
              distance: data.distance,
              speed: speed,
              time: time,
              obstacle: data.obstacle),
        )),
      );
    } catch (e) {
      emit(DataError("Error calculating distance: ${e.toString()}"));
    }
  }

  // Calculate Time
  Future<void> calculateTime({
    required double distance,
    required double speed,
  }) async {
    try {
      emit(DataLoading());

      // Use the use case to calculate time
      final result = await robotUseCase.startRobot(
        distance: distance,
        speed: speed,
        obstacleFactor:
            0.0, // Set to 0 as time calculation doesn't need obstacles
      );

      result.fold(
        (failure) => emit(DataError(failure.message)),
        (data) => emit(DataLoaded(
          dataModel: DataModel(
              distance: distance,
              speed: speed,
              time: data.time,
              obstacle: data.obstacle),
        )),
      );
    } catch (e) {
      emit(DataError("Error calculating time: ${e.toString()}"));
    }
  }

  // Calculate Obstacles
  Future<void> calculateObstacles({
    required double distance,
    required double obstacleFactor,
  }) async {
    try {
      emit(DataLoading());

      // Use the use case to calculate obstacles
      final result = await robotUseCase.startRobot(
        distance: distance,
        speed: 0.0, // Set to 0 as no speed is needed for obstacles calculation
        obstacleFactor: obstacleFactor,
      );

      result.fold(
        (failure) => emit(DataError(failure.message)),
        (data) => emit(DataLoaded(
          dataModel: DataModel(
              distance: distance,
              speed: data.speed,
              time: data.time,
              obstacle: data.obstacle),
        )),
      );
    } catch (e) {
      emit(DataError("Error calculating obstacles: ${e.toString()}"));
    }
  }
}
