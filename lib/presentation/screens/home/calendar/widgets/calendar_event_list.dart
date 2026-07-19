import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahaba_mobile/domains/calendar/islamic_holiday_model.dart';
import 'package:sahaba_mobile/infrastructure/extension/datetime_extension.dart';
import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class CalendarEventList extends StatelessWidget {
  const CalendarEventList({
    required this.events,
    super.key,
    this.selectedDate,
    this.onEventTap,
  });

  final List<IslamicHolidayModel> events;
  final DateTime? selectedDate;
  final ValueChanged<IslamicHolidayModel>? onEventTap;

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) return const SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        // borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 2,
          ),
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 4,
          ),
        ],
      ),
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: List.generate(events.length, (index) {
          final event = events[index];
          final isFirst = index == 0;
          final isLast = index == events.length - 1;
          final eventDate = DateTime(event.year, event.month, event.dayOfMonth);
          final isSelected =
              selectedDate != null &&
              eventDate.year == selectedDate!.year &&
              eventDate.month == selectedDate!.month &&
              eventDate.day == selectedDate!.day;

          return _EventRow(
            event: event,
            isFirst: isFirst,
            isSelected: isSelected,
            isLast: isLast,
            onTap: onEventTap == null ? null : () => onEventTap!(event),
          );
        }),
      ),
    );
  }
}

class _EventRow extends StatelessWidget {
  const _EventRow({
    required this.event,
    required this.isFirst,
    required this.isSelected,
    required this.isLast,
    required this.onTap,
  });

  final IslamicHolidayModel event;
  final bool isFirst;
  final bool isSelected;
  final bool isLast;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final eventDate = DateTime(event.year, event.month, event.dayOfMonth);
    final dateStr = DateFormat('d MMM yyyy', 'id').format(eventDate);
    final hijriDateStr = eventDate.hijriDateId();

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.08)
              : ColorPalette.scaffoldBackground,
          border: isLast
              ? null
              : const Border(
                  bottom: BorderSide(
                    color: ColorPalette.borderTransparent,
                  ),
                ),
          // borderRadius: isFirst
          //     ? const BorderRadius.vertical(top: Radius.circular(8))
          //     : isLast
          //     ? BorderRadius.zero
          //     : BorderRadius.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: context.isTabletLarge
                  ? null
                  : context.isTabletMedium
                  ? null
                  : context.isTabletSmall
                  ? null
                  : context.isPhoneLarge
                  ? 190
                  : context.isPhoneMedium
                  ? 190
                  : context.isPhoneSmall
                  ? 190
                  : 190,
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: context.isTabletLarge
                          ? 16
                          : context.isTabletMedium
                          ? 16
                          : context.isTabletSmall
                          ? 16
                          : context.isPhoneLarge
                          ? 14
                          : context.isPhoneMedium
                          ? 14
                          : context.isPhoneSmall
                          ? 14
                          : 14,
                      color: isSelected
                          ? ColorPalette.kWhite
                          : ColorPalette.kWhite,
                    ),
                  ),
                  Text(
                    event.type == 'holiday' ? 'Hari Libur' : 'Cuti Bersama',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: isSelected
                          ? const Color(0xFFDDDDDD)
                          : ColorPalette.inverseSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  dateStr,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isSelected
                        ? ColorPalette.kWhite
                        : ColorPalette.primaryColor,
                  ),
                ),
                Text(
                  hijriDateStr,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: isSelected
                        ? const Color(0xFFDDDDDD)
                        : ColorPalette.inverseSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
