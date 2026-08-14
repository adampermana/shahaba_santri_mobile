import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/presentation/widgets/loading_screen.dart';

//  Helper

Widget _app({Widget? child}) => MaterialApp(
  home: Scaffold(body: child ?? const SizedBox()),
);

/// Pump widget tree dan panggil LoadingOverlay.show() langsung dari context
Future<BuildContext> _pump(
  WidgetTester tester, {
  String? message,
  bool dismissible = false,
  double barrierOpacity = 0.5,
  Widget? content,
}) async {
  late BuildContext captured;

  await tester.pumpWidget(
    _app(
      child: Builder(
        builder: (ctx) {
          captured = ctx;
          return const SizedBox();
        },
      ),
    ),
  );

  LoadingOverlay.show(
    captured,
    message: message,
    dismissible: dismissible,
    barrierOpacity: barrierOpacity,
    content: content,
  );
  await tester.pump();
  return captured;
}

//  Overlay visible/hidden sentinel
// CircularProgressIndicator (default) sebagai "overlay visible" marker
// karena ia HANYA ada jika LoadingOverlay berhasil diinsert.

bool get _overlayVisible =>
    find.byType(CircularProgressIndicator).evaluate().isNotEmpty;

//  Tests

void main() {
  tearDown(LoadingOverlay.hide);

  //  show

  group('LoadingOverlay.show', () {
    testWidgets(
      'should insert overlay with CircularProgressIndicator by default',
      (tester) async {
        await _pump(tester);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'should show custom content widget instead of spinner',
      (tester) async {
        const customKey = Key('custom_content');
        await _pump(
          tester,
          content: const Icon(Icons.hourglass_empty, key: customKey),
        );

        expect(find.byKey(customKey), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsNothing);
      },
    );

    testWidgets(
      'should show message text when message is not null/empty',
      (tester) async {
        await _pump(tester, message: 'Mohon tunggu...');

        expect(find.text('Mohon tunggu...'), findsOneWidget);

        final text = tester.widget<Text>(find.text('Mohon tunggu...'));
        expect(text.textAlign, TextAlign.center);
      },
    );

    testWidgets(
      'should NOT show any Text inside overlay when message is null',
      (tester) async {
        await _pump(tester);
        // Hanya spinner, tidak ada Text
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.byType(Text), findsNothing);
      },
    );

    testWidgets(
      'should NOT show message Text when message is empty string',
      (tester) async {
        await _pump(tester, message: '');
        expect(find.byType(Text), findsNothing);
      },
    );

    testWidgets(
      'should NOT show message Text when message is whitespace only (trimmed)',
      (tester) async {
        await _pump(tester, message: '   ');
        expect(find.byType(Text), findsNothing);
      },
    );

    testWidgets(
      'should set ModalBarrier color from barrierOpacity',
      (tester) async {
        const opacity = 0.7;
        await _pump(tester, barrierOpacity: opacity);

        // Ada beberapa ModalBarrier di tree — ambil yang warnanya sesuai
        final barriers = tester
            .widgetList<ModalBarrier>(find.byType(ModalBarrier))
            .where((b) => b.color == Colors.black.withValues(alpha: opacity))
            .toList();

        expect(barriers, hasLength(1));
        expect(barriers.first.color, Colors.black.withValues(alpha: opacity));
      },
    );

    testWidgets(
      'should set ModalBarrier dismissible=false by default',
      (tester) async {
        await _pump(tester);

        final barriers = tester
            .widgetList<ModalBarrier>(find.byType(ModalBarrier))
            .where((b) => b.color == Colors.black.withValues(alpha: 0.5))
            .toList();

        expect(barriers, hasLength(1));
        expect(barriers.first.dismissible, isFalse);
      },
    );

    testWidgets(
      'should set ModalBarrier dismissible=true when passed',
      (tester) async {
        await _pump(tester, dismissible: true);

        final barriers = tester
            .widgetList<ModalBarrier>(find.byType(ModalBarrier))
            .where((b) => b.color == Colors.black.withValues(alpha: 0.5))
            .toList();

        expect(barriers, hasLength(1));
        expect(barriers.first.dismissible, isTrue);
      },
    );

    testWidgets(
      'should NOT insert overlay twice when show() called again while shown',
      (tester) async {
        final ctx = await _pump(tester);

        // Panggil show() lagi
        LoadingOverlay.show(ctx);
        await tester.pump();

        // Masih hanya satu spinner
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );
  });

  //  hide

  group('LoadingOverlay.hide', () {
    testWidgets(
      'should remove overlay entry when hide() is called',
      (tester) async {
        await _pump(tester);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        LoadingOverlay.hide();
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsNothing);
      },
    );

    testWidgets(
      'should allow show() again after hide()',
      (tester) async {
        final ctx = await _pump(tester);

        LoadingOverlay.hide();
        await tester.pump();
        expect(_overlayVisible, isFalse);

        LoadingOverlay.show(ctx);
        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'should not throw when hide() called without prior show()',
      (tester) async {
        await tester.pumpWidget(_app());

        // Tidak ada overlay, tidak boleh throw
        expect(LoadingOverlay.hide, returnsNormally);
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsNothing);
      },
    );
  });

  //  _LoadingBackdrop internal widget

  group('_LoadingBackdrop widget', () {
    testWidgets(
      'should display spinner and message in a Column with mainAxisSize.min',
      (tester) async {
        await _pump(tester, message: 'Loading...');

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.text('Loading...'), findsOneWidget);

        // Column dengan mainAxisSize.min berisi keduanya
        final columns = tester.widgetList<Column>(find.byType(Column));
        final loadingColumn = columns.firstWhere(
          (c) => c.mainAxisSize == MainAxisSize.min,
          orElse: () =>
              throw TestFailure('No Column with mainAxisSize.min found'),
        );
        expect(loadingColumn.mainAxisSize, MainAxisSize.min);
      },
    );

    testWidgets(
      'should have SizedBox(height:16) spacer between spinner and message',
      (tester) async {
        await _pump(tester, message: 'Wait...');

        expect(
          find.byWidgetPredicate((w) => w is SizedBox && w.height == 16),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'PopScope canPop=false when dismissible=false (default)',
      (tester) async {
        await _pump(tester);

        final popScopes = tester
            .widgetList<PopScope>(find.byType(PopScope))
            .toList();
        // PopScope yang kita buat adalah yang paling dalam (dari overlay)
        expect(popScopes.any((p) => !p.canPop), isTrue);
      },
    );

    testWidgets(
      'PopScope canPop=true when dismissible=true',
      (tester) async {
        await _pump(tester, dismissible: true);

        final popScopes = tester
            .widgetList<PopScope>(find.byType(PopScope))
            .toList();
        expect(popScopes.any((p) => p.canPop), isTrue);
      },
    );

    testWidgets(
      'message text should use white color and w600 weight',
      (tester) async {
        await _pump(tester, message: 'Proses...');

        final text = tester.widget<Text>(find.text('Proses...'));
        expect(text.style?.color, Colors.white);
        expect(text.style?.fontWeight, FontWeight.w600);
      },
    );
  });
}
