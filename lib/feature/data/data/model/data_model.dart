class DataModel {
  final double distanceFromObstacle;
  final int leftMotorSpeed;
  final int rightMotorSpeed;
  final bool isRunning;

  DataModel({
    required this.distanceFromObstacle,
    required this.leftMotorSpeed,
    required this.rightMotorSpeed,
    required this.isRunning,
  });

  factory DataModel.fromRawString(String raw) {
    // Example raw:
    // Distance =25
    // Speed on L.M =160
    // Speed on R.M =165
    // Robot Started / Stopped

    final lines = raw.trim().split('\n');
    double distance = 0;
    int leftSpeed = 0;
    int rightSpeed = 0;
    bool running = false;

    for (var line in lines) {
      line = line.trim();
      if (line.startsWith('Distance')) {
        distance = double.tryParse(line.split('=').last.trim()) ?? 0;
      } else if (line.startsWith('Speed on L.M')) {
        leftSpeed = int.tryParse(line.split('=').last.trim()) ?? 0;
      } else if (line.startsWith('Speed on R.M')) {
        rightSpeed = int.tryParse(line.split('=').last.trim()) ?? 0;
      } else if (line.contains('Robot Started')) {
        running = true;
      } else if (line.contains('Robot Stopped')) {
        running = false;
      }
    }

    return DataModel(
      distanceFromObstacle: distance,
      leftMotorSpeed: leftSpeed,
      rightMotorSpeed: rightSpeed,
      isRunning: running,
    );
  }
}
