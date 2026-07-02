import 'package:flutter/material.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';

class CalendarHijriahScreen extends StatelessWidget {
  const CalendarHijriahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.scaffoldBackground,
      appBar: CustomAppBar.buildBackTitleAppBar(
        context: context,
        title: 'Kalender Hijriah',
      ),
      body: const Center(
        child: Text('Kalender Hijriah - Coming Soon'),
      ),
    );
  }
}
