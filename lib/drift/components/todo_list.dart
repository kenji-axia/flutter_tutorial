import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/drift/model/todo.dart';
import 'package:flutter_tutorial/drift/drift_client_state_notifier.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(driftClientStateNotifier);

    if (state.todoList.isEmpty) {
      return const Center(
        child: Text(
          '登録しているTodoはありません',
          style: fontWeightBoldTextStyle,
        ),
      );
    }

    return ListView.builder(
      itemCount: state.todoList.length,
      itemBuilder: (_, index) {
        final todo = state.todoList[index];
        return TodoListItem(todo);
      },
    );
  }
}

class TodoListItem extends ConsumerWidget {
  const TodoListItem(this.todo, {super.key});

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      key: ValueKey(todo.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) =>
                ref.read(driftClientStateNotifier.notifier).deleteTodo(todo),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: spacing2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: spacing2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'タイトル：${todo.title}',
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                todo.body,
                style: const TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacing3),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '作成日：'
                        '${DateFormat('yyyy-MM-dd').format(todo.createdAt)}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '期日：${DateFormat('yyyy-MM-dd').format(todo.dueDate)}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
