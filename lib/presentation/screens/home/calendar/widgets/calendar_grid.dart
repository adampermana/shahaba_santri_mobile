import 'package:flutter/material.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class CalendarGrid extends StatelessWidget {
  const CalendarGrid({
    required this.focusedMonth,
    required this.selectedDate,
    required this.eventDays,
    required this.onDayTap,
    super.key,
  });

  final DateTime focusedMonth;
  final DateTime selectedDate;
  final Set<int> eventDays;
  final ValueChanged<DateTime> onDayTap;

  static const _dayNames = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(focusedMonth.year, focusedMonth.month);
    final lastDay = DateTime(focusedMonth.year, focusedMonth.month + 1, 0);
    // Monday = 1, Sunday = 7; shift to 0-based (Mon=0, Sun=6).
    final startWeekday = firstDay.weekday - 1;
    final daysInMonth = lastDay.day;
    final today = DateTime.now();

    final cells = <Widget>[];
    Widget disabledDayCell(DateTime date) {
      if (date.year != focusedMonth.year) return const SizedBox.shrink();

      return Center(
        child: Text(
          '${date.day}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorPalette.contentDisabled,
          ),
        ),
      );
    }

    // Day name headers
    for (final name in _dayNames) {
      cells.add(
        Center(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: ColorPalette.primaryColor,
            ),
          ),
        ),
      );
    }

    // Empty cells before first day
    for (var i = 0; i < startWeekday; i++) {
      final prevDate = firstDay.subtract(Duration(days: startWeekday - i));
      cells.add(disabledDayCell(prevDate));
    }

    // Day cells
    for (var day = 1; day <= daysInMonth; day++) {
      final date = DateTime(focusedMonth.year, focusedMonth.month, day);
      final isSelected =
          date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day;
      final isToday =
          date.year == today.year &&
          date.month == today.month &&
          date.day == today.day;
      final hasEvent = eventDays.contains(day);

      cells.add(
        _CalendarDayCell(
          day: day,
          isSelected: isSelected,
          isToday: isToday && !isSelected,
          hasEvent: hasEvent,
          onTap: () => onDayTap(date),
        ),
      );
    }

    // Trailing cells to complete last row
    final totalCells = cells.length;
    final remaining = (7 - (totalCells % 7)) % 7;
    for (var i = 1; i <= remaining; i++) {
      final nextDate = lastDay.add(Duration(days: i));
      cells.add(disabledDayCell(nextDate));
    }

    return GridView.count(
      crossAxisCount: 7,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: cells,
    );
  }
}

class _CalendarDayCell extends StatelessWidget {
  const _CalendarDayCell({
    required this.day,
    required this.isSelected,
    required this.isToday,
    required this.hasEvent,
    required this.onTap,
  });

  final int day;
  final bool isSelected;
  final bool isToday;
  final bool hasEvent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorPalette.primaryColor
                  : isToday
                  ? ColorPalette.surfaceTertiary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              '$day',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? ColorPalette.kWhite
                    : ColorPalette.contentSecondary,
              ),
            ),
          ),
          if (hasEvent && !isSelected)
            Container(
              margin: const EdgeInsets.only(top: 2),
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: ColorPalette.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          if (hasEvent && isSelected)
            Container(
              margin: const EdgeInsets.only(top: 2),
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: ColorPalette.kWhite,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
