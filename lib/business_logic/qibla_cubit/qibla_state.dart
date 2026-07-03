abstract class QiblaState {}

class QiblaInitial extends QiblaState {}

class QiblaLoading extends QiblaState {}

class QiblaLoaded extends QiblaState {
  QiblaLoaded({
    required this.heading,
    required this.qiblaDirection,
    required this.isFacingQibla,
  });

  final double heading;
  final double qiblaDirection;
  final bool isFacingQibla;
}

class QiblaError extends QiblaState {
  QiblaError(this.message);

  final String message;
}
