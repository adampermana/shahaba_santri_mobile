import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';

// Jarak label (title) dari tepi bawah area konten bar.
// Dipakai bareng oleh _RegularNavBarItem dan _FeaturedNavBarItem
// supaya posisi teks keduanya SELALU sejajar, apapun iconSize-nya.
const double kNavLabelBottomOffset = 10;

class BottomNavigationItemsBar extends StatefulWidget {
  const BottomNavigationItemsBar({
    required this.items,
    required this.onChanged,
    super.key,
    this.barHeight = 82,
    this.barWidth,
    this.iconSize = 26,
    this.featuredIconSize = 34,
    this.backgroundColor = const Color(0xFF0F172A),
    this.selectedColor = Colors.white,
    this.unselectedColor = const Color(0xFFA7A9AF),
    this.featuredColor = const Color(0xFF078D5E),
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
  final double featuredIconSize;
  final Color backgroundColor;
  final Color selectedColor;
  final Color unselectedColor;
  final Color featuredColor;
  final List<NavBarItem> items;
  final ValueChanged<int> onChanged;
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

    // Featured item (index 1) should not update nav bar selection
    if (index != 1) {
      setState(() => _currentIndex = index);
    }
    widget.onChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return SizedBox(
      width: widget.barWidth,
      height: widget.barHeight + 44 + bottomPadding,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomPaint(
              painter: _BottomNavBarPainter(
                color: widget.backgroundColor,
                shadowColor: const Color(0xFF3A4050),
              ),
              child: SizedBox(
                height: widget.barHeight + bottomPadding + 18,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 14,
                    bottom: bottomPadding,
                  ),
                  child: Row(
                    children: List.generate(
                      widget.items.length,
                      (index) {
                        final item = widget.items[index];
                        final isSelected = _currentIndex == index;

                        if (item.isFeatured) {
                          // tanya sahaba
                          return _FeaturedNavBarItem(
                            item: item,
                            isSelected: isSelected,
                            featuredColor: widget.featuredColor,
                            selectedColor: widget.selectedColor,
                            unselectedColor: widget.unselectedColor,
                            iconSize: widget.featuredIconSize,
                            selectedLabelStyle: widget.selectedLabelStyle,
                            unselectedLabelStyle: widget.unselectedLabelStyle,
                            onTap: () => _onTap(index),
                          );
                        }

                        return _RegularNavBarItem(
                          item: item,
                          isSelected: isSelected,
                          selectedColor: widget.selectedColor,
                          unselectedColor: widget.unselectedColor,
                          iconSize: widget.iconSize,
                          selectedLabelStyle: widget.selectedLabelStyle,
                          unselectedLabelStyle: widget.unselectedLabelStyle,
                          onTap: () => _onTap(index),
                        );
                      },
                    ),
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

class _BottomNavBarPainter extends CustomPainter {
  const _BottomNavBarPainter({
    required this.color,
    required this.shadowColor,
  });

  final Color color;
  final Color shadowColor;

  @override
  void paint(Canvas canvas, Size size) {
    const topY = 26.0;

    /// Floating container = 76x76
    /// Radius = 38
    ///
    /// Gunakan radius 38 supaya notch mengikuti bagian LUAR
    /// floating button.
    const notchRadius = 38.0;

    final centerX = size.width / 2;

    final notchRect = Rect.fromCircle(
      center: Offset(centerX, topY),
      radius: notchRadius,
    );

    final topPath = Path()
      ..moveTo(0, topY)
      /// Garis kiri sampai tepat ke lingkaran
      ..lineTo(centerX - notchRadius, topY)
      /// Setengah lingkaran bagian bawah
      ..arcTo(
        notchRect,
        math.pi,
        -math.pi,
        false,
      )
      /// Lanjut garis kanan
      ..lineTo(size.width, topY);

    final backgroundPath = Path()
      ..addPath(topPath, Offset.zero)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    /// SHADOW
    final shadowPaint = Paint()
      ..color = shadowColor.withValues(alpha: 0.45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        5,
      )
      ..isAntiAlias = true;

    canvas.drawPath(
      topPath.shift(const Offset(0, -1)),
      shadowPaint,
    );

    /// BACKGROUND
    final backgroundPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.drawPath(
      backgroundPath,
      backgroundPaint,
    );

    /// BORDER
    final borderPaint = Paint()
      ..color = shadowColor.withValues(alpha: 0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..isAntiAlias = true;

    canvas.drawPath(topPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _BottomNavBarPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.shadowColor != shadowColor;
  }
}

class _RegularNavBarItem extends StatelessWidget {
  const _RegularNavBarItem({
    required this.item,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.iconSize,
    required this.onTap,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
  });

  final NavBarItem item;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final double iconSize;
  final VoidCallback onTap;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? selectedColor : unselectedColor;
    final svgPath = isSelected ? item.selectedSvgPath : item.defaultSvgPath;

    final labelStyle = isSelected
        ? selectedLabelStyle ??
              TextStyle(
                color: selectedColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.2,
              )
        : unselectedLabelStyle ??
              TextStyle(
                color: unselectedColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.2,
              );

    return Expanded(
      child: Semantics(
        button: true,
        selected: isSelected,
        label: item.title,
        // ClipRect membatasi ripple/hover supaya tidak "tembus" keluar
        // dari area item ini (misalnya menutupi notch atau item sebelah).
        child: ClipRect(
          child: GestureDetector(
            onTap: onTap,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Icon diposisikan di atas label, dengan jarak 7 dari label
                // (sama seperti spacing SizedBox(height: 7) versi sebelumnya)
                Positioned(
                  bottom: kNavLabelBottomOffset + 17 + 7,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOut,
                    scale: isSelected ? 1.05 : 1,
                    child: CacheImageOrSvg(
                      source: svgPath,
                      width: iconSize,
                      height: iconSize,
                      colorAsset: color,
                    ),
                  ),
                ),
                // Label anchored ke bottom, sama persis dengan featured item.
                Positioned(
                  left: 4,
                  right: 4,
                  bottom: kNavLabelBottomOffset,
                  child: Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: labelStyle,
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

class _FeaturedNavBarItem extends StatelessWidget {
  const _FeaturedNavBarItem({
    required this.item,
    required this.isSelected,
    required this.featuredColor,
    required this.selectedColor,
    required this.unselectedColor,
    required this.iconSize,
    required this.onTap,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
  });

  final NavBarItem item;
  final bool isSelected;
  final Color featuredColor;
  final Color selectedColor;
  final Color unselectedColor;
  final double iconSize;
  final VoidCallback onTap;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;

  @override
  Widget build(BuildContext context) {
    final svgPath = isSelected ? item.selectedSvgPath : item.defaultSvgPath;

    final labelStyle = isSelected
        ? selectedLabelStyle ??
              TextStyle(
                color: selectedColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                height: 1.2,
              )
        : unselectedLabelStyle ??
              TextStyle(
                color: unselectedColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.2,
              );

    return Expanded(
      child: Semantics(
        button: true,
        selected: isSelected,
        label: item.title,
        // Item tengah (featured) tidak memakai efek hover/ripple sama sekali,
        // cukup GestureDetector polos untuk menangani tap.
        child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: -22,
                child: AnimatedScale(
                  scale: isSelected ? 1.06 : 1,
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutBack,
                  child: Container(
                    width: 75,
                    height: 75,
                    padding: const EdgeInsets.all(8),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOut,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        gradient: RadialGradient(
                          center: Alignment(0.50, 0.50),
                          radius: 2,
                          colors: [
                            Color(0xFF007D56),
                            Color(0xFF051D12),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 0,
                            child: CacheImageOrSvg(
                              source: svgPath,
                              width: 57.61,
                              height: 55.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Label anchored ke bottom dengan nilai IDENTIK ke
              // _RegularNavBarItem (kNavLabelBottomOffset), supaya
              // kedua label selalu sejajar apapun iconSize-nya.
              Positioned(
                left: 4,
                right: 4,
                bottom: kNavLabelBottomOffset,
                child: Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: labelStyle,
                ),
              ),
            ],
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
    this.isFeatured = false,
  });

  final String defaultSvgPath;
  final String selectedSvgPath;
  final String title;
  final bool isFeatured;
}
