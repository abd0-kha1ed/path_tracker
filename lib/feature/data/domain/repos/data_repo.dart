abstract class DataRepo {
  // Simulate robot connection
  double calcuteDistance(
      {required double speed, required double time}); // Calculate distance
  double calcuteSpeed(
      {required double distance, required double time}); // Calculate speed
  double calcuteTime(
      {required double distance, required double speed}); // Calculate time
  double calcuteObstacles(
      {required double distance,
      required double obstacleFactor}); // Handle obstacles
  // Simulate disconnecting from robot
}
