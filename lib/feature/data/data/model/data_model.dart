class DataModel {
  final double distanceFromObstacle;
  final double speed;
  final double timeToGoal;
  final bool isRunning;
  final bool isReversing;
  final bool isFinished;

  DataModel({
    required this.distanceFromObstacle,
    required this.speed,
    required this.timeToGoal,
    required this.isRunning,
    required this.isReversing,
    required this.isFinished,
  });

  factory DataModel.fromRawString(String raw) {
    final lines = raw.trim().split('\n');
    double distance = 0;
    double speed = 0;
    double time = 0;
    bool running = false;
    bool reversing = false;
    bool finished = false;

    for (var line in lines) {
      line = line.trim();

      if (line.startsWith('Distance')) {
        distance = double.tryParse(line.split('=').last.trim()) ?? 0;
      } else if (line.startsWith('Speed')) {
        speed = double.tryParse(line.split('=').last.trim()) ?? 0;
      } else if (line.startsWith('Time to Goal')) {
        time = double.tryParse(line.split('=').last.trim()) ?? 0;
      } else if (line.contains('Robot Started')) {
        running = true;
      } else if (line.contains('End Reached')) {
        reversing = true;
      } else if (line.contains('Reverse Complete')) {
        finished = true;
      }
    }

    return DataModel(
      distanceFromObstacle: distance,
      speed: speed,
      timeToGoal: time,
      isRunning: running,
      isReversing: reversing,
      isFinished: finished,
    );
  }
}
