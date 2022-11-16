import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/calendar/view_model/calendar_state_providers.dart';

class BuildDateLabel extends ConsumerWidget {
  const BuildDateLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateStateProvider);
    var dateLabelText = '${DateFormat.MMMEd('ja').format(selectedDate)}の予定';
    if (isSameDay(selectedDate, today)) {
      dateLabelText += '（Today）';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: spacing2),
      child: Text(
        dateLabelText,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
