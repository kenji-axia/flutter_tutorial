import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_tutorial/schedule/model/schedule_model.dart';

part 'schedule_state.freezed.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    required DateTime selectedDate,
    required DateTime focusedMonth,
    @Default('全て') String selectedTag,
    @Default(<String>{}) Set<String> allTags,
    @Default(<ScheduleModel>[]) List<ScheduleModel> allSchedules,
  }) = _ScheduleState;
  const ScheduleState._();

  // List型のallSchedulesを、Viewで扱うためにHashMapにして返す
  // key: 日付（DateTime型）,  value: keyの予定のリスト（List<ScheduleModel>）
  HashMap<DateTime, List<ScheduleModel>> getAllSchedulesHashMap() {
    int getHashCode(DateTime key) {
      return key.day * 1000000 + key.month * 10000 + key.year;
    }

    // HashMapにequalsとhashCodeを設定すると、
    // HashMapで追加や指定されたkeyの値をとってくる際、
    // 1.直接keyを比較するのではなくkeyから作成されたhashCodeを用いて比較
    // 2.hashCodeが同じ場合、equalsを用いて同じかどうか判断を行う
    // ため、keyが複雑なオブジェクトで比較するのにコストがかかる場合に効率的になります
    // (table_calendarパッケージが設定を推奨）
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
