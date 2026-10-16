import 'dart:ui';

import 'package:flutter/material.dart';

class OnboardingBackgroundGlow extends StatelessWidget {
  const OnboardingBackgroundGlow({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const darkTeal = Color(0xFF09383B);
    const lightTeal = Color(0xFF1999A1);

    const designWidth = 402.0;
    const ellipseSize = 674.584;
    const blurRadius = 48.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final scale = constraints.maxWidth / designWidth;
        final size = ellipseSize * scale;
        final bleed = blurRadius * scale;
        final sigma = (blurRadius / 2) * scale;

        Widget glow({
          required double left,
          required double top,
          required bool flipped,
        }) {
          return Positioned(
            left: left * scale - bleed,
            top: top * scale - bleed,
            child: IgnorePointer(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: sigma,
                  sigmaY: sigma,
                  tileMode: TileMode.decal,
                ),
                child: SizedBox(
                  width: size + bleed * 2,
                  height: size + bleed * 2,
                  child: Padding(
                    padding: EdgeInsets.all(bleed),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: flipped
                              ? Alignment.bottomCenter
                              : Alignment.topCenter,
                          end: flipped
                              ? Alignment.topCenter
                              : Alignment.bottomCenter,
                          colors: const [darkTeal, lightTeal],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        return SizedBox.expand(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [darkTeal, lightTeal],
              ),
            ),
            child: Stack(
              children: [
                glow(left: -341.81, top: 244.19, flipped: false),
                glow(left: -18.12, top: 290.89, flipped: true),
                child,
              ],
            ),
          ),
        );
      },
    );
  }
}
