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
      return Center(
        child: Text(
          '${date.day}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorPalette.contentTertiary,
          ),
        ),
      );
    }

    // Day name headers
    for (var i = 0; i < _dayNames.length; i++) {
      final name = _dayNames[i];
      final isSunday = i == 6;
      cells.add(
        Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isSunday ? const Color(0xFFD44333) : ColorPalette.kBlack,
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

    // Trailing cells to complete 6 rows of dates (42 date cells)
    // + 1 header row = 49 cells total
    final totalCells = cells.length;
    final remaining = 49 - totalCells;
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
              gradient: isSelected
                  ? const LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF09383B), Color(0xFF1898A1)],
                    )
                  : null,
              color: isSelected
                  ? null
                  : isToday
                  ? Colors.white.withValues(alpha: 0.20)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: isSelected
                ? Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '$day',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: ColorPalette.kWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 3,
                        child: Container(
                          width: 4,
                          height: 4,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      '$day',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorPalette.contentTertiary,
                      ),
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
          if (hasEvent && isSelected) const SizedBox(height: 6),
        ],
      ),
    );
  }
}
