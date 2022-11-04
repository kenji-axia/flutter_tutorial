import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_database.g.dart';

class DatabaseTodos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  TextColumn get content => text().withLength(min: 1, max: 50)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get dueDate => dateTime()();
}

@DriftDatabase(tables: [DatabaseTodos])
class Tutorial8Database extends _$Tutorial8Database {
  Tutorial8Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<DatabaseTodo>> watchAllTodosByDueDate() => (select(databaseTodos)
        ..orderBy(
          ([
            (t) => OrderingTerm(expression: t.dueDate),
          ]),
        ))
      .watch();

  Future<int> insertTodo(DatabaseTodo databaseTodo) =>
      into(databaseTodos).insert(databaseTodo);

  Future<int> deleteTodo(DatabaseTodo databaseTodo) =>
      delete(databaseTodos).delete(databaseTodo);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
