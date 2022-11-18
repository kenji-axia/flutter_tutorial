import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/schedule/view_model/calendar_state_providers.dart';
import 'package:flutter_tutorial/schedule/view_model/all_schedules_stream_provider.dart';
import 'calendar_header.dart';

class BuildCalendar extends ConsumerStatefulWidget {
  const BuildCalendar({super.key});

  @override
  BuildCalendarState createState() => BuildCalendarState();
}

class BuildCalendarState extends ConsumerState<BuildCalendar> {
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  late PageController _pageController;
  DateTime? _selectedDay;

  Widget? buildMarker(
    BuildContext context,
    DateTime day,
    List<dynamic> events,
  ) {
    if (events.isNotEmpty) {
      return const Icon(
        Icons.circle,
        color: calendarAccentColor,
        size: 12,
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final allSchedules = ref.watch(allSchedulesStreamProvider).value;

    List<dynamic> Function(DateTime) loadSchedules;

    if (allSchedules == null) {
      loadSchedules = (DateTime date) {
        return <dynamic>[];
      };
    } else {
      loadSchedules = (DateTime date) {
        return allSchedules[date] ?? <dynamic>[];
      };
    }

    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius25,
      ),
      height: 360,
      padding: const EdgeInsets.all(spacing2),
      margin: const EdgeInsets.fromLTRB(
        spacing2,
        spacing1,
        spacing2,
        spacing4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder<DateTime>(
            valueListenable: _focusedDay,
            builder: (context, value, _) {
              return CalendarHeader(
                focusedDay: value,
                onTodayButtonTap: () {
                  setState(() => _focusedDay.value = DateTime.now());
                },
                onLeftArrowTap: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                onRightArrowTap: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              );
            },
          ),
          TableCalendar<dynamic>(
            headerVisible: false,
            eventLoader: loadSchedules,
            firstDay: calendarFirstDay,
            lastDay: calendarLastDay,
            focusedDay: _focusedDay.value,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekHeight: 30,
            rowHeight: 40,
            availableGestures: AvailableGestures.horizontalSwipe,
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (DateTime date, dynamic locale) {
                return DateFormat.E('ja').format(date);
              },
              weekdayStyle: calendarTextStyle,
              weekendStyle: calendarTextStyle,
            ),
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: calendarAccentColor,
                shape: BoxShape.circle,
              ),
              todayTextStyle: calendarTextStyle,
              defaultTextStyle: calendarTextStyle,
              weekendTextStyle: calendarTextStyle,
              outsideDaysVisible: false,
            ),
            calendarBuilders: CalendarBuilders<dynamic>(
              markerBuilder: buildMarker,
            ),
            selectedDayPredicate: (_) => false,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                _selectedDay = selectedDay;
                _focusedDay.value = focusedDay;
                ref.read(selectedDateStateProvider.notifier).state =
                    selectedDay;
              }
            },
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            onCalendarCreated: (controller) => _pageController = controller,
          ),
        ],
      ),
    );
  }
}
