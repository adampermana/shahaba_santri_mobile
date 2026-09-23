import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/widgets/card_jadwal_sholat.dart';

/// The 402px Figma scene, with the horizon aligned to the date section.
class PrayerLandscape extends StatelessWidget {
  const PrayerLandscape({required this.prayer, super.key});

  final WaktuSholat prayer;

  static double scaleFor(double width) {
    final baseScale = width / 402;
    if (width >= 600) {
      return baseScale.clamp(1.08, 1.18);
    }
    return baseScale.clamp(0.8, 1.08);
  }

  static double heightFor(double width) => 565 * scaleFor(width);

  @override
  Widget build(BuildContext context) {
    final isDay =
        prayer == WaktuSholat.dzuhur ||
        prayer == WaktuSholat.ashar ||
        prayer == WaktuSholat.subuh;
    final isMaghrib = prayer == WaktuSholat.maghrib;
    final isNight = prayer == WaktuSholat.isya;
    final celestial = switch (prayer) {
      WaktuSholat.maghrib => AppIcons.jadwalSholatSunMaghrib,
      WaktuSholat.terbit => AppIcons.jadwalSholatSunTerbitScene,
      WaktuSholat.isya => AppIcons.jadwalSholatMonthIsya,
      _ => AppIcons.jadwalSholatSunDzuhurScene,
    };
    final sea = switch (prayer) {
      WaktuSholat.maghrib => AppIcons.jadwalSholatSeaMaghribPng,
      WaktuSholat.isya => AppIcons.jadwalSholatSeaIsyaPng,
      WaktuSholat.terbit => AppIcons.jadwalSholatSeaAsharPng,
      _ => AppIcons.jadwalSholatSeaTerbitPng,
    };
    final sky = switch (prayer) {
      WaktuSholat.maghrib => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4A148C), Color(0xFF880E4F), Color(0xFFFF7043)],
        stops: [0, 0.39881, 0.79762],
      ),
      WaktuSholat.terbit => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A1C4B), Color(0xFF554994), Color(0xFFFF8D59)],
        stops: [0, 0.33598, 0.79157],
      ),
      WaktuSholat.isya => prayer.gradient.toLinearGradient(),
      _ => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2979FF), Color(0xFF4FC3F7), Color(0xFFE0F7FA)],
        stops: [0.12836, 0.23218, 0.59272],
      ),
    };
    final celestialSize = isNight
        ? 150.516
        : isMaghrib
        ? 215.0
        : isDay
        ? 184.0
        : 175.0;
    final celestialTop = isNight
        ? 236.0
        : isMaghrib
        ? 210.0
        : isDay
        ? 211.0
        : 220.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final scale = scaleFor(width);
        final sceneWidth = 402 * scale;
        final sceneLeft = (width - sceneWidth) / 2;
        final horizon = 314 * scale;
        final tabletOffset = _TabletSceneOffset.from(context);

        Widget asset(
          String path,
          double left,
          double top,
          double width,
          double height, {
          Color? color,
          Offset offset = Offset.zero,
        }) {
          return Positioned(
            left: sceneLeft + (left * scale) + offset.dx,
            top: (top * scale) + offset.dy,
            width: width * scale,
            height: height * scale,
            child: SvgPicture.asset(
              path,
              // sun and moon
              width: width * scale,
              height: height * scale,
              // fit: BoxFit.fill
              // fit: BoxFit.cover,
              excludeFromSemantics: true,
              colorFilter: color == null
                  ? null
                  : ColorFilter.mode(color, BlendMode.srcIn),
            ),
          );
        }

        return ExcludeSemantics(
          child: SizedBox(
            width: double.infinity,
            height: heightFor(width),
            child: Stack(
              children: [
                const Positioned.fill(
                  child: ColoredBox(color: ColorPalette.background),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  height: horizon,
                  child: ClipRect(
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          height: horizon,
                          child: ClipRect(
                            child: OverflowBox(
                              alignment: Alignment.topCenter,
                              maxHeight: (isDay ? 735.085 : 318) * scale,
                              child: SizedBox(
                                width: width,
                                height: (isDay ? 735.085 : 318) * scale,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(gradient: sky),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (!isMaghrib)
                          asset(
                            celestial,
                            (402 - celestialSize) / 2,
                            celestialTop,
                            celestialSize,
                            isMaghrib ? 114 : celestialSize,
                          ),
                        asset(
                          AppIcons.jadwalSholatCloud,
                          isDay
                              ? -39
                              : isMaghrib
                              ? -16
                              : -129.7,
                          isDay
                              ? 184
                              : isMaghrib
                              ? 213
                              : 128,
                          209.062,
                          132.08,
                          offset: tabletOffset.leftCloud,
                        ),
                        asset(
                          AppIcons.jadwalSholatCloud,
                          isDay
                              ? 248
                              : isMaghrib
                              ? 237
                              : 322.64,
                          isDay
                              ? 208
                              : isMaghrib
                              ? 214
                              : 145,
                          209.062,
                          132.08,
                          offset: tabletOffset.rightCloud,
                        ),
                        if (isMaghrib)
                          asset(
                            celestial,
                            (402 - celestialSize) / 2,
                            celestialTop,
                            celestialSize,
                            celestialSize,
                          ),
                        asset(
                          AppIcons.jadwalSholatMountLeft,
                          -104,
                          261,
                          227,
                          53,
                          color: isNight || isMaghrib ? Colors.black : null,
                          offset: tabletOffset.leftMount,
                        ),
                        asset(
                          AppIcons.jadwalSholatMountRight,
                          270,
                          266,
                          241,
                          48,
                          color: isNight || isMaghrib ? Colors.black : null,
                          offset: tabletOffset.rightMount,
                        ),
                      ],
                    ),
                  ),
                ),
                // Raster exports preserve Figma's unsupported wave filters.
                Positioned(
                  left: 0,
                  right: 0,
                  top: horizon,
                  child: Image.asset(
                    sea,
                    width: width,
                    fit: BoxFit.fitWidth,
                    excludeFromSemantics: true,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: horizon,
                  bottom: 0,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x000F172A), ColorPalette.background],
                        stops: [0, 0.65],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TabletSceneOffset {
  const _TabletSceneOffset({
    this.cloudSpread = 0,
    this.cloudTop = 0,
    this.mountSpread = 0,
    this.mountTop = 0,
  });

  factory _TabletSceneOffset.from(BuildContext context) {
    if (context.isTabletLarge) {
      return const _TabletSceneOffset(
        cloudSpread: 200,
        cloudTop: -10,
        mountSpread: 180,
        mountTop: 4,
      );
    }

    if (context.isTabletMedium) {
      return const _TabletSceneOffset(
        cloudSpread: 72,
        cloudTop: -6,
        mountSpread: 64,
        mountTop: 2,
      );
    }

    if (context.isTabletSmall) {
      return const _TabletSceneOffset(
        cloudSpread: 24,
        mountSpread: 18,
      );
    }

    return const _TabletSceneOffset();
  }

  final double cloudSpread;
  final double cloudTop;
  final double mountSpread;
  final double mountTop;

  Offset get leftCloud => Offset(-cloudSpread, cloudTop);
  Offset get rightCloud => Offset(cloudSpread, cloudTop);
  Offset get leftMount => Offset(-mountSpread, mountTop);
  Offset get rightMount => Offset(mountSpread, mountTop);
}
