import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/schedule/schedule_state_notifier.dart';
import 'package:flutter_tutorial/schedule/model/schedule_model.dart';
import 'calendar_header.dart';

class CalendarSection extends ConsumerStatefulWidget {
  const CalendarSection({super.key});

  @override
  CalendarSectionState createState() => CalendarSectionState();
}

class CalendarSectionState extends ConsumerState<CalendarSection> {
  late PageController _pageController;

  // 予定のある日にマークをつける際に使用
  Widget? buildMarker(
    BuildContext context,
    DateTime day,
    List<dynamic> events,
  ) {
    if (events.isEmpty) {
      return null;
    }
    return const Icon(
      Icons.circle,
      color: calendarAccentColor,
      size: 12,
    );
  }

  @override
  Widget build(BuildContext context) {
    // カレンダーが表示している月
    final focusedMonth = ref.watch(
      scheduleStateNotifierProvider.select((state) => state.focusedMonth),
    );

    final allSchedules =
        ref.watch(scheduleStateNotifierProvider).getAllSchedulesHashMap();

    List<ScheduleModel> loadSchedules(DateTime date) {
      return allSchedules[date] ?? <ScheduleModel>[];
    }

    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius25,
      ),
      height: 360,
      padding: const EdgeInsets.all(space16),
      margin: const EdgeInsets.fromLTRB(
        space16,
        space8,
        space16,
        space32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CalendarHeader(
            onLeftArrowTap: () => _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            ),
            onRightArrowTap: () => _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            ),
          ),
          TableCalendar<dynamic>(
            headerVisible: false,
            eventLoader: loadSchedules,
            firstDay: calendarFirstDay,
            lastDay: calendarLastDay,
            // カレンダーが表示する月を設定
            focusedDay: focusedMonth,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekHeight: 30,
            rowHeight: 40,
            availableGestures: AvailableGestures.horizontalSwipe,
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (DateTime date, dynamic _) =>
                  DateFormat.E('ja').format(date),
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
              // 予定のある日にマークをつける
              markerBuilder: buildMarker,
            ),
            selectedDayPredicate: (_) => false,
            onDaySelected: (selectedDay, _) {
              // 選択した日付が、現在選択されている日付と異なれば更新
              final beforeSelectedDate =
                  ref.read(scheduleStateNotifierProvider).selectedDate;
              if (!isSameDay(beforeSelectedDate, selectedDay)) {
                ref
                    .read(scheduleStateNotifierProvider.notifier)
                    .updateSelectedDate(selectedDay);
              }
            },
            onPageChanged: (newFocusedMonth) => ref
                .read(scheduleStateNotifierProvider.notifier)
                .updateFocusedMonth(newFocusedMonth),
            onCalendarCreated: (controller) => _pageController = controller,
          ),
        ],
      ),
    );
  }
}
