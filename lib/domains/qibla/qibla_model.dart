class QiblaResponse {
  QiblaResponse({required this.bearing});

  factory QiblaResponse.fromJson(Map<String, dynamic> json) {
    final bearing = json['bearing'];
    if (bearing is! num) {
      throw const FormatException('Bearing kiblat tidak valid');
    }

    return QiblaResponse(
      bearing: bearing.toDouble(),
    );
  }

  final double bearing;
}
