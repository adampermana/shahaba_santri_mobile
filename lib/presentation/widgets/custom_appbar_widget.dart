import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/infrastructure/extension/datetime_extension.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';

class CustomAppBar {
  // 1. Simple AppBar  (generic, reusable)
  static PreferredSizeWidget buildAppBarSimple({
    Key? key,
    String? title,
    Widget? titleWidget,
    Widget? leading,
    Widget? titleLeading,
    List<Widget>? actions,
    Color? backgroundColor,
    bool centerTitle = false,
    bool automaticallyImplyLeading = false,
    double? elevation,
    double? leadingWidth,
    PreferredSizeWidget? bottom,
  }) => AppBar(
    key: key,
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: leading,
    leadingWidth: leadingWidth,
    title:
        titleWidget ??
        Text(title ?? '', style: const TextStyle(color: ColorPalette.kBlack)),
    centerTitle: centerTitle,
    actions: actions,
    elevation: elevation ?? 0,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    bottom: bottom,
    backgroundColor: backgroundColor,
  );

  // 2. Complex AppBar  (search + icon row in title)
  static Widget buildAppBarComplex({
    Key? key,
    String? title,
    Widget? titleWidget,
    Widget? leading,
    Widget? searchWidget,
    List<Widget>? widgetIcons,
    List<Widget>? actions,
    Color? backgroundColor,
    bool centerTitle = true,
    bool automaticallyImplyLeading = false,
    double? elevation,
    double? toolbarHeight,
    double sizeWidth = 162,
    double sizeHeight = 46,
    double sizeTextbuttonSwitch = 13,
    double sizeWidthBorderSwitch = 70,
    PreferredSizeWidget? bottom,
  }) => AppBar(
    key: key,
    toolbarHeight: toolbarHeight,
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: leading,
    title:
        titleWidget ??
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (searchWidget != null)
              SizedBox(
                width: sizeWidth,
                height: sizeHeight,
                child: searchWidget,
              ),
            if (widgetIcons != null)
              ...widgetIcons.map((widget) => Flexible(child: widget)),
          ],
        ),
    centerTitle: centerTitle,
    actions: actions,
    elevation: elevation ?? 0,
    bottom: bottom,
    backgroundColor: backgroundColor,
  );

  // 3. Home AppBar
  static PreferredSizeWidget buildHomeAppBar({
    required String date,
    String? hijriDate,
    String location = 'Jagakarsa',
    VoidCallback? onLocationTap,
    VoidCallback? onSearchTap,
    VoidCallback? onNotificationTap,
    Key? key,
  }) => _HomeAppBar(
    key: key,
    date: date,
    hijriDate: hijriDate ?? DateTime.now().hijriDateId(),
    location: location,
    onLocationTap: onLocationTap,
    onSearchTap: onSearchTap,
    onNotificationTap: onNotificationTap,
  );

  // 4. Back + Title AppBar
  //    ← | [Title] (centered, bold)
  static PreferredSizeWidget buildBackTitleAppBar({
    required BuildContext context,
    required String title,
    VoidCallback? onBackTap,
    List<Widget>? actions,
    Color? backgroundColor,
    IconData icon = Icons.arrow_back_rounded,
    Key? key,
  }) => AppBar(
    key: key,
    backgroundColor: backgroundColor ?? ColorPalette.scaffoldBackgroundAppBar,
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: _BackButton(
      onTap: onBackTap ?? () => Navigator.of(context).maybePop(),
      icon: icon,
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: ColorPalette.kBlack,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 1.4,
      ),
    ),
    actions: actions,
  );

  // 6. Search AppBar
  static PreferredSizeWidget buildSearchAppBar({
    required BuildContext context,
    required TextEditingController controller,
    String hintText = 'Cari thread atau topik...',
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onBackTap,
    VoidCallback? onClear,
    Color? backgroundColor,
    IconData icon = Icons.arrow_back_rounded,
    Key? key,
  }) => _SearchAppBar(
    key: key,
    controller: controller,
    hintText: hintText,
    onChanged: onChanged,
    onSubmitted: onSubmitted,
    onBackTap: onBackTap ?? () => Navigator.of(context).maybePop(),
    onClear: onClear,
    backgroundColor: backgroundColor ?? ColorPalette.scaffoldBackgroundAppBar,
    icon: icon,
  );

  // 7. Jadwal Sholat AppBar  (date navigator in title)
  static PreferredSizeWidget buildJadwalSholatAppBar({
    required DateTime date,
    required VoidCallback onPrevious,
    required VoidCallback onNext,
    Color? backgroundColor,
    Key? key,
  }) => AppBar(
    key: key,
    backgroundColor: backgroundColor ?? ColorPalette.scaffoldBackgroundAppBar,
    elevation: 0,
    scrolledUnderElevation: 0,
    automaticallyImplyLeading: false,
    centerTitle: true,
    titleSpacing: 0,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(20),
      child: _JadwalSholatDateNavigator(
        date: date,
        onPrevious: onPrevious,
        onNext: onNext,
      ),
    ),
  );

  // 8. Logo Only AppBar  (minimal — no actions)
  static PreferredSizeWidget buildLogoOnlyAppBar({
    Color? backgroundColor,
    Key? key,
  }) => AppBar(
    key: key,
    backgroundColor: backgroundColor ?? ColorPalette.scaffoldBackgroundAppBar,
    elevation: 0,
    automaticallyImplyLeading: false,
    centerTitle: false,
    title: const _HayuWeLogoText(),
  );
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar({
    required this.date,
    required this.hijriDate,
    required this.location,
    super.key,
    this.onLocationTap,
    this.onSearchTap,
    this.onNotificationTap,
  });

  final String date;
  final String hijriDate;
  final String location;
  final VoidCallback? onLocationTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;

  @override
  Size get preferredSize => const Size.fromHeight(88);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: ColorPalette.scaffoldBackgroundAppBar,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: preferredSize.height,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          spacing: 8,
          children: [
            SizedBox(
              width: context.isTabletLarge
                  ? 140
                  : context.isTabletMedium
                  ? 140
                  : context.isTabletSmall
                  ? 140
                  : context.isPhoneLarge
                  ? 110
                  : context.isPhoneMedium
                  ? 108
                  : context.isPhoneSmall
                  ? 108
                  : 108,
              child: Column(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    date,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    hijriDate,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: ColorPalette.contentSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: _HomeLocationChip(
                      location: location,
                      onTap: onLocationTap,
                    ),
                  ),
                  _HomeIconButton(
                    icon: AppIcons.searchLine,
                    onTap: onSearchTap,
                  ),
                  _HomeIconButton(
                    icon: AppIcons.notification2Line,
                    onTap: onNotificationTap,
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

class _HomeLocationChip extends StatelessWidget {
  const _HomeLocationChip({
    required this.location,
    this.onTap,
  });

  final String location;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: context.isTabletLarge
            ? null
            : context.isTabletMedium
            ? null
            : context.isTabletSmall
            ? null
            : context.isPhoneLarge
            ? 140
            : context.isPhoneMedium
            ? 140
            : context.isPhoneSmall
            ? 140
            : 140,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: ColorPalette.surfaceTertiary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            const _HomeSvgIcon(
              icon: AppIcons.mapPin2Line,
              color: ColorPalette.primary,
            ),
            Flexible(
              child: Text(
                location,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  color: ColorPalette.contentSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const _HomeSvgIcon(
              icon: AppIcons.arrowDropDownLine,
              color: ColorPalette.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeIconButton extends StatelessWidget {
  const _HomeIconButton({
    required this.icon,
    this.onTap,
  });

  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 24,
        height: 24,
        child: _HomeSvgIcon(
          icon: icon,
          color: ColorPalette.kBlack,
        ),
      ),
    );
  }
}

class _HomeSvgIcon extends StatelessWidget {
  const _HomeSvgIcon({
    required this.icon,
    required this.color,
  });

  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}

// Private helpers
/// "HayuWe" bold green logo text.
class _HayuWeLogoText extends StatelessWidget {
  const _HayuWeLogoText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'HayuWe',
      style: TextStyle(
        fontFamily: 'Synonym',
        fontSize: 24,
        fontStyle: FontStyle.italic,
        color: ColorPalette.primaryColor,
        fontWeight: FontWeight.w700,
        height: 1.33,
        letterSpacing: -0.40,
      ),
    );
  }
}

/// Standard back-chevron button.
class _BackButton extends StatelessWidget {
  const _BackButton({
    required this.onTap,
    this.icon = Icons.arrow_back_rounded,
  });

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: ColorPalette.kBlack,
        size: 24,
      ),
      splashRadius: 20,
    );
  }
}

