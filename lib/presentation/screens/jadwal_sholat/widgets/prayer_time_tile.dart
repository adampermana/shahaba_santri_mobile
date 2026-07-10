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
          SizedBox(
            width: 32,
            height: 32,
            child: showCheckbox
                ? Center(
                    child: isEnabled
                        ? _PrayerCheckbox(
                            isActive: isActive,
                            isChecked: isChecked,
                            isEnabled: true,
                            isHistory: isHistory,
                            onTap: onCheck,
                          )
                        : Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: isChecked
                                  ? ColorPalette.primaryColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: isChecked
                                    ? ColorPalette.primaryColor
                                    : ColorPalette.contentDisabled,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: isChecked
                                ? const Icon(
                                    Icons.check_rounded,
                                    color: ColorPalette.kWhite,
                                    size: 20,
                                  )
                                : null,
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
          if (showVolume)
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: isEnabled
                  ? InkWell(
                      onTap: onVolumeTap,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: SvgPicture.asset(
                          isVolumeMuted
                              ? AppIcons.volumeMuteLine
                              : AppIcons.volumeUpLine,
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            isActive ? ColorPalette.kWhite : contentColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 32,
                      height: 32,
                      child: Center(
                        child: SvgPicture.asset(
                          isVolumeMuted
                              ? AppIcons.volumeMuteLine
                              : AppIcons.volumeUpLine,
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            ColorPalette.contentDisabled,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
            ),
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
        ? ColorPalette.contentDisabled
        : isChecked
        ? (isActive ? ColorPalette.kWhite : ColorPalette.primaryColor)
        : isActive
        ? ColorPalette.kWhite
        : ColorPalette.contentDisabled;

    final checkbox = Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: isHistory
            ? Colors.transparent
            : isChecked
            ? (isActive ? ColorPalette.kWhite : ColorPalette.primaryColor)
            : Colors.transparent,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: isHistory
          ? (isChecked
                ? const Icon(
                    Icons.check_rounded,
                    color: ColorPalette.contentDisabled,
                    size: 20,
                  )
                : null)
          : isChecked
          ? Icon(
              Icons.check_rounded,
              color: isActive
                  ? ColorPalette.primaryColor
                  : ColorPalette.kWhite,
              size: 20,
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
