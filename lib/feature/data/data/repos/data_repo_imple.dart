import 'package:robotics_app/feature/data/data/data_source/local_data_source.dart';
import 'package:robotics_app/feature/data/domain/repos/data_repo.dart';

class DataRepoImple implements DataRepo {
  late final LocalDataSource localDataSource;
  @override
  double calcuteDistance({required double speed, required double time}) {
    return localDataSource.calculateDistance(speed: speed, time: time);
  }

  @override
  double calcuteObstacles(
      {required double distance, required double obstacleFactor}) {
    return localDataSource.calculateObstacles(
        distance: distance, obstacleFactor: obstacleFactor);
  }

  @override
  double calcuteSpeed({required double distance, required double time}) {
    return localDataSource.calculateSpeed(distance: distance, time: time);
  }

  @override
  double calcuteTime({required double distance, required double speed}) {
    return localDataSource.calculateTime(distance: distance, speed: speed);
  }

  @override
  void connectToRobot() {}

  @override
  void disconnectFromRobot() {}
}
