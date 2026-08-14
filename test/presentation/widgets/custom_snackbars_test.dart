import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_snackbar.dart';

// ─ Helper: wrap SnackBar in a testable scaffold

Widget _scaffold({required SnackBar snackBar}) {
  return MaterialApp(
    home: Scaffold(
      body: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(snackBar),
          child: const Text('Show'),
        ),
      ),
    ),
  );
}

Future<void> _showAndSettle(WidgetTester tester, SnackBar snackBar) async {
  await tester.pumpWidget(_scaffold(snackBar: snackBar));
  await tester.tap(find.text('Show'));
  await tester.pump(); // trigger animation frame
}

// ─ Tests

void main() {
  //  CustomSnackBar.success ─

  group('CustomSnackBar.success', () {
    test('should create instance with correct type defaults', () {
      final snackBar = CustomSnackBar.success(message: 'Berhasil disimpan');

      expect(snackBar.backgroundColor, Colors.green);
      expect(snackBar.duration, kSnackBarDuration);
      expect(snackBar.behavior, isNull); // success tidak floating
      expect(snackBar.shape, isNull);
      expect(snackBar.width, isNull);
    });

    testWidgets('should show green snackbar with white text', (tester) async {
      await _showAndSettle(
        tester,
        CustomSnackBar.success(message: 'Berhasil disimpan'),
      );

      expect(find.text('Berhasil disimpan'), findsOneWidget);

      final snackBarWidget = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBarWidget.backgroundColor, Colors.green);

      final text = tester.widget<Text>(find.text('Berhasil disimpan'));
      expect(text.style?.color, Colors.white);
      expect(text.style?.fontSize, 12);
    });

    testWidgets('should support optional SnackBarAction', (tester) async {
      final snackBar = CustomSnackBar.success(
        message: 'Item dihapus',
        action: SnackBarAction(label: 'Undo', onPressed: () {}),
      );

      await _showAndSettle(tester, snackBar);

      expect(find.text('Item dihapus'), findsOneWidget);
      expect(snackBar.action?.label, 'Undo');
    });
  });

  //  CustomSnackBar.failure ─

  group('CustomSnackBar.failure', () {
    test('should have correct type defaults', () {
      final snackBar = CustomSnackBar.failure(message: 'Terjadi kesalahan');

      expect(snackBar.backgroundColor, Colors.red);
      expect(snackBar.behavior, SnackBarBehavior.floating);
      expect(snackBar.duration, kSnackBarDuration);
      expect(snackBar.shape, isNull);
    });

    testWidgets('should show red snackbar with message', (tester) async {
      await _showAndSettle(
        tester,
        CustomSnackBar.failure(message: 'Terjadi kesalahan'),
      );

      expect(find.text('Terjadi kesalahan'), findsOneWidget);

      final snackBarWidget = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBarWidget.backgroundColor, Colors.red);
    });

    test(
      'should apply margin with internal offset when customMargin provided',
      () {
        const customMargin = EdgeInsets.all(16);
        final snackBar = CustomSnackBar.failure(
          message: 'Error',
          margin: customMargin,
        );

        final expectedMargin = customMargin.add(
          const EdgeInsets.fromLTRB(15, 5, 15, 10),
        );
        expect(snackBar.margin, expectedMargin);
      },
    );

    test('should use null margin when no custom margin provided', () {
      final snackBar = CustomSnackBar.failure(message: 'Error');
      expect(snackBar.margin, isNull);
    });
  });

  //  CustomSnackBar.networkInfo ─

  group('CustomSnackBar.networkInfo', () {
    test('should have correct type defaults', () {
      final snackBar = CustomSnackBar.networkInfo(message: 'No Internet');

      expect(snackBar.backgroundColor, Colors.white);
      expect(snackBar.behavior, SnackBarBehavior.floating);
      expect(snackBar.duration, const Duration(milliseconds: 1200));
      expect(snackBar.width, 180.0);
      expect(snackBar.shape, isA<StadiumBorder>());
    });

    testWidgets('should show Row with default wifi icon and colored text', (
      tester,
    ) async {
      await _showAndSettle(
        tester,
        CustomSnackBar.networkInfo(message: 'Tidak ada koneksi'),
      );

      expect(find.text('Tidak ada koneksi'), findsOneWidget);
      expect(find.byIcon(Icons.wifi_rounded), findsOneWidget);

      final icon = tester.widget<Icon>(find.byIcon(Icons.wifi_rounded));
      expect(icon.color, ColorPalette.kBanerRed);
      expect(icon.size, 20);

      final text = tester.widget<Text>(find.text('Tidak ada koneksi'));
      expect(text.style?.color, ColorPalette.primaryColor);
      expect(text.style?.fontSize, 12);
      expect(text.style?.fontWeight, FontWeight.w500);
    });

    testWidgets('should use custom icon when iconData provided', (
      tester,
    ) async {
      await _showAndSettle(
        tester,
        CustomSnackBar.networkInfo(
          message: 'Wifi mati',
          iconData: Icons.wifi_off,
        ),
      );

      expect(find.byIcon(Icons.wifi_off), findsOneWidget);
      expect(find.byIcon(Icons.wifi_rounded), findsNothing);
    });
  });

  //  CustomSnackBar.info

  group('CustomSnackBar.info', () {
    test('should have correct type defaults', () {
      final snackBar = CustomSnackBar.info(message: 'Informasi penting');

      expect(snackBar.backgroundColor, const Color(0xFF171A20));
      expect(snackBar.behavior, SnackBarBehavior.floating);
      expect(snackBar.duration, kSnackBarDuration);
      expect(snackBar.shape, isA<RoundedRectangleBorder>());

      final shape = snackBar.shape! as RoundedRectangleBorder;
      expect(shape.borderRadius, BorderRadius.circular(8));
    });

    testWidgets('should show white bold centered text with fontSize 14', (
      tester,
    ) async {
      await _showAndSettle(
        tester,
        CustomSnackBar.info(message: 'Info penting'),
      );

      expect(find.text('Info penting'), findsOneWidget);

      final text = tester.widget<Text>(find.text('Info penting'));
      expect(text.style?.color, Colors.white);
      expect(text.style?.fontSize, 14);
      expect(text.style?.fontWeight, FontWeight.w600);
      expect(text.textAlign, TextAlign.center);
    });

    test('should pass custom margin directly without offset', () {
      const customMargin = EdgeInsets.symmetric(horizontal: 24);
      final snackBar = CustomSnackBar.info(
        message: 'Info',
        margin: customMargin,
      );

      expect(snackBar.margin, customMargin);
    });
  });

  //  CustomSnackBar.quran ─

  group('CustomSnackBar.quran', () {
    test('should have correct type defaults', () {
      final snackBar = CustomSnackBar.quran(message: 'Bismillah');

      expect(snackBar.backgroundColor, ColorPalette.kWhite);
      expect(snackBar.behavior, SnackBarBehavior.floating);
      expect(snackBar.duration, kSnackBarDuration);
      expect(snackBar.shape, isA<RoundedRectangleBorder>());
    });

    testWidgets('should show black text with fontSize 16 and w500', (
      tester,
    ) async {
      await _showAndSettle(
        tester,
        CustomSnackBar.quran(message: 'Bismillah'),
      );

      expect(find.text('Bismillah'), findsOneWidget);

      final text = tester.widget<Text>(find.text('Bismillah'));
      expect(text.style?.color, ColorPalette.kBlack);
      expect(text.style?.fontSize, 16);
      expect(text.style?.fontWeight, FontWeight.w500);
    });
  });

  //  Raw constructor & enum exhaustiveness

  group('CustomSnackBar raw constructor — enum exhaustiveness', () {
    test('width is 180 only for networkInfo, null for all others', () {
      for (final type in SnackBarType.values) {
        final snackBar = CustomSnackBar(message: 'msg', type: type);
        if (type == SnackBarType.networkInfo) {
          expect(snackBar.width, 180.0, reason: 'networkInfo harus width 180');
        } else {
          expect(snackBar.width, isNull, reason: '$type harus width null');
        }
      }
    });

    test('behavior is null only for success, floating for all others', () {
      for (final type in SnackBarType.values) {
        final snackBar = CustomSnackBar(message: 'msg', type: type);
        if (type == SnackBarType.success) {
          expect(
            snackBar.behavior,
            isNull,
            reason: 'success behavior harus null',
          );
        } else {
          expect(
            snackBar.behavior,
            SnackBarBehavior.floating,
            reason: '$type harus floating',
          );
        }
      }
    });

    test(
      'duration is 1200ms only for networkInfo, others use kSnackBarDuration',
      () {
        for (final type in SnackBarType.values) {
          final snackBar = CustomSnackBar(message: 'msg', type: type);
          if (type == SnackBarType.networkInfo) {
            expect(snackBar.duration, const Duration(milliseconds: 1200));
          } else {
            expect(snackBar.duration, kSnackBarDuration);
          }
        }
      },
    );

    test(
      'shape: StadiumBorder for networkInfo, RoundedRect for info/quran, null otherwise',
      () {
        final expectations = {
          SnackBarType.networkInfo: isA<StadiumBorder>(),
          SnackBarType.info: isA<RoundedRectangleBorder>(),
          SnackBarType.quran: isA<RoundedRectangleBorder>(),
          SnackBarType.success: isNull,
          SnackBarType.failure: isNull,
        };

        for (final entry in expectations.entries) {
          final snackBar = CustomSnackBar(message: 'msg', type: entry.key);
          expect(
            snackBar.shape,
            entry.value,
            reason: '${entry.key} shape tidak sesuai',
          );
        }
      },
    );

    test(
      'non-failure margin: custom margin passed through directly (excludes networkInfo)',
      () {
        const margin = EdgeInsets.all(8);

        // networkInfo memiliki width: 180 — Flutter tidak mengizinkan
        // width + margin bersamaan, jadi kita skip type tersebut.
        final typesWithMarginSupport = SnackBarType.values
            .where(
              (t) => t != SnackBarType.failure && t != SnackBarType.networkInfo,
            )
            .toList();

        for (final type in typesWithMarginSupport) {
          final snackBar = CustomSnackBar(
            message: 'msg',
            type: type,
            margin: margin,
          );
          expect(
            snackBar.margin,
            margin,
            reason: '$type harus return margin apa adanya',
          );
        }
      },
    );
  });
}
