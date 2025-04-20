import 'package:dartz/dartz.dart';
import 'package:robotics_app/feature/data/domain/entites/data_entity.dart';
import 'package:robotics_app/feature/data/domain/repos/data_repo.dart'; // Use Either for error handling

class RobotUseCase {
  final DataRepo dataRepo;

  RobotUseCase(this.dataRepo);

  //! Use case to start the robot, calculate distance, speed, time, and obstacles
  Future<Either<Failure, DataEntity>> startRobot(
      {required double distance,
      required double speed,
      required double obstacleFactor}) async {
    try {
      //! Calculate time using distance and speed
      double time = dataRepo.calcuteTime(distance: distance, speed: speed);

      //! Calculate obstacles based on obstacleFactor
      double obstacles = dataRepo.calcuteObstacles(
          distance: distance, obstacleFactor: obstacleFactor);

      //! Calculate the actual distance after obstacles
      double actualDistance =
          dataRepo.calcuteDistance(speed: speed, time: time);
      //! Return the result wrapped in DataEntity
      return Right(DataEntity(
          distance: actualDistance,
          speed: speed,
          time: time,
          obstacle: obstacles));
    } catch (e) {
      //! In case of any error, return the Failure
      return Left(Failure(e.toString()));
    }
  }
}

class Failure {
  final String message;
  Failure(this.message);
}

class RobotParams {
  final double distance;
  final double speed;
  final double obstacleFactor;

  RobotParams({
    required this.distance,
    required this.speed,
    required this.obstacleFactor,
  });
}
