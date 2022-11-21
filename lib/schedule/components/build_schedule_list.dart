import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/schedule/schedule_state_notifier.dart';
import 'package:flutter_tutorial/schedule/model/schedule_model.dart';
import 'build_schedule_item.dart';

class BuildScheduleList extends ConsumerWidget {
  const BuildScheduleList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate =
        ref.watch(scheduleStateNotifier.select((state) => state.selectedDate));
    // final allSchedules = ref.watch(allSchedulesStreamProvider).value;
    final allSchedules =
        ref.watch(scheduleStateNotifier).getAllSchedulesHashMap();
    List<ScheduleModel> selectedDateSchedules;

    if (allSchedules == null) {
      selectedDateSchedules = <ScheduleModel>[];
    } else {
      selectedDateSchedules = allSchedules[selectedDate] ?? <ScheduleModel>[];
    }

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
          BuildScheduleItem(scheduleModel: schedule)
      ],
    );
  }
}
