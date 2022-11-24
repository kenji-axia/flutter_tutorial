import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/db/app_database.dart';
import 'package:flutter_tutorial/db/app_database_provider.dart';

final dbRepositoryProvider = Provider.autoDispose<DBRepository>(
  (ref) => DBRepository(ref.read(appDatabaseProvider)),
);

class DBRepository {
  DBRepository(this._appDatabase);

  final AppDatabase _appDatabase;

  Stream<List<Schedule>> watchAllSchedules() {
    return _appDatabase.tutorial9.watchAllSchedules();
  }

  void addSchedule(DateTime date, String tag, String body) {
    final schedule = SchedulesCompanion.insert(
      date: date,
      tag: tag,
      body: body,
      createdAt: DateTime.now(),
    );
    _appDatabase.tutorial9.insertSchedule(schedule);
  }

  void updateSchedule(
    Schedule before,
    DateTime date,
    String tag,
    String body,
  ) {
    _appDatabase.tutorial9.updateSchedule(
      before.copyWith(
        date: date,
        tag: tag,
        body: body,
      ),
    );
  }

  void deleteSchedule(Schedule schedule) =>
      _appDatabase.tutorial9.deleteSchedule(schedule);
}
