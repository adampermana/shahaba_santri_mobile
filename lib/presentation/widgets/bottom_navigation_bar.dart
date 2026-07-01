import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class BottomNavigationItemsBar extends StatefulWidget {
  const BottomNavigationItemsBar({
    required this.items,
    required this.onChanged,
    super.key,
    this.barHeight = 78,
    this.barWidth,
    this.iconSize = 24,
    this.backgroundColor = ColorPalette.kWhite,
    this.selectedColor = ColorPalette.primaryColor,
    this.unselectedColor = ColorPalette.contentDisabled,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.initialIndex = 0,
  }) : assert(
         items.length >= 2 && items.length <= 5,
         'NavBarItems must contain between 2 and 5 items',
       );

  final double barHeight;
  final double? barWidth;
  final double iconSize;
  final Color backgroundColor;
  final List<NavBarItem> items;
  final ValueChanged<int> onChanged;
  final Color selectedColor;
  final Color unselectedColor;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final int initialIndex;

  @override
  State<BottomNavigationItemsBar> createState() =>
      _BottomNavigationItemsBarState();
}

class _BottomNavigationItemsBarState extends State<BottomNavigationItemsBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  void didUpdateWidget(covariant BottomNavigationItemsBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialIndex != widget.initialIndex) {
      _currentIndex = widget.initialIndex;
    }
  }

  void _onTap(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);
    widget.onChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.barWidth,
      decoration: const BoxDecoration(
        color: ColorPalette.kWhite,
        border: Border(
          top: BorderSide(color: ColorPalette.borderTransparent),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: widget.barHeight,
          child: Row(
            children: List.generate(
              widget.items.length,
              (index) => _NavBarItemWidget(
                item: widget.items[index],
                isSelected: _currentIndex == index,
                iconSize: widget.iconSize,
                selectedColor: widget.selectedColor,
                unselectedColor: widget.unselectedColor,
                selectedLabelStyle: widget.selectedLabelStyle,
                unselectedLabelStyle: widget.unselectedLabelStyle,
                onTap: () => _onTap(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBarItemWidget extends StatelessWidget {
  const _NavBarItemWidget({
    required this.item,
    required this.isSelected,
    required this.iconSize,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onTap,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
  });

  final NavBarItem item;
  final bool isSelected;
  final double iconSize;
  final Color selectedColor;
  final Color unselectedColor;
  final VoidCallback onTap;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? selectedColor : unselectedColor;
    final svgPath = isSelected ? item.selectedSvgPath : item.defaultSvgPath;
    final textStyle = isSelected
        ? selectedLabelStyle ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorPalette.primaryColor,
              )
        : unselectedLabelStyle ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorPalette.contentDisabled,
              );

    return Expanded(
      child: Semantics(
        button: true,
        selected: isSelected,
        label: item.title,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  svgPath,
                  width: iconSize,
                  height: iconSize,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
                const SizedBox(height: 4),
                Text(
                  item.title,
                  style: textStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  width: isSelected ? 10 : 0,
                  height: 4,
                  decoration: BoxDecoration(
                    color: selectedColor,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavBarItem {
  const NavBarItem({
    required this.defaultSvgPath,
    required this.selectedSvgPath,
    required this.title,
  });

  final String defaultSvgPath;
  final String selectedSvgPath;
  final String title;
}
