import 'package:flutter/material.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({
    required this.title,
    required this.child,
    required this.footerNote,
    super.key,
  });

  final String title;
  final Widget child;
  final String footerNote;

  @override
  Widget build(BuildContext context) {
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardOpen = keyboardHeight > 0;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorPalette.scaffoldBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Color(0x38000000),
            blurRadius: 48,
            offset: Offset(0, -16),
          ),
        ],
      ),
      padding: EdgeInsets.only(bottom: keyboardHeight),
      child: Column(
        children: [
          // Judul sticky — tidak ikut scroll
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            child: Align(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: Color(0xFF007D56),
                ),
              ),
            ),
          ),

          // Form scroll area — berisi form + row switch akun
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: child,
            ),
          ),

          // T&K — fixed di bottom, hidden saat keyboard terbuka
          if (!isKeyboardOpen)
            Padding(
              padding: EdgeInsets.fromLTRB(24, 8, 24, 16 + bottomSafe),
              child: SizedBox(
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: footerNote,
                        style: const TextStyle(
                          color: ColorPalette.contentTertiary,
                          fontSize: 12,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const TextSpan(
                        text: 'Syarat & Ketentuan',
                        style: TextStyle(
                          color: Color(0xFF007D56),
                          fontSize: 12,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: ' serta Kebijakan Privasi kami.',
                        style: TextStyle(
                          color: ColorPalette.contentTertiary,
                          fontSize: 12,
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
