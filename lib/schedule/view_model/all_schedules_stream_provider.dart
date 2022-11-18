import 'dart:async';
import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_tutorial/schedule/model/schedule_model.dart';
import 'package:flutter_tutorial/schedule/repository/db_repository.dart';
import 'calendar_state_providers.dart';

final allSchedulesStreamProvider = StreamProvider.autoDispose((ref) {
  final allSchedulesStreamController =
      StreamController<HashMap<DateTime, List<ScheduleModel>>>();

  ref.onDispose(allSchedulesStreamController.close);

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  // 現在選択されているタグ
  final tagState = ref.watch(tagStateProvider);

  // リポジトリから全ての予定を受け取って、viewで扱う形式にして再びsink
  ref.read(dbRepositoryProvider).watchAllSchedules().listen((schedules) {
    // viewで扱うHashMap（HashMapにすると普通のMapより効率的に使用できます）
    final schedulesHashMap = HashMap<DateTime, List<ScheduleModel>>(
      equals: isSameDay,
      hashCode: getHashCode,
    );
    // タグ一覧を格納するSet
    final tags = <String>{};

    if (schedules.isNotEmpty) {
      // HashMapのkeyに格納していく日付
      var keyDate = schedules[0].date;
      // HashMapのvalueに格納していくリスト
      var scheduleModelList = <ScheduleModel>[];

      for (var i = 0; i < schedules.length; i++) {
        final schedule = schedules[i];

        tags.add(schedule.tag);

        // 個々の予定をviewで扱うModelに変換
        final scheduleModel = ScheduleModel(
          scheduleId: schedule.id,
          tag: schedule.tag,
          body: schedule.body,
          date: schedule.date,
          createdAt: schedule.createdAt,
        );

        // 参照していた日付が変わった場合、
        // それまで作ったリストをHashMapに格納して、リストと参照している日付を更新
        if (keyDate != schedule.date) {
          schedulesHashMap.addAll({
            keyDate: scheduleModelList,
          });
          keyDate = schedule.date;
          scheduleModelList = <ScheduleModel>[];
        }

        if (tagState == '全て' || tagState == schedule.tag) {
          scheduleModelList.add(scheduleModel);
        }

        // 最後の場合、それまで作ったリストをHashMapに格納
        if (i == schedules.length - 1) {
          schedulesHashMap.addAll({
            keyDate: scheduleModelList,
          });
        }
      }
    }

    ref.read(tagSetStateProvider.notifier).state = tags;

    if (!allSchedulesStreamController.isClosed) {
      allSchedulesStreamController.sink.add(schedulesHashMap);
    }
  });

  return allSchedulesStreamController.stream;
});
