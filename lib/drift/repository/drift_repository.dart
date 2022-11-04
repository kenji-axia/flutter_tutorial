import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/drift/db/drift_database.dart';

final driftRepositoryProvider =
    Provider<DriftRepository>((_) => DriftRepository());

class DriftRepository {
  final database = Tutorial8Database();

  Stream<List<DatabaseTodo>> watchTodos() {
    return database.watchAllTodosByDueDate();
  }

  void addTodo(String title, String content, String dueDate) {
    final todo = DatabaseTodosCompanion.insert(
      title: title,
      content: content,
      dueDate: DateTime.parse(dueDate),
      createdAt: DateTime.now(),
    );
    database.into(database.databaseTodos).insert(todo);
  }

  void deleteTodo(DatabaseTodo databaseTodo) {
    database.deleteTodo(databaseTodo);
  }
}
