import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_snackbar.dart';

void main() {
  test('auth success snackbar matches recovery message style', () {
    final snackbar = CustomSnackBar.authSuccess(
      message: 'Sip! PIN baru sudah disimpan.',
    );

    expect(snackbar.behavior, SnackBarBehavior.floating);
    expect(snackbar.shape, isA<RoundedRectangleBorder>());
    expect(snackbar.margin, const EdgeInsets.fromLTRB(16, 0, 16, 24));
    expect(snackbar.padding, const EdgeInsets.all(16));
    final content = snackbar.content as Text;
    expect(content.data, 'Sip! PIN baru sudah disimpan.');
  });
}
