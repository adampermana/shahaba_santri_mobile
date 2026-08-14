import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

//  Helper

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

SubmitButtonStylesWidget _btn({
  required SubmitButtonStyle style,
  VoidCallback? onPressed,
  Widget? child,
  Widget? icon,
  String? textButton = 'Submit',
  Color? primaryColor,
  Color? textButtonColor,
  double? textButtonSize,
  TextStyle? textStyle,
  TextDecoration textDecoration = TextDecoration.none,
  double? height,
  double? width,
  double radius = 12.0,
  double? blur = 18,
  EdgeInsetsGeometry? padding,
  bool isLoading = false,
  bool isActive = true,
  bool useGradient = false,
  Gradient? gradient,
}) => SubmitButtonStylesWidget(
  style: style,
  onPressed: onPressed,
  icon: icon,
  textButton: textButton,
  primaryColor: primaryColor,
  textButtonColor: textButtonColor,
  textButtonSize: textButtonSize,
  textStyle: textStyle,
  textDecoration: textDecoration,
  height: height,
  width: width,
  radius: radius,
  blur: blur,
  padding: padding,
  isLoading: isLoading,
  isActive: isActive,
  useGradient: useGradient,
  gradient: gradient,
  child: child,
);

//  Tests ──

void main() {
  // ── SubmitButtonStyle.elevated ──

  group('SubmitButtonStyle.elevated', () {
    testWidgets('should render ElevatedButton with default label "Submit"', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          _btn(style: SubmitButtonStyle.elevated, onPressed: () {}),
        ),
      );

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('should render custom textButton label', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevated,
            textButton: 'Simpan',
            onPressed: () {},
          ),
        ),
      );

      expect(find.text('Simpan'), findsOneWidget);
    });

    testWidgets('should trigger onPressed when tapped', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevated,
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      expect(pressed, isTrue);
    });

    testWidgets('should show CircularProgressIndicator when isLoading=true', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          _btn(style: SubmitButtonStyle.elevated, isLoading: true),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Submit'), findsNothing);
    });

    testWidgets('should NOT fire onPressed when isLoading=true', (
      tester,
    ) async {
      var pressed = false;
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevated,
            isLoading: true,
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton), warnIfMissed: false);
      expect(pressed, isFalse);
    });

    testWidgets('should NOT fire onPressed when isActive=false', (
      tester,
    ) async {
      var pressed = false;
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevated,
            isActive: false,
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton), warnIfMissed: false);
      expect(pressed, isFalse);
    });

    testWidgets('should use double.infinity width and 56 height by default', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          _btn(style: SubmitButtonStyle.elevated),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find
            .ancestor(
              of: find.byType(ElevatedButton),
              matching: find.byType(SizedBox),
            )
            .first,
      );
      expect(sizedBox.width, double.infinity);
      expect(sizedBox.height, 56.0);
    });

    testWidgets('should use custom width and height when provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          _btn(style: SubmitButtonStyle.elevated, width: 200, height: 48),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find
            .ancestor(
              of: find.byType(ElevatedButton),
              matching: find.byType(SizedBox),
            )
            .first,
      );
      expect(sizedBox.width, 200.0);
      expect(sizedBox.height, 48.0);
    });

    testWidgets('should render custom child widget instead of text', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevated,
            child: const Icon(Icons.check, key: Key('icon_check')),
          ),
        ),
      );

      expect(find.byKey(const Key('icon_check')), findsOneWidget);
      expect(find.text('Submit'), findsNothing);
    });

    testWidgets('should render icon alongside text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevated,
            icon: const Icon(Icons.save, key: Key('icon_save')),
            onPressed: () {},
          ),
        ),
      );

      expect(find.byKey(const Key('icon_save')), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('should wrap with gradient Container when useGradient=true', (
      tester,
    ) async {
      const gradient = LinearGradient(
        colors: [Colors.blue, Colors.purple],
      );
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevated,
            useGradient: true,
            gradient: gradient,
            onPressed: () {},
          ),
        ),
      );

      // Container dengan gradient ada
      final containers = tester.widgetList<Container>(find.byType(Container));
      final gradientContainer = containers.where(
        (c) =>
            c.decoration is BoxDecoration &&
            (c.decoration! as BoxDecoration).gradient != null,
      );
      expect(gradientContainer, isNotEmpty);
    });

    testWidgets('should apply custom textButtonColor to label', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevated,
            textButtonColor: Colors.amber,
            onPressed: () {},
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Submit'));
      expect(text.style?.color, Colors.amber);
    });

    testWidgets('should apply custom textStyle when provided', (tester) async {
      const customStyle = TextStyle(color: Colors.red, fontSize: 20);
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevated,
            textStyle: customStyle,
            onPressed: () {},
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Submit'));
      expect(text.style?.color, Colors.red);
      expect(text.style?.fontSize, 20.0);
    });
  });

  // ── SubmitButtonStyle.outlined ──

  group('SubmitButtonStyle.outlined', () {
    testWidgets('should render OutlinedButton with default label', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          _btn(style: SubmitButtonStyle.outlined, onPressed: () {}),
        ),
      );

      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('should trigger onPressed when tapped', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.outlined,
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(OutlinedButton));
      expect(pressed, isTrue);
    });

    testWidgets('should show spinner when isLoading=true', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(style: SubmitButtonStyle.outlined, isLoading: true),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Submit'), findsNothing);
    });

    testWidgets('should NOT fire onPressed when isLoading=true', (
      tester,
    ) async {
      var pressed = false;
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.outlined,
            isLoading: true,
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(OutlinedButton), warnIfMissed: false);
      expect(pressed, isFalse);
    });

    testWidgets('should use white background for OutlinedButton', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.outlined,
            onPressed: () {},
          ),
        ),
      );

      final btn = tester.widget<OutlinedButton>(find.byType(OutlinedButton));
      final bgColor = btn.style?.backgroundColor?.resolve({});
      expect(bgColor, Colors.white);
    });

    testWidgets(
      'should use primaryColor for border when onPressed is provided',
      (tester) async {
        await tester.pumpWidget(
          _wrap(
            _btn(
              style: SubmitButtonStyle.outlined,
              primaryColor: Colors.green,
              onPressed: () {},
            ),
          ),
        );

        final btn = tester.widget<OutlinedButton>(find.byType(OutlinedButton));
        final side = btn.style?.side?.resolve({});
        expect(side?.color, Colors.green);
      },
    );

    testWidgets('should render custom child instead of text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.outlined,
            child: const Icon(Icons.edit, key: Key('edit_icon')),
          ),
        ),
      );

      expect(find.byKey(const Key('edit_icon')), findsOneWidget);
      expect(find.text('Submit'), findsNothing);
    });

    testWidgets('should render icon alongside text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.outlined,
            icon: const Icon(Icons.add, key: Key('add_icon')),
            onPressed: () {},
          ),
        ),
      );

      expect(find.byKey(const Key('add_icon')), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
    });
  });

  // ── SubmitButtonStyle.text

  group('SubmitButtonStyle.text', () {
    testWidgets('should render TextButton with default label', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(style: SubmitButtonStyle.text, onPressed: () {}),
        ),
      );

      expect(find.byType(TextButton), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('should trigger onPressed when tapped', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.text,
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));
      expect(pressed, isTrue);
    });

    testWidgets('should show spinner when isLoading=true', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(style: SubmitButtonStyle.text, isLoading: true),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Submit'), findsNothing);
    });

    testWidgets('should NOT fire onPressed when isLoading=true', (
      tester,
    ) async {
      var pressed = false;
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.text,
            isLoading: true,
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(TextButton), warnIfMissed: false);
      expect(pressed, isFalse);
    });

    testWidgets('should apply textDecoration to label', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.text,
            textDecoration: TextDecoration.underline,
            onPressed: () {},
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Submit'));
      expect(text.style?.decoration, TextDecoration.underline);
    });

    testWidgets('should use kBlack as default textButtonColor', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(style: SubmitButtonStyle.text, onPressed: () {}),
        ),
      );

      final text = tester.widget<Text>(find.text('Submit'));
      expect(text.style?.color, ColorPalette.kBlack);
    });

    testWidgets('should use custom textButtonColor when provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.text,
            textButtonColor: Colors.deepPurple,
            onPressed: () {},
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Submit'));
      expect(text.style?.color, Colors.deepPurple);
    });

    testWidgets('should render custom child instead of text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.text,
            child: const Text('Kustom', key: Key('custom_text')),
          ),
        ),
      );

      expect(find.byKey(const Key('custom_text')), findsOneWidget);
      expect(find.text('Submit'), findsNothing);
    });
  });

  // ── SubmitButtonStyle.elevatedGlass

  group('SubmitButtonStyle.elevatedGlass', () {
    testWidgets('should render InkWell (glass button surface)', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(style: SubmitButtonStyle.elevatedGlass, onPressed: () {}),
        ),
      );

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('should show default label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(style: SubmitButtonStyle.elevatedGlass, onPressed: () {}),
        ),
      );

      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('should trigger onPressed when tapped', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevatedGlass,
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
    });

    testWidgets('should show spinner when isLoading=true', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(style: SubmitButtonStyle.elevatedGlass, isLoading: true),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Submit'), findsNothing);
    });

    testWidgets('should NOT fire onPressed when isLoading=true', (
      tester,
    ) async {
      var pressed = false;
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevatedGlass,
            isLoading: true,
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(InkWell), warnIfMissed: false);
      await tester.pump();
      expect(pressed, isFalse);
    });

    testWidgets('should NOT fire onPressed when isActive=false', (
      tester,
    ) async {
      var pressed = false;
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevatedGlass,
            isActive: false,
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(InkWell), warnIfMissed: false);
      await tester.pump();
      expect(pressed, isFalse);
    });

    testWidgets('should render icon alongside text when icon provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevatedGlass,
            icon: const Icon(Icons.star, key: Key('star_icon')),
            onPressed: () {},
          ),
        ),
      );

      expect(find.byKey(const Key('star_icon')), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('should render custom child instead of text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          _btn(
            style: SubmitButtonStyle.elevatedGlass,
            child: const Text('Glass Button', key: Key('glass_label')),
          ),
        ),
      );

      expect(find.byKey(const Key('glass_label')), findsOneWidget);
      expect(find.text('Submit'), findsNothing);
    });
  });

  // ── Shared / cross-style behaviour ─

  group('Shared behaviour across styles', () {
    for (final style in [
      SubmitButtonStyle.elevated,
      SubmitButtonStyle.outlined,
      SubmitButtonStyle.text,
    ]) {
      testWidgets(
        '$style: shows spinner and hides label when isLoading=true',
        (tester) async {
          await tester.pumpWidget(
            _wrap(
              _btn(style: style, isLoading: true, textButton: 'Aksi'),
            ),
          );

          expect(find.byType(CircularProgressIndicator), findsOneWidget);
          expect(find.text('Aksi'), findsNothing);
        },
      );
    }

    for (final style in SubmitButtonStyle.values) {
      testWidgets(
        '$style: renders without error with all defaults',
        (tester) async {
          await tester.pumpWidget(_wrap(_btn(style: style)));
          // Tidak throw
          expect(find.byType(SubmitButtonStylesWidget), findsOneWidget);
        },
      );
    }
  });
}
