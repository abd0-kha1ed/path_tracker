
class ControlState {
  final bool isRobotRunning;
  final bool isConnected;

  const ControlState({
    required this.isRobotRunning,
    required this.isConnected,
  });

  ControlState copyWith({
    bool? isRobotRunning,
    bool? isConnected,
  }) {
    return ControlState(
      isRobotRunning: isRobotRunning ?? this.isRobotRunning,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}
