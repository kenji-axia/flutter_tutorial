import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/schedule/repository/db_repository.dart';
import 'package:flutter_tutorial/schedule/state/schedule_state.dart';

import '../db/app_database.dart';
import 'model/schedule_model.dart';

final scheduleStateNotifier =
    StateNotifierProvider.autoDispose<ScheduleStateNotifier, ScheduleState>(
        (ref) {
  return ScheduleStateNotifier(ref);
});

class ScheduleStateNotifier extends StateNotifier<ScheduleState> {
  ScheduleStateNotifier(this._ref)
      : super(ScheduleState(selectedDate: DateTime.now())) {
    watchAllSchedules();
  }

  final Ref _ref;

  void watchAllSchedules() {
    // DBの全ての予定を監視
    // driftで生成されたSchedule型を、viewで使うためにimmutableなScheduleModel型に変換
    _ref.read(dbRepositoryProvider).watchAllSchedules().listen((schedules) {
      final allTags = <String>{}; // タグ一覧を格納するSet
      final convertedAllSchedule = <ScheduleModel>[];

      for (var i = 0; i < schedules.length; i++) {
        final schedule = schedules[i];

        // ScheduleModel型に変換
        final scheduleModel = ScheduleModel(
          scheduleId: schedule.id,
          tag: schedule.tag,
          body: schedule.body,
          date: schedule.date,
          createdAt: schedule.createdAt,
        );

        allTags.add(schedule.tag);
        convertedAllSchedule.add(scheduleModel);
      }

      state = state.copyWith(
        allTags: allTags,
        allSchedules: convertedAllSchedule,
      );
    });
  }

  // tagSet（タグ一覧）
  void updateTagSet(Set<String> allTags) {
    state = state.copyWith(
      allTags: allTags,
    );
  }

  // 現在選択されているタグを更新
  void updateTag(String selectedTag) {
    state = state.copyWith(
      selectedTag: selectedTag,
    );
  }

  void updateSelectedDate(DateTime selectedDate) {
    state = state.copyWith(
      selectedDate: selectedDate,
    );
  }

  void addSchedule(DateTime date, String tag, String body) {
    _ref.read(dbRepositoryProvider).addSchedule(date, tag, body);
  }

  void deleteSchedule(ScheduleModel scheduleModel) {
    _ref.read(dbRepositoryProvider).deleteSchedule(
          Schedule(
            id: scheduleModel.scheduleId,
            date: scheduleModel.date,
            tag: scheduleModel.tag,
            body: scheduleModel.body,
            createdAt: scheduleModel.createdAt,
          ),
        );
  }

  void updateSchedule(
    ScheduleModel before,
    DateTime newDate,
    String newTag,
    String newBody,
  ) {
    _ref.read(dbRepositoryProvider).updateSchedule(
          Schedule(
            id: before.scheduleId,
            date: before.date,
            tag: before.tag,
            body: before.body,
            createdAt: before.createdAt,
          ),
          newDate,
          newTag,
          newBody,
        );
  }
}
