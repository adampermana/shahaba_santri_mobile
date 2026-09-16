import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sahaba_mobile/business_logic/calendar_bloc/calendar_bloc.dart';
import 'package:sahaba_mobile/infrastructure/extension/datetime_extension.dart';
import 'package:sahaba_mobile/injector.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/screens/home/calendar/widgets/calendar_event_list.dart';
import 'package:sahaba_mobile/presentation/screens/home/calendar/widgets/calendar_grid.dart';
import 'package:sahaba_mobile/presentation/screens/home/calendar/widgets/calendar_nav_header.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<CalendarBloc>()..add(const CalendarEvent.loadHolidays()),
      child: const _CalendarView(),
    );
  }
}

class _CalendarView extends StatelessWidget {
  const _CalendarView();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar.buildAppBarSimple(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 40,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: SizedBox.shrink(),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: ColorPalette.kWhite,
            size: 22,
          ),
          padding: const EdgeInsets.only(left: 16),
          constraints: const BoxConstraints.tightFor(width: 40, height: 40),
          splashRadius: 20,
        ),
        titleWidget: Text(
          'Kalendar Hijriah',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: ColorPalette.kWhite,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          final currentYear = DateTime.now().year;
          final monthName = DateFormat.MMMM('id').format(state.focusedMonth);
          final gregorianHeader = '$monthName ${state.focusedMonth.year}';
          final hijriHeader = state.selectedDate.hijriDateId();
          final isFirstMonthInYear =
              state.focusedMonth.year == currentYear &&
              state.focusedMonth.month == DateTime.january;
          final isLastMonthInYear =
              state.focusedMonth.year == currentYear &&
              state.focusedMonth.month == DateTime.december;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: Colors.white.withValues(alpha: 0.16),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0x28E8E8E8),
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 32,
                        ),
                        BoxShadow(
                          color: Color(0x11000000),
                          blurRadius: 16,
                        ),
                        BoxShadow(
                          color: Color(0x0A000000),
                          blurRadius: 5,
                        ),
                        BoxShadow(
                          color: Color(0x02000000),
                          blurRadius: 6,
                        ),
                        BoxShadow(
                          color: Color(0x00000000),
                          blurRadius: 6,
                          offset: Offset(1, 0),
                          spreadRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CalendarNavHeader(
                          hijriDate: hijriHeader,
                          gregorianDate: gregorianHeader,
                          onPrevious: isFirstMonthInYear
                              ? null
                              : () => context.read<CalendarBloc>().add(
                                  const CalendarEvent.changeMonth(-1),
                                ),
                          onNext: isLastMonthInYear
                              ? null
                              : () => context.read<CalendarBloc>().add(
                                  const CalendarEvent.changeMonth(1),
                                ),
                        ),
                        CalendarGrid(
                          focusedMonth: state.focusedMonth,
                          selectedDate: state.selectedDate,
                          eventDays: state.eventDaysInMonth,
                          onDayTap: (date) => context.read<CalendarBloc>().add(
                            CalendarEvent.selectDate(date),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (state.eventsInMonth.isNotEmpty) ...[
                  CalendarEventList(
                    events: state.eventsInMonth,
                    selectedDate: state.selectedDate,
                    onEventTap: (event) {
                      context.read<CalendarBloc>().add(
                        CalendarEvent.selectDate(
                          DateTime(event.year, event.month, event.dayOfMonth),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                ],
                if (state.isLoading)
                  const Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                if (state.errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Text(
                        state.errorMessage,
                        style: const TextStyle(
                          color: ColorPalette.error,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
