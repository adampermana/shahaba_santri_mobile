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
    this.showCheckbox = true,
    this.isVolumeMuted = false,
    super.key,
  });

  final String icon;
  final String name;
  final String time;
  final bool isActive;
  final bool isChecked;
  final bool isEnabled;
  final bool showCheckbox;
  final bool isVolumeMuted;
  final VoidCallback? onCheck;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final backgroundColor = isActive ? ColorPalette.primaryColor : null;
    final contentColor = isActive
        ? ColorPalette.kWhite
        : ColorPalette.contentSecondary;
    final timeColor = isActive ? ColorPalette.kWhite : ColorPalette.kBlack;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: isActive ? BorderRadius.circular(8) : BorderRadius.zero,
        border: const Border(
          bottom: BorderSide(
            color: ColorPalette.borderTransparent,
          ),
        ),
      ),
      child: Row(
        children: [
          // Checkbox
          SizedBox(
            width: 20,
            height: 20,
            child: showCheckbox
                ? GestureDetector(
                    onTap: isEnabled ? onCheck : null,
                    child: isChecked
                        ? SvgPicture.asset(
                            AppIcons.checkboxCircleLine,
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              isActive
                                  ? ColorPalette.kWhite
                                  : ColorPalette.primaryColor,
                              BlendMode.srcIn,
                            ),
                          )
                        : Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isEnabled
                                    ? (isActive
                                          ? ColorPalette.kWhite
                                          : ColorPalette.contentSecondary)
                                    : Colors.transparent,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(width: 10),
          // Prayer icon + name
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    contentColor,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  name,
                  style: textTheme.labelMedium?.copyWith(
                    color: isActive
                        ? const Color(0xFFDDDDDD)
                        : ColorPalette.contentSecondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Time + Volume
          Text(
            time,
            style: textTheme.titleMedium?.copyWith(
              color: timeColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(
            isVolumeMuted ? AppIcons.volumeMuteLine : AppIcons.volumeUpLine,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              isActive ? ColorPalette.kWhite : contentColor,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
