import 'dart:async';
import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_tutorial/calendar/model/schedule_model.dart';
import 'package:flutter_tutorial/calendar/repository/db_repository.dart';
import 'calendar_state_providers.dart';

final allSchedulesStreamProvider = StreamProvider.autoDispose((ref) {
  final allSchedulesStreamController =
      StreamController<LinkedHashMap<DateTime, List<ScheduleModel>>>();

  ref.onDispose(allSchedulesStreamController.close);

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  final tagState = ref.watch(tagStateProvider);

  ref.read(dbRepositoryProvider).watchAllSchedules().listen((schedules) {
    final schedulesLinkedHashMap = LinkedHashMap<DateTime, List<ScheduleModel>>(
      equals: isSameDay,
      hashCode: getHashCode,
    );
    final tags = <String>{};

    if (schedules.isNotEmpty) {
      var scheduleModelList = <ScheduleModel>[];
      var keyDate = schedules[0].date;

      for (var i = 0; i < schedules.length; i++) {
        final schedule = schedules[i];

        tags.add(schedule.tag);

        if (tagState != '全て' && tagState != schedule.tag) {
          if (keyDate == schedule.date) {
            // scheduleModelList.add(scheduleModel);
          } else {
            schedulesLinkedHashMap.addAll({
              keyDate: scheduleModelList,
            });
            keyDate = schedule.date;
            scheduleModelList = <ScheduleModel>[];
          }

          if (i == schedules.length - 1) {
            schedulesLinkedHashMap.addAll({
              keyDate: scheduleModelList,
            });
          }
          continue;
        }

        final scheduleModel = ScheduleModel(
          scheduleId: schedule.id,
          tag: schedule.tag,
          body: schedule.body,
          date: schedule.date,
          createdAt: schedule.createdAt,
        );

        if (keyDate == schedule.date) {
          scheduleModelList.add(scheduleModel);
        } else {
          schedulesLinkedHashMap.addAll({
            keyDate: scheduleModelList,
          });
          keyDate = schedule.date;
          scheduleModelList = [scheduleModel];
        }

        if (i == schedules.length - 1) {
          schedulesLinkedHashMap.addAll({
            keyDate: scheduleModelList,
          });
        }
      }
    }

    ref.read(tagSetStateProvider.notifier).state = tags;

    if (!allSchedulesStreamController.isClosed) {
      allSchedulesStreamController.sink.add(schedulesLinkedHashMap);
    }
  });

  return allSchedulesStreamController.stream;
});
