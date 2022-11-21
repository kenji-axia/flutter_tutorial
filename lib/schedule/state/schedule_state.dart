import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_tutorial/schedule/model/schedule_model.dart';
import 'package:table_calendar/table_calendar.dart';

part 'schedule_state.freezed.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    required DateTime selectedDate,
    @Default('全て') String selectedTag,
    @Default(<String>{}) Set<String> allTags,
    @Default(<ScheduleModel>[]) List<ScheduleModel> allSchedules,
  }) = _ScheduleState;
  const ScheduleState._();

  // stateに保存されている全ての予定リストを、Viewで扱うためにHashMapにして返す
  // （HashMapにすると普通のMapより効率的に使用できます）
  HashMap<DateTime, List<ScheduleModel>> getAllSchedulesHashMap() {
    int getHashCode(DateTime key) {
      return key.day * 1000000 + key.month * 10000 + key.year;
    }

    final allSchedulesHashMap = HashMap<DateTime, List<ScheduleModel>>(
      equals: isSameDay,
      hashCode: getHashCode,
    );

    if (allSchedules.isNotEmpty) {
      // HashMapのkeyに格納していく日付
      var keyDate = allSchedules[0].date;
      // HashMapのvalueに格納していくリスト
      var scheduleModelList = <ScheduleModel>[];

      for (var i = 0; i < allSchedules.length; i++) {
        final scheduleModel = allSchedules[i];

        // 繰り返す中で、参照していた日付が変わった場合、
        // keyDateとscheduleModelListををHashMapに格納して、更新する
        if (keyDate != scheduleModel.date) {
          allSchedulesHashMap.addAll({
            keyDate: scheduleModelList,
          });
          keyDate = scheduleModel.date;
          scheduleModelList = <ScheduleModel>[];
        }

        if (selectedTag == '全て' || selectedTag == scheduleModel.tag) {
          scheduleModelList.add(scheduleModel);
        }

        // 繰り返し処理が最後の場合、それまで作ったscheduleModelListをHashMapに格納
        if (i == allSchedules.length - 1) {
          allSchedulesHashMap.addAll({
            keyDate: scheduleModelList,
          });
        }
      }
    }

    return allSchedulesHashMap;
  }
}
