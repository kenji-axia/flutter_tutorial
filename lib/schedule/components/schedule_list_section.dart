import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/schedule/schedule_state_notifier.dart';
import 'package:flutter_tutorial/schedule/model/schedule_model.dart';
import 'schedule_item.dart';

class ScheduleListSection extends ConsumerWidget {
  const ScheduleListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(
      scheduleStateNotifierProvider.select((state) => state.selectedDate),
    );
    final allSchedules =
        ref.watch(scheduleStateNotifierProvider).getAllSchedulesHashMap();
    final selectedDateSchedules =
        allSchedules[selectedDate] ?? <ScheduleModel>[];

    if (selectedDateSchedules.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(
          child: Text('登録しているTodoはありません'),
        ),
      );
    }

    return Column(
      children: [
        for (var schedule in selectedDateSchedules)
          ScheduleItem(scheduleModel: schedule)
      ],
    );
  }
}
