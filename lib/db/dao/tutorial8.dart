import 'package:drift/drift.dart';

import 'package:flutter_tutorial/db/app_database.dart';
import 'package:flutter_tutorial/db/tables/database_todos.dart';

part 'tutorial8.g.dart';

@DriftAccessor(tables: [DatabaseTodos])
class Tutorial8 extends DatabaseAccessor<AppDatabase> with _$Tutorial8Mixin {
  Tutorial8(super.db);

  // 期日が近い順に取得する
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
