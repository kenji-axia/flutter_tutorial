import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_tutorial/calendar/model/schedule_model.dart';

part 'calendar_state.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState({
    required DateTime selectedDate,
    @Default('全て') String selectedTag,
    @Default(<ScheduleModel>[]) List<ScheduleModel> scheduleList,
  }) = _CalendarState;
}
