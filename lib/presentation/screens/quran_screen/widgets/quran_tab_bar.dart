import 'package:flutter/material.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class QuranTabBar extends StatelessWidget {
  const QuranTabBar({
    required this.currentIndex,
    required this.onTabChanged,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTabChanged;

  static const _tabs = ['Surat', 'Juz'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorPalette.borderTransparent,
          ),
        ),
      ),
      child: Row(
        children: List.generate(_tabs.length, (index) {
          final isActive = index == currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(index),
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: isActive
                      ? const Border(
                          bottom: BorderSide(
                            color: ColorPalette.primaryColor,
                            width: 2,
                          ),
                        )
                      : null,
                ),
                child: Center(
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                      color: isActive
                          ? ColorPalette.primaryColor
                          : ColorPalette.kBlack,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
