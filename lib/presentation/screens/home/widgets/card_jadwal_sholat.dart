import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';

class _Assets {
  const _Assets._();

  static const String subuhIllustration = AppIcons.jadwalSholatSubuhCapa1;
  static const String subuhVectorL = AppIcons.jadwalSholatSubuhVector1;
  static const String subuhVectorR = AppIcons.jadwalSholatSubuhVector;

  static const String terbitIllustration = AppIcons.jadwalSholatTerbitCapa1;
  static const String terbitVectorL = AppIcons.jadwalSholatTerbitVector;
  static const String terbitVectorR = AppIcons.jadwalSholatTerbitVector1;

  static const String maghribIllustration = AppIcons.jadwalSholatMaghribFlat;
  static const String maghribVectorL = AppIcons.jadwalSholatMaghribVector;
  static const String maghribVectorR = AppIcons.jadwalSholatMaghribVector1;

  static const String isyaIllustration = AppIcons.jadwalSholatIsyaFrame;
  static const String isyaVectorL = AppIcons.jadwalSholatIsyaVector;
  static const String isyaVectorR = AppIcons.jadwalSholatIsyaVector1;
}

class StateGradient {
  const StateGradient({
    required this.colors,
    required this.stops,
  });

  final List<Color> colors;
  final List<double> stops;

  LinearGradient toLinearGradient() => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: colors,
        stops: stops,
      );
}

enum WaktuSholat {
  subuh(
    label: 'Subuh',
    hour: 4,
    minute: 35,
    gradient: StateGradient(
      colors: [
        Color(0xFF2979FF),
        Color(0xFF4FC3F7),
        Color(0xFFE0F7FA),
      ],
      stops: [0.0, 0.56, 1.0],
    ),
    illustration: _Assets.subuhIllustration,
    illustrationRight: 0,
    illustrationTop: 5,
    illustrationSize: 175,
    vectorL: _Assets.subuhVectorL,
    vectorLT: Offset(164, 103),
    vectorLSize: 209,
    vectorR: _Assets.subuhVectorR,
    vectorRT: Offset(260, -8),
    vectorRSize: 209,
  ),
  terbit(
    label: 'Terbit',
    hour: 5,
    minute: 45,
    gradient: StateGradient(
      colors: [
        Color(0xFF1A1C4B),
        Color(0xFF554994),
        Color(0xFFFF8D59),
      ],
      stops: [0.0, 0.55, 1.0],
    ),
    illustration: _Assets.terbitIllustration,
    illustrationRight: 0,
    illustrationTop: 79,
    illustrationSize: 175,
    vectorL: _Assets.terbitVectorL,
    vectorLT: Offset(-16, 124),
    vectorLSize: 209,
    vectorR: _Assets.terbitVectorR,
    vectorRT: Offset(292, -31),
    vectorRSize: 209,
  ),
  dzuhur(
    label: 'Dzuhur',
    hour: 11,
    minute: 53,
    gradient: StateGradient(
      colors: [
        Color(0xFF2979FF),
        Color(0xFF4FC3F7),
        Color(0xFFE0F7FA),
      ],
      stops: [0.0, 0.56, 1.0],
    ),
    illustration: _Assets.subuhIllustration,
    illustrationRight: 0,
    illustrationTop: 5,
    illustrationSize: 175,
    vectorL: _Assets.subuhVectorL,
    vectorLT: Offset(164, 103),
    vectorLSize: 209,
    vectorR: _Assets.subuhVectorR,
    vectorRT: Offset(260, -8),
    vectorRSize: 209,
  ),
  ashar(
    label: 'Ashar',
    hour: 15,
    minute: 15,
    gradient: StateGradient(
      colors: [
        Color(0xFF2979FF),
        Color(0xFF4FC3F7),
        Color(0xFFE0F7FA),
      ],
      stops: [0.0, 0.56, 1.0],
    ),
    illustration: _Assets.subuhIllustration,
    illustrationRight: 0,
    illustrationTop: 5,
    illustrationSize: 175,
    vectorL: _Assets.subuhVectorL,
    vectorLT: Offset(164, 103),
    vectorLSize: 209,
    vectorR: _Assets.subuhVectorR,
    vectorRT: Offset(260, -8),
    vectorRSize: 209,
  ),
  maghrib(
    label: 'Maghrib',
    hour: 17,
    minute: 55,
    gradient: StateGradient(
      colors: [
        Color(0xFF4A148C),
        Color(0xFF880E4F),
        Color(0xFFFF7043),
      ],
      stops: [0.14, 0.68, 1.0],
    ),
    illustration: _Assets.maghribIllustration,
    illustrationRight: -20,
    illustrationTop: 91,
    illustrationSize: 253,
    vectorL: _Assets.maghribVectorL,
    vectorLT: Offset(114, 114),
    vectorLSize: 209,
    vectorR: _Assets.maghribVectorR,
    vectorRT: Offset(263, 39),
    vectorRSize: 209,
  ),
  isya(
    label: 'Isya',
    hour: 18,
    minute: 55,
    gradient: StateGradient(
      colors: [
        Color(0xFF09101A),
        Color(0xFF16263B),
        Color(0xFF2C465E),
      ],
      stops: [0.13, 0.23, 0.58],
    ),
    illustration: _Assets.isyaIllustration,
    illustrationRight: 17,
    illustrationTop: 17,
    illustrationSize: 151,
    vectorL: _Assets.isyaVectorL,
    vectorLT: Offset(-106, 104),
    vectorLSize: 209,
    vectorR: _Assets.isyaVectorR,
    vectorRT: Offset(313, -11),
    vectorRSize: 209,
  );

