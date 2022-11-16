import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/calendar/schedules_view_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_header.dart';

// 以下、UIを作成するために一時的な使用
class Schedule {
  const Schedule({required this.body});
  final String body;
}

final schedules = LinkedHashMap<DateTime, List<Schedule>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_createdDummySchedules);

final _createdDummySchedules = {
  for (var item in List<int>.generate(200, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
      item % 4 + 1,
      (index) => const Schedule(body: 'schedule body'),
    )
}..addAll({
    kToday: [
      const Schedule(body: 'schedule body'),
      const Schedule(body: 'schedule body'),
    ],
  });

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 7, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 7, kToday.day);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<Schedule> _getEventsForDay(DateTime day) {
  print(day);
  return schedules[day] ?? [];
}
// ここまで

class BuildCalendar extends ConsumerStatefulWidget {
  const BuildCalendar({super.key});

  @override
  BuildCalendarState createState() => BuildCalendarState();
}

class BuildCalendarState extends ConsumerState<BuildCalendar> {
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  late PageController _pageController;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
  }

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
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius25,
      ),
      height: 360,
      padding: const EdgeInsets.all(spacing2),
      margin: const EdgeInsets.fromLTRB(
        spacing0,
        spacing1,
        spacing0,
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
          StreamBuilder<bool>(
              stream: ref
                  .watch(calendarViewModel.notifier)
                  .rebuildTableCalendarController
                  .stream,
              builder: (context, snapshot) {
                print('rebuild!');
                return TableCalendar<dynamic>(
                  headerVisible: false,
                  // eventLoader: _getEventsForDay,
                  eventLoader:
                      ref.watch(calendarViewModel.notifier).fetchSchedules,
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
                  selectedDayPredicate: (day) {
                    return false;
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      _selectedDay = selectedDay;
                      _focusedDay.value = focusedDay;
                      ref
                          .read(calendarViewModel.notifier)
                          .selectDate(selectedDay);
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay.value = focusedDay;
                  },
                  onCalendarCreated: (controller) =>
                      _pageController = controller,
                );
              }),
        ],
      ),
    );
  }
}
