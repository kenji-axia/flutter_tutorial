import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/db/app_database.dart';

final dbRepositoryProvider = Provider<DBRepository>((_) => DBRepository());

class DBRepository {
  final dao = AppDatabase().tutorial9;

  Stream<List<Schedule>> watchAllSchedules() {
    return dao.watchAllSchedules();
  }

  void addSchedule(DateTime date, String tag, String body) {
    final schedule = SchedulesCompanion.insert(
      date: date,
      tag: tag,
      body: body,
      createdAt: DateTime.now(),
    );
    dao.into(dao.schedules).insert(schedule);
  }

  void updateSchedule(
    Schedule before,
    DateTime date,
    String tag,
    String body,
  ) {
    dao.updateSchedule(
      before.copyWith(
        date: date,
        tag: tag,
        body: body,
      ),
    );
  }

  void deleteSchedule(Schedule schedule) => dao.deleteSchedule(schedule);
}
