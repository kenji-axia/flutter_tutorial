import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/drift/model/todo.dart';

import 'db/drift_database.dart';
import 'repository/drift_repository.dart';
import 'state/drift_client_state.dart';

final driftClientStateNotifier =
    StateNotifierProvider<DriftClientStateNotifier, DriftClientState>(
  (ref) => DriftClientStateNotifier(ref.read),
);

class DriftClientStateNotifier extends StateNotifier<DriftClientState> {
  DriftClientStateNotifier(this._read) : super(const DriftClientState()) {
    watchTodos();
  }

  final Reader _read;

  void watchTodos() {
    _read(driftRepositoryProvider).watchTodos().listen((databaseTodos) {
      // driftで生成されたdatabaseTodo型を、viewで使うためにimmutableなTodo型に変換
      final convertedTodoList = <Todo>[];
      for (final databaseTodo in databaseTodos) {
        convertedTodoList.add(
          Todo(
            id: databaseTodo.id,
            title: databaseTodo.title,
            content: databaseTodo.content,
            dueDate: databaseTodo.dueDate,
            createdAt: databaseTodo.createdAt,
          ),
        );
      }
      state = state.copyWith(
        todoList: convertedTodoList,
      );
    });
  }

  void addTodo(String title, String content, String dueDate) {
    _read(driftRepositoryProvider).addTodo(title, content, dueDate);
  }

  void deleteTodo(Todo todo) {
    _read(driftRepositoryProvider).deleteTodo(
      DatabaseTodo(
        id: todo.id,
        title: todo.title,
        content: todo.content,
        createdAt: todo.createdAt,
        dueDate: todo.dueDate,
      ),
    );
  }
}
