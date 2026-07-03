import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double? _heading;
  double? _qiblaDirection;
  String _error = '';
  StreamSubscription<CompassEvent>? _compassSub;

  static const _kaabaLat = 21.4225;
  static const _kaabaLng = 39.8262;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      if (mounted) {
        setState(
          () => _error = 'Izin lokasi diperlukan untuk menghitung arah kiblat',
        );
      }
      return;
    }

    try {
      final position = await Geolocator.getCurrentPosition();
      final qibla = _calculateQiblaDirection(
        position.latitude,
        position.longitude,
      );
      if (mounted) setState(() => _qiblaDirection = qibla);
    } on Exception {
      if (mounted) {
        setState(() => _error = 'Gagal mendapatkan lokasi');
      }
    }

    final compass = FlutterCompass.events;
    if (compass == null) {
      if (mounted) setState(() => _error = 'Sensor kompas tidak tersedia');
      return;
    }

    _compassSub = compass.listen((event) {
      if (mounted) setState(() => _heading = event.heading ?? 0);
    });
  }

  double _calculateQiblaDirection(double lat, double lng) {
    final latRad = lat * pi / 180;
    final lngRad = lng * pi / 180;
    const kaabaLatRad = _kaabaLat * pi / 180;
    const kaabaLngRad = _kaabaLng * pi / 180;

    final dLng = kaabaLngRad - lngRad;
    final y = sin(dLng) * cos(kaabaLatRad);
    final x =
        cos(latRad) * sin(kaabaLatRad) -
        sin(latRad) * cos(kaabaLatRad) * cos(dLng);

    var bearing = atan2(y, x) * 180 / pi;
    if (bearing < 0) bearing += 360;
    return bearing;
  }

  @override
  Future<void> dispose() async {
    await _compassSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBackground,
      appBar: CustomAppBar.buildBackTitleAppBar(
        context: context,
        title: 'Kiblat',
      ),
      body: _error.isNotEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.explore_off_outlined,
                      size: 64,
                      color: ColorPalette.contentTertiary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _error,
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium?.copyWith(
                        color: ColorPalette.contentTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : _heading == null || _qiblaDirection == null
          ? const Center(
              child: CircularProgressIndicator(
                color: ColorPalette.primaryColor,
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 280,
                      height: 280,
                      child: CustomPaint(
                        painter: _QiblaCompassPainter(
                          heading: _heading!,
                          qiblaDirection: _qiblaDirection!,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: _DirectionInfo(
                    heading: _heading!,
                    qiblaDirection: _qiblaDirection!,
                  ),
                ),
              ],
            ),
    );
  }
}

class _QiblaCompassPainter extends CustomPainter {
  _QiblaCompassPainter({
    required this.heading,
    required this.qiblaDirection,
  });

  final double heading;
  final double qiblaDirection;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Outer ring
    final outerPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = ColorPalette.outlineVariant;
    canvas.drawCircle(center, radius, outerPaint);

    // Inner circle background
    final innerPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = ColorPalette.kWhite;
    canvas.drawCircle(center, radius - 8, innerPaint);

    // Degree markings
    final markPaint = Paint()
      ..strokeWidth = 1.5
      ..color = ColorPalette.contentSecondary;

    for (var i = 0; i < 360; i += 15) {
      final angle = (i - 90) * pi / 180;
      final isMajor = i % 90 == 0;
      final outerR = radius - 12;
      final innerR = isMajor ? radius - 30 : radius - 22;

      canvas.drawLine(
        Offset(
          center.dx + innerR * cos(angle),
          center.dy + innerR * sin(angle),
        ),
        Offset(
          center.dx + outerR * cos(angle),
          center.dy + outerR * sin(angle),
        ),
        markPaint,
      );
    }

    // Qibla arrow
    final qiblaAngle = ((qiblaDirection - heading) - 90) * pi / 180;
    final arrowLength = radius - 40;

    final arrowPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = ColorPalette.primaryColor;

    final arrowEnd = Offset(
      center.dx + arrowLength * cos(qiblaAngle),
      center.dy + arrowLength * sin(qiblaAngle),
    );

    final arrowPath = Path()
      ..moveTo(arrowEnd.dx, arrowEnd.dy)
      ..lineTo(
        center.dx + 12 * cos(qiblaAngle + pi / 2),
        center.dy + 12 * sin(qiblaAngle + pi / 2),
      )
      ..lineTo(
        center.dx + 12 * cos(qiblaAngle - pi / 2),
        center.dy + 12 * sin(qiblaAngle - pi / 2),
      )
      ..close();

    canvas.drawPath(arrowPath, arrowPaint);

    // Center dot
    final dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = ColorPalette.primaryColor;
    canvas.drawCircle(center, 6, dotPaint);

    // Ka'bah text
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'Ka\'bah',
        style: TextStyle(
          color: ColorPalette.primaryColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy + 14,
      ),
    );
  }

  @override
  bool shouldRepaint(_QiblaCompassPainter old) =>
      old.heading != heading || old.qiblaDirection != qiblaDirection;
}

class _DirectionInfo extends StatelessWidget {
  const _DirectionInfo({
    required this.heading,
    required this.qiblaDirection,
  });

  final double heading;
  final double qiblaDirection;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final diff = qiblaDirection - heading;
    final isLeft = diff < 0 || diff > 180;
    final direction = isLeft ? 'Belok ke kiri' : 'Belok ke kanan';
    final degree = qiblaDirection.toStringAsFixed(0);

    return Column(
      children: [
        Text(
          direction,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: ColorPalette.surfaceTertiary,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppIcons.compass3Line,
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  ColorPalette.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '$degree°',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
