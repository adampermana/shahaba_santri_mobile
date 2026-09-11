import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/widgets/card_jadwal_sholat.dart';
import 'package:sahaba_mobile/presentation/screens/jadwal_sholat/widgets/prayer_landscape.dart';

void main() {
  testWidgets('Prayer landscapes load their assets at phone and tablet sizes', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    for (final width in [320.0, 402.0, 768.0, 1024.0]) {
      tester.view.physicalSize = Size(width, 900);
      for (final prayer in WaktuSholat.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: width,
                height: PrayerLandscape.heightFor(width),
                child: PrayerLandscape(prayer: prayer),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.runAsync(() async {
          for (final image in tester.widgetList<Image>(find.byType(Image))) {
            await precacheImage(
              image.image,
              tester.element(find.byType(PrayerLandscape).first),
            );
          }
        });
        await tester.pumpAndSettle();
        expect(
          tester.takeException(),
          isNull,
          reason: '${prayer.label} at width $width',
        );
      }
    }

    // Save a local rendering for comparison with the four Figma references.
    tester.view.physicalSize = const Size(1608, 565);
    final boundaryKey = GlobalKey();
    await tester.pumpWidget(
      MaterialApp(
        home: RepaintBoundary(
          key: boundaryKey,
          child: Row(
            children: [
              for (final prayer in [
                WaktuSholat.dzuhur,
                WaktuSholat.maghrib,
                WaktuSholat.isya,
                WaktuSholat.terbit,
              ])
                SizedBox(
                  width: 402,
                  height: 565,
                  child: PrayerLandscape(prayer: prayer),
                ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    final boundary =
        boundaryKey.currentContext!.findRenderObject()!
            as RenderRepaintBoundary;
    await tester.runAsync(() async {
      final rendered = await boundary.toImage();
      final bytes = await rendered.toByteData(format: ui.ImageByteFormat.png);
      await Directory('build/ui_preview').create(recursive: true);
      await File(
        'build/ui_preview/prayer_landscapes.png',
      ).writeAsBytes(bytes!.buffer.asUint8List());
      rendered.dispose();
    });
  });
}
