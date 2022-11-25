import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_model.freezed.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  const factory ScheduleModel({
    required int scheduleId,
    required String tag,
    required String body,
    required DateTime date,
    required DateTime createdAt,
  }) = _ScheduleModel;
}
