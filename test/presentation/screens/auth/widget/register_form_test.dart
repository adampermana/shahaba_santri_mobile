import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/presentation/screens/auth/widget/register_form.dart';

void main() {
  testWidgets('Daftar stays disabled while required fields are empty', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(useMaterial3: false),
        home: const Scaffold(
          body: RegisterForm(onSwitchToLogin: _noop),
        ),
      ),
    );

    await tester.tap(find.text('Daftar'));
    await tester.pump();

    expect(find.text('Isi nama kamu dulu, yuk!'), findsNothing);
    expect(find.text('Isi email kamu dulu, yuk!'), findsNothing);
    expect(find.text('Kata sandi tidak boleh kosong'), findsNothing);
    expect(
      find.text('Konfirmasi kata sandi tidak boleh kosong'),
      findsNothing,
    );
  });
}

void _noop() {}
