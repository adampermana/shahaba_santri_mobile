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
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final double motifHeight;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    // final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: backgroundColor ?? ColorPalette.scaffoldBackground,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        children: [
          // motif jadi layer paling belakang, tinggi bebas
          // (boleh nembus sampai area body, nggak dibatasi tinggi appbar lagi)
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/motif-appbar.png',
              height: motifHeight,
              fit: BoxFit.fitHeight,
            ),
          ),
          // appbar + body ditaruh di atas motif, keduanya transparan
          // supaya motif kebaca di celah antara appbar & konten
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
