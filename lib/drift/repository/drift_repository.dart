import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/db/app_database.dart';
import 'package:flutter_tutorial/db/app_database_provider.dart';

final driftRepositoryProvider = Provider.autoDispose<DriftRepository>(
  (ref) => DriftRepository(ref.read(appDatabaseProvider)),
);

class DriftRepository {
  DriftRepository(this._appDatabase);

  final AppDatabase _appDatabase;

  Stream<List<DatabaseTodo>> watchTodos() {
    return _appDatabase.tutorial8.watchAllTodosByDueDate();
  }

  void addTodo(String title, String body, String dueDate) {
    final todo = DatabaseTodosCompanion.insert(
      title: title,
      body: body,
      dueDate: DateTime.parse(dueDate),
      createdAt: DateTime.now(),
    );
    _appDatabase.tutorial8
        .into(_appDatabase.tutorial8.databaseTodos)
        .insert(todo);
  }

  void deleteTodo(DatabaseTodo databaseTodo) {
    _appDatabase.tutorial8.deleteTodo(databaseTodo);
  }
}
