import 'package:flutter/material.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
    this.motifHeight = 220,
    this.backgroundColor,
    this.gradient,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final double motifHeight;
  final Color? backgroundColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradient != null
          ? Colors.transparent
          : backgroundColor ?? ColorPalette.scaffoldBackground,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        children: [
          // Gradient background layer (optional)
          if (gradient != null)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(gradient: gradient),
              ),
            ),
          // Motif layer
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/motif-appbar.png',
              height: motifHeight,
              fit: BoxFit.fitHeight,
            ),
          ),
          // AppBar + body
          Column(
            children: [
              const SizedBox(height: 8),
              if (appBar != null)
                SizedBox(
                  height: appBar!.preferredSize.height,
                  child: appBar,
                ),
              Expanded(
                child: body ?? const SizedBox.shrink(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
