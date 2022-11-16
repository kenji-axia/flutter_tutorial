import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_tutorial/constants.dart';
import 'model/schedule_model.dart';
import 'state/calendar_state.dart';

// final tagStateProvider = StateProvider((ref) => '全て');
//
// final selectedDateStateProvider = StateProvider((ref) => DateTime.now());

// final dateLabelProvider = Provider((ref) {
//   DateTime selectedDate = ref.watch(calendarViewModel).selectedDate;
//
//   var labelText = '${DateFormat.MMMEd('ja').format(selectedDate)}の予定';
//
//   if (isSameDay(selectedDate, today)) {
//     labelText += '（Today）';
//   }
//
//   return labelText;
// });

final calendarViewModel =
    StateNotifierProvider.autoDispose<CalendarViewModel, CalendarState>(
  CalendarViewModel.new,
);

class CalendarViewModel extends StateNotifier<CalendarState> {
  CalendarViewModel(this._ref)
      : super(CalendarState(selectedDate: DateTime.now()));

  final Ref _ref;
  // late final selectedTag = _ref.watch(tagStateProvider);

  StreamController<bool> rebuildTableCalendarController =
      StreamController<bool>();
  // var isRebuildStream = isRebuildStreamController.stream

  @override
  void dispose() {
    rebuildTableCalendarController.close();
    super.dispose();
  }

  void rebuildCalendar() {
    rebuildTableCalendarController.add(true);
  }

  int count = 0;

  // Table Calendarのマーカー表示に使用
  List<ScheduleModel> fetchSchedules(DateTime date) {
    // selectedTagを用いてdateの日付の予定を持ってくる
    print(count++);
    return <ScheduleModel>[];
  }

  List<String> fetchTagList() {
    // リポジトリからタグリスト持ってくる
    return <String>[];
  }

  void switchTag(String newTag) {
    state = state.copyWith(
      selectedTag: newTag,
    );
    rebuildCalendar();
  }

  void selectDate(DateTime date) {
    state = state.copyWith(
      selectedDate: date,
    );
  }

  String getDateLabel() {
    final selectedDate = state.selectedDate;
    var datelabel = '${DateFormat.MMMEd('ja').format(selectedDate)}の予定';
    if (isSameDay(selectedDate, today)) {
      datelabel += '（Today）';
    }
    return datelabel;
  }

  void watchSchedules() {
    // リポジトリから予定一覧をlistenしてstateを更新
    // selectedTag・selectedDateを使用
  }

  void addSchedule(DateTime date, String tagName, String body) {
    // リポジトリを用いて予定を追加
    rebuildCalendar();
  }

  void deleteSchedule() {
    // リポジトリを用いて予定を削除
    rebuildCalendar();
  }

  void changeSchedule() {
    // リポジトリを用いて予定を変更
    rebuildCalendar();
  }
}
