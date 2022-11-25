import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'dao/tutorial8.dart';
import 'dao/tutorial9.dart';
import 'tables/database_todos.dart';
import 'tables/schedules.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [DatabaseTodos, Schedules], daos: [Tutorial8, Tutorial9])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
