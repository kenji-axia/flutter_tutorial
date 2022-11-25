import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/db/app_database.dart';
import 'package:flutter_tutorial/schedule/repository/db_repository.dart';
import 'package:flutter_tutorial/schedule/state/schedule_state.dart';

import 'model/schedule_model.dart';

final scheduleStateNotifierProvider =
    StateNotifierProvider.autoDispose<ScheduleStateNotifier, ScheduleState>(
  (ref) => ScheduleStateNotifier(ref.read),
);

class ScheduleStateNotifier extends StateNotifier<ScheduleState> {
  ScheduleStateNotifier(this._reader)
      : super(
          ScheduleState(
            selectedDate: DateTime.now(),
            focusedMonth: DateTime.now(),
          ),
        ) {
    watchAllSchedules();
  }

  final Reader _reader;

  void watchAllSchedules() {
    // DBの全ての予定をlisten
    // 変更が送られてきたらstate（allTags・allSchedules）を更新
    _reader(dbRepositoryProvider).watchAllSchedules().listen((schedules) {
      final newAllTags = <String>{};
      final newAllSchedules = <ScheduleModel>[];

      for (var i = 0; i < schedules.length; i++) {
        final schedule = schedules[i];

        // driftで自動生成された各予定のSchedule型を、
        // viewで使うためにimmutableなScheduleModel型に変換
        final scheduleModel = ScheduleModel(
          scheduleId: schedule.id,
          tag: schedule.tag,
          body: schedule.body,
          date: schedule.date,
          createdAt: schedule.createdAt,
        );

        newAllTags.add(schedule.tag);
        newAllSchedules.add(scheduleModel);
      }

      if (mounted) {
        state = state.copyWith(
          allTags: newAllTags,
          allSchedules: newAllSchedules,
        );
      }
    });
  }

  void updateSelectedTag(String selectedTag) {
    state = state.copyWith(
      selectedTag: selectedTag,
    );
  }

  void updateSelectedDate(DateTime selectedDate) {
    state = state.copyWith(
      selectedDate: selectedDate,
    );
  }

  void updateFocusedMonth(DateTime currentMonth) {
    state = state.copyWith(
      focusedMonth: currentMonth,
    );
  }

  void addSchedule(DateTime date, String tag, String body) {
    _reader(dbRepositoryProvider).addSchedule(date, tag, body);
  }

  void deleteSchedule(ScheduleModel scheduleModel) {
    _reader(dbRepositoryProvider).deleteSchedule(
      // DB側で扱うSchedule型に変換
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
    _reader(dbRepositoryProvider).updateSchedule(
      // DB側で扱うSchedule型に変換
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
