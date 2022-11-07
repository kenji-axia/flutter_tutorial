import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/db/app_database.dart';

final driftRepositoryProvider =
    Provider<DriftRepository>((_) => DriftRepository());

class DriftRepository {
  final dao = AppDatabase().tutorial8;

  Stream<List<DatabaseTodo>> watchTodos() {
    return dao.watchAllTodosByDueDate();
  }

  void addTodo(String title, String body, String dueDate) {
    final todo = DatabaseTodosCompanion.insert(
      title: title,
      body: body,
      dueDate: DateTime.parse(dueDate),
      createdAt: DateTime.now(),
    );
    dao.into(dao.databaseTodos).insert(todo);
  }

  void deleteTodo(DatabaseTodo databaseTodo) {
    dao.deleteTodo(databaseTodo);
  }
}
