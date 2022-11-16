import 'package:drift/drift.dart';

import 'package:flutter_tutorial/db/app_database.dart';
import 'package:flutter_tutorial/db/tables/schedules.dart';

part 'tutorial9.g.dart';

@DriftAccessor(tables: [Schedules])
class Tutorial9 extends DatabaseAccessor<AppDatabase> with _$Tutorial9Mixin {
  Tutorial9(super.db);

  // 全ての予定を取得
  Stream<List<Schedule>> watchAllSchedules() => (select(schedules)
        ..orderBy(
          ([
            (t) => OrderingTerm(expression: t.date),
          ]),
        ))
      .watch();

  Future<int> insertSchedule(Schedule schedule) =>
      into(schedules).insert(schedule);

  Future<bool> updateSchedule(Schedule schedule) =>
      update(schedules).replace(schedule);

  Future<int> deleteSchedule(Schedule schedule) =>
      delete(schedules).delete(schedule);
}
