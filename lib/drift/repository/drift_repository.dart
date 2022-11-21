import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/db/app_database.dart';
import 'package:flutter_tutorial/db/app_database_provider.dart';

final driftRepositoryProvider =
    Provider.autoDispose<DriftRepository>((ref) => DriftRepository(ref.read));

class DriftRepository {
  // final dao = AppDatabase().tutorial8;

  DriftRepository(this._reader);

  final Reader _reader;

  Stream<List<DatabaseTodo>> watchTodos() {
    return _reader(appDatabaseProvider).tutorial8.watchAllTodosByDueDate();
  }

  void addTodo(String title, String body, String dueDate) {
    final todo = DatabaseTodosCompanion.insert(
      title: title,
      body: body,
      dueDate: DateTime.parse(dueDate),
      createdAt: DateTime.now(),
    );
    _reader(appDatabaseProvider)
        .tutorial8
        .into(_reader(appDatabaseProvider).tutorial8.databaseTodos)
        .insert(todo);
  }

  void deleteTodo(DatabaseTodo databaseTodo) {
    _reader(appDatabaseProvider).tutorial8.deleteTodo(databaseTodo);
  }
}
