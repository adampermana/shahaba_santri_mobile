import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/bottom_sheet_pin.dart';

Widget _app(Widget child) {
  return MaterialApp(
    theme: ThemeData.dark(useMaterial3: false),
    home: Scaffold(body: child),
  );
}

void main() {
  testWidgets('new password renders Figma fields and disabled action', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        const PinBottomSheet(
          variant: PinBottomSheetVariant.newPassword,
        ),
      ),
    );

    expect(find.text('Masukin kata sandi Baru kamu'), findsOneWidget);
    expect(find.text('Kata sandi baru'), findsOneWidget);
    expect(find.text('Konfirmasi kata sandi'), findsOneWidget);
    expect(find.text('Password harus mengandung:'), findsOneWidget);
    expect(find.text('Minimal 8 karakter'), findsOneWidget);
    expect(find.text('Huruf besar dan kecil'), findsOneWidget);
    expect(find.text('Angka atau simbol'), findsOneWidget);
    expect(find.text('Gunakan format password yang sesuai'), findsNothing);
    expect(find.text('Kata sandi tidak sama'), findsNothing);

    await tester.tap(find.text('Konfirmasi'));
    await tester.pump();
    expect(find.text('Password harus mengandung:'), findsOneWidget);
  });

  testWidgets('valid new password invokes callback once', (tester) async {
    String? submitted;
    await tester.pumpWidget(
      _app(
        PinBottomSheet(
          variant: PinBottomSheetVariant.newPassword,
          onSubmitted: (value) => submitted = value,
        ),
      ),
    );

    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'Password1!');
    await tester.enterText(fields.at(1), 'Password1!');
    await tester.pump();

    await tester.tap(find.text('Konfirmasi'));
    await tester.pump();

    expect(submitted, 'Password1!');
  });

  testWidgets('new PIN uses six digit keypad and invokes callback', (
    tester,
  ) async {
    String? submitted;
    await tester.pumpWidget(
      _app(
        PinBottomSheet(
          variant: PinBottomSheetVariant.newPin,
          onSubmitted: (value) => submitted = value,
        ),
      ),
    );

    expect(find.text('Masukin PIN Baru kamu'), findsOneWidget);
    for (final digit in ['1', '2', '3', '4', '5', '6']) {
      await tester.tap(find.text(digit));
    }
    await tester.pump();

    expect(submitted, '123456');
  });

  testWidgets('current PIN exposes password and forgot PIN actions', (
    tester,
  ) async {
    var usePasswordCalled = false;
    var forgotPinCalled = false;
    await tester.pumpWidget(
      _app(
        PinBottomSheet(
          variant: PinBottomSheetVariant.currentPin,
          onUsePassword: () => usePasswordCalled = true,
          onForgotPin: () => forgotPinCalled = true,
        ),
      ),
    );

    expect(find.text('Masukin PIN kamu'), findsOneWidget);
    await tester.tap(find.text('Gunakan Kata Sandi'));
    await tester.tap(find.text('Lupa Pin?'));

    expect(usePasswordCalled, isTrue);
    expect(forgotPinCalled, isTrue);
  });
}
