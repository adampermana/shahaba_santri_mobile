import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';

class PrayerTimeTile extends StatelessWidget {
  const PrayerTimeTile({
    required this.icon,
    required this.name,
    required this.time,
    required this.isActive,
    required this.isChecked,
    required this.isEnabled,
    required this.onCheck,
    this.isHistory = false,
    this.showCheckbox = true,
    this.showVolume = true,
    this.isVolumeMuted = false,
    this.onVolumeTap,
    super.key,
  });

  final String icon;
  final String name;
  final String time;
  final bool isActive;
  final bool isChecked;
  final bool isEnabled;
  final bool isHistory;
  final bool showCheckbox;
  final bool showVolume;
  final bool isVolumeMuted;
  final VoidCallback? onCheck;
  final VoidCallback? onVolumeTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final iconColor = isActive
        ? ColorPalette.kWhite
        : ColorPalette.kWhite.withValues(alpha: 0.87);
    final labelColor = isActive
        ? ColorPalette.kWhite
        : ColorPalette.kWhite.withValues(alpha: 0.87);
    final timeColor = isActive ? ColorPalette.kWhite : ColorPalette.kWhite;

    final volumeColor = isActive
        ? ColorPalette.kWhite
        : isEnabled
        ? ColorPalette.primaryColor
        : ColorPalette.contentDisabled;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: isActive
            ? const RadialGradient(
                radius: 3.4,
                colors: [ColorPalette.primaryColor, Color(0xFF105033)],
              )
            : null,
        borderRadius: BorderRadius.circular(isActive ? 16 : 0),
        border: isActive
            ? null
            : const Border(bottom: BorderSide(color: Color(0x14000000))),
        boxShadow: isActive
            ? const [
                BoxShadow(
                  color: ColorPalette.shadowDarkSoft,
                  blurRadius: 8,
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          if (showCheckbox) ...[
            SizedBox(
              width: 20,
              height: 20,
              child: _PrayerCheckbox(
                isActive: isActive,
                isChecked: isChecked,
                isEnabled: isEnabled,
                isHistory: isHistory,
                onTap: onCheck,
              ),
            ),
            const SizedBox(width: 10),
          ] else
            const SizedBox(width: 30),
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  width: 25.33,
                  height: 25.6,
                  colorFilter: ColorFilter.mode(
                    iconColor,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelMedium?.copyWith(
                      color: labelColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            time,
            style: textTheme.titleMedium?.copyWith(
              color: timeColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          if (showVolume) ...[
            const SizedBox(width: 16),
            SizedBox(
              width: 24,
              height: 24,
              child: isEnabled
                  ? InkWell(
                      onTap: onVolumeTap,
                      borderRadius: BorderRadius.circular(20),
                      child: Center(
                        child: SvgPicture.asset(
                          isVolumeMuted
                              ? AppIcons.volumeMuteLine
                              : AppIcons.volumeUpLine,
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            volumeColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: SvgPicture.asset(
                        isVolumeMuted
                            ? AppIcons.volumeMuteLine
                            : AppIcons.volumeUpLine,
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          volumeColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
            ),
          ] else
            const SizedBox(width: 40),
        ],
      ),
    );
  }
}

class _PrayerCheckbox extends StatelessWidget {
  const _PrayerCheckbox({
    required this.isActive,
    required this.isChecked,
    required this.isEnabled,
    required this.isHistory,
    required this.onTap,
  });

  final bool isActive;
  final bool isChecked;
  final bool isEnabled;
  final bool isHistory;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = isHistory
        ? ColorPalette.kWhite.withValues(alpha: 0.38)
        : isChecked
        ? (isActive ? ColorPalette.kWhite : ColorPalette.primaryColor)
        : isActive
        ? ColorPalette.kWhite
        : ColorPalette.kWhite.withValues(alpha: 0.65);
    final fillColor = isHistory
        ? Colors.transparent
        : isChecked
        ? (isActive ? ColorPalette.kWhite : ColorPalette.primaryColor)
        : Colors.transparent;
    final checkColor = isHistory
        ? ColorPalette.kWhite.withValues(alpha: 0.45)
        : isActive
        ? ColorPalette.primaryColor
        : ColorPalette.kWhite;

    final checkbox = Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: fillColor,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: isChecked
          ? Icon(
              Icons.check_rounded,
              color: checkColor,
              size: 16,
            )
          : null,
    );

    if (!isEnabled) return checkbox;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: checkbox,
    );
  }
}
