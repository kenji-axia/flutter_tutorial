import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/calendar/schedules_view_model.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class BuildDateLabel extends ConsumerWidget {
  const BuildDateLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(calendarViewModel).selectedDate;
    var dateLabelText = '${DateFormat.MMMEd('ja').format(selectedDate)}の予定';
    if (isSameDay(selectedDate, today)) {
      dateLabelText += '（Today）';
    }
    return Text(
      dateLabelText,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: calendarDarkBlueTextColor,
      ),
    );
  }
}
