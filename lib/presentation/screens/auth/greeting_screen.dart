import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/routers/router_path.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Illustration
              ClipRRect(
                borderRadius: BorderRadius.circular(112),
                child: Container(
                  width: 224,
                  height: 224,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      radius: 0.55,
                      colors: [
                        Color(0xFF007D56),
                        Color(0xFF034D34),
                        Color(0xFF043523),
                        Color(0xFF061D13),
                      ],
                      stops: [0.0, 0.5, 0.75, 1.0],
                    ),
                  ),
                  child: const CacheImageOrSvg(
                    source: 'assets/images/greeting-illustration.png',
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Title
              const Text(
                'Selamat Datang di SHAHABA!',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: ColorPalette.kWhite,
                ),
              ),
              const SizedBox(height: 8),
              // Subtitle
              const SizedBox(
                width: 271,
                child: Text(
                  'Satu langkah lebih dekat untuk membangun komunikasi '
                  'keluarga yang lebih hangat.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: ColorPalette.kWhite,
                  ),
                ),
              ),
              const SizedBox(height: 64),
              // Button
              SubmitButtonStylesWidget(
                style: SubmitButtonStyle.elevated,
                primaryColor: const Color(0xFF007D56),
                textButton: 'Lanjut ke Beranda',
                onPressed: () {
                  context.go(RouterPath.mainPath);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