  const WaktuSholat({
    required this.label,
    required this.hour,
    required this.minute,
    required this.gradient,
    required this.illustration,
    required this.illustrationRight,
    required this.illustrationTop,
    required this.illustrationSize,
    required this.vectorL,
    required this.vectorLT,
    required this.vectorLSize,
    required this.vectorR,
    required this.vectorRT,
    required this.vectorRSize,
  });

  final String label;
  final int hour;
  final int minute;
  final StateGradient gradient;
  final String illustration;
  final double illustrationRight;
  final double illustrationTop;
  final double illustrationSize;
  final String vectorL;
  final Offset vectorLT;
  final double vectorLSize;
  final String vectorR;
  final Offset vectorRT;
  final double vectorRSize;

  String get time {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return '$h : $m';
  }

  DateTime dateTimeOn(DateTime date) {
    return DateTime(date.year, date.month, date.day, hour, minute);
  }
}

class CardJadwalSholat extends StatefulWidget {
  const CardJadwalSholat({super.key});

  @override
  State<CardJadwalSholat> createState() => _CardJadwalSholatState();
}

class _CardJadwalSholatState extends State<CardJadwalSholat> {
  late DateTime _now;
  late _NextPrayer _nextPrayer;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _nextPrayer = _resolveNextPrayer(_now);
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (!mounted) return;
      setState(() {
        _now = DateTime.now();
        _nextPrayer = _resolveNextPrayer(_now);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _NextPrayer _resolveNextPrayer(DateTime now) {
    for (final prayer in WaktuSholat.values) {
      final schedule = prayer.dateTimeOn(now);
      if (schedule.isAfter(now)) {
        return _NextPrayer(prayer: prayer, schedule: schedule);
      }
    }

    final tomorrow = now.add(const Duration(days: 1));
    final subuhTomorrow = WaktuSholat.subuh.dateTimeOn(tomorrow);
    return _NextPrayer(prayer: WaktuSholat.subuh, schedule: subuhTomorrow);
  }

  String _countdownText() {
    final remaining = _nextPrayer.schedule.difference(_now);
    if (!remaining.isNegative && remaining.inSeconds <= 0) return 'Sekarang';
    if (remaining.isNegative) return 'Sekarang';

    final totalMinutes = (remaining.inSeconds / 60).ceil();
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    if (hours > 0 && minutes > 0) {
      return 'Dalam $hours Jam $minutes Menit';
    }

    if (hours > 0) return 'Dalam $hours Jam';
    return 'Dalam $minutes Menit';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final w = _nextPrayer.prayer;

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      height: 184,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: w.gradient.toLinearGradient(),
        boxShadow: [
          BoxShadow(
            color: ColorPalette.kBlack.withValues(alpha: 0.08),
            blurRadius: 32,
          ),
          BoxShadow(
            color: ColorPalette.kBlack.withValues(alpha: 0.07),
            blurRadius: 16,
          ),
          BoxShadow(
            color: ColorPalette.kBlack.withValues(alpha: 0.04),
            blurRadius: 5,
          ),
          BoxShadow(
            color: ColorPalette.kBlack.withValues(alpha: 0.01),
            blurRadius: 6,
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xA3000000), Color(0x00666666)],
                ),
              ),
            ),
          ),
          Positioned(
            left: w.vectorLT.dx,
            top: w.vectorLT.dy,
            child: SvgPicture.asset(
              w.vectorL,
              width: w.vectorLSize,
            ),
          ),
          Positioned(
            left: w.vectorRT.dx,
            top: w.vectorRT.dy,
            child: SvgPicture.asset(
              w.vectorR,
              width: w.vectorRSize,
            ),
          ),
          Positioned(
            right: w.illustrationRight,
            top: w.illustrationTop,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 700),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              transitionBuilder: (child, animation) {
                final offset = Tween<Offset>(
                  begin: const Offset(0, 0.16),
                  end: Offset.zero,
                ).animate(animation);

                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: offset,
                    child: child,
                  ),
                );
              },
              child: SvgPicture.asset(
                w.illustration,
                key: ValueKey(w),
                width: w.illustrationSize,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Berikutnya',
                  style: textTheme.bodySmall?.copyWith(
                    color: ColorPalette.kWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      w.label,
                      style: textTheme.titleLarge?.copyWith(
                        color: ColorPalette.kWhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      AppIcons.arrowRightLine,
                      width: 24,
                      colorFilter: const ColorFilter.mode(
                        ColorPalette.kWhite,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                Text(
                  w.time,
                  style: textTheme.displayLarge?.copyWith(
                    color: ColorPalette.kWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 48,
                    height: 1,
                  ),
                ),
                const Spacer(),
                _CountdownPill(
                  textTheme: textTheme,
                  text: _countdownText(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NextPrayer {
  const _NextPrayer({required this.prayer, required this.schedule});

  final WaktuSholat prayer;
  final DateTime schedule;
}

class _CountdownPill extends StatelessWidget {
  const _CountdownPill({
    required this.textTheme,
    required this.text,
  });

  final TextTheme textTheme;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: ColorPalette.kWhite.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        text,
        style: textTheme.bodySmall?.copyWith(
          fontSize: 10,
          color: ColorPalette.contentSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
