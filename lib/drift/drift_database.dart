import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_database.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  TextColumn get content => text().withLength(min: 1, max: 50)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get dueDate => dateTime()();
}

final tutorial8DatabaseProvider = Provider((_) => Tutorial8Database());

@DriftDatabase(tables: [Todos])
class Tutorial8Database extends _$Tutorial8Database {
  Tutorial8Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Todo>> getAllTodos() => select(todos).get();

  Stream<List<Todo>> watchAllTodos() => select(todos).watch();

  Stream<List<Todo>> watchAllTodosByDueAsc() => (select(todos)
        ..orderBy(
          ([
            (t) => OrderingTerm(expression: t.dueDate),
          ]),
        ))
      .watch();

  Future<int> insertTodo(Todo todo) => into(todos).insert(todo);

  Future<bool> updateTodo(Todo todo) => update(todos).replace(todo);

  Future<int> deleteTodo(Todo todo) => delete(todos).delete(todo);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
