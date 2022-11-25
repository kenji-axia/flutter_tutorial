import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/schedule/schedule_state_notifier.dart';

class SelectedDateLabel extends ConsumerWidget {
  const SelectedDateLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(
      scheduleStateNotifierProvider.select((state) => state.selectedDate),
    );
    var dateLabelText = '${DateFormat.MMMEd('ja').format(selectedDate)}の予定';

    if (isSameDay(selectedDate, today)) {
      dateLabelText += '（Today）';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: space16),
      child: Text(
        dateLabelText,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
