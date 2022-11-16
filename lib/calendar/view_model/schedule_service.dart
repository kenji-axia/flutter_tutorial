import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/db/app_database.dart';
import 'package:flutter_tutorial/calendar/model/schedule_model.dart';
import 'package:flutter_tutorial/calendar/repository/db_repository.dart';

final scheduleService =
    Provider<ScheduleService>((ref) => ScheduleService(ref.read));

class ScheduleService {
  ScheduleService(this._reader);

  final Reader _reader;

  void addSchedule(DateTime date, String tag, String body) {
    _reader(dbRepositoryProvider).addSchedule(date, tag, body);
  }

  void deleteSchedule(ScheduleModel scheduleModel) {
    _reader(dbRepositoryProvider).deleteSchedule(
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