class _JadwalSholatDateNavigator extends StatelessWidget {
  const _JadwalSholatDateNavigator({
    required this.date,
    required this.onPrevious,
    required this.onNext,
  });

  final DateTime date;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final monthName = IndoDateTimeX.bulan[date.month - 1];
    final formatted = '${date.day} $monthName ${date.year}';

    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _DateNavArrowButton(
            quarterTurns: 2,
            onTap: onPrevious,
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formatted,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  date.hijriDateId(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(
                    color: ColorPalette.contentSecondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          _DateNavArrowButton(
            onTap: onNext,
          ),
        ],
      ),
    );
  }
}

class _DateNavArrowButton extends StatelessWidget {
  const _DateNavArrowButton({required this.onTap, this.quarterTurns = 0});

  final VoidCallback onTap;
  final int quarterTurns;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: context.isTabletLarge
          ? 50
          : context.isTabletMedium
          ? 50
          : context.isTabletSmall
          ? 50
          : context.isPhoneLarge
          ? 50
          : context.isPhoneMedium
          ? 40
          : context.isPhoneSmall
          ? 40
          : 40,
      decoration: BoxDecoration(
        color: ColorPalette.surfaceTertiary,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: IconButton(
        onPressed: onTap,
        padding: EdgeInsets.zero,
        icon: RotatedBox(
          quarterTurns: quarterTurns,
          child: SvgPicture.asset(
            AppIcons.arrowDropRightLine,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              ColorPalette.kBlack,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

/// Search AppBar implemented as a PreferredSizeWidget.
class _SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SearchAppBar({
    required this.controller,
    required this.hintText,
    required this.onBackTap,
    required this.backgroundColor,
    required this.icon,
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  final TextEditingController controller;
  final String hintText;
  final VoidCallback onBackTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final Color backgroundColor;
  final IconData icon;

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      toolbarHeight: 72,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        children: [
          _BackButton(onTap: onBackTap, icon: icon),
          Expanded(
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: const Color(0xFF4D4D4D).withValues(alpha: 0.15),
                  width: 0.5,
                ),
              ),
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
                autofocus: true,
                textInputAction: TextInputAction.search,
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(
                  color: ColorPalette.kBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  filled: false,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: ColorPalette.kGrayHintText,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: ColorPalette.kGrayHintText,
                    size: 18,
                  ),
                  suffixIcon: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: controller,
                    builder: (_, value, _) {
                      if (value.text.isEmpty) return const SizedBox.shrink();
                      return IconButton(
                        onPressed: () {
                          controller.clear();
                          onClear?.call();
                          onChanged?.call('');
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: ColorPalette.kGrayHintText,
                          size: 18,
                        ),
                        splashRadius: 16,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
