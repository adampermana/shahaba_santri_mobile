import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';

class QuranTextSizeSetting {
  const QuranTextSizeSetting(this.value);

  static const minArabic = 20.0;
  static const defaultArabic = 28.0;
  static const maxArabic = 48.0;
  static const minLatin = 12.0;
  static const defaultLatin = 16.0;
  static const maxLatin = 20.0;

  static const initial = QuranTextSizeSetting(0);

  final double value;

  double get arabic => _scaled(
    min: minArabic,
    normal: defaultArabic,
    max: maxArabic,
  );

  double get latin => _scaled(
    min: minLatin,
    normal: defaultLatin,
    max: maxLatin,
  );

  double get translation => latin;

  double _scaled({
    required double min,
    required double normal,
    required double max,
  }) {
    final clamped = value.clamp(-1, 1).toDouble();
    if (clamped < 0) return normal + ((normal - min) * clamped);
    return normal + ((max - normal) * clamped);
  }
}

class DialogSettingWidget extends StatefulWidget {
  const DialogSettingWidget({
    required this.initialSetting,
    required this.onChanged,
    super.key,
  });

  final QuranTextSizeSetting initialSetting;
  final ValueChanged<QuranTextSizeSetting> onChanged;

  @override
  State<DialogSettingWidget> createState() => _DialogSettingWidgetState();
}

class _DialogSettingWidgetState extends State<DialogSettingWidget> {
  late QuranTextSizeSetting _setting;

  @override
  void initState() {
    super.initState();
    _setting = widget.initialSetting;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 14),
      backgroundColor: ColorPalette.kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Ukuran Teks',
                    style: textTheme.titleSmall?.copyWith(
                      color: ColorPalette.contentSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(
                    AppIcons.closeLine,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: ColorPalette.surfaceTertiary,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Text(
                    'A',
                    style: textTheme.titleSmall?.copyWith(
                      color: ColorPalette.contentSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: ColorPalette.primaryColor,
                        inactiveTrackColor: ColorPalette.contentTertiary,
                        trackHeight: 4,
                        thumbColor: ColorPalette.primaryColor,
                        overlayColor: ColorPalette.primaryColor.withValues(
                          alpha: 0.12,
                        ),
                      ),
                      child: Slider(
                        divisions: 2,
                        min: -1,
                        value: _setting.value,
                        onChanged: (value) {
                          final setting = QuranTextSizeSetting(value);
                          setState(() => _setting = setting);
                          widget.onChanged(setting);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'A',
                    style: textTheme.displaySmall?.copyWith(
                      color: ColorPalette.contentSecondary,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
