import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:intl/intl.dart';

import 'drift_database.dart';

class DriftScreen extends ConsumerStatefulWidget {
  const DriftScreen({super.key});

  @override
  DriftScreenState createState() => DriftScreenState();
}

class DriftScreenState extends ConsumerState<DriftScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final database = ref.watch(tutorial8DatabaseProvider);
    return Scaffold(
      body: const TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayInputDialog(context, database),
        child: const Icon(Icons.edit),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _displayInputDialog(
    BuildContext context,
    Tutorial8Database database,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        final titleInput = TextEditingController();
        final bodyInput = TextEditingController();
        final dateInput = TextEditingController();
        return AlertDialog(
          insetPadding: const EdgeInsets.all(spacing1),
          content: Container(
            width: 250,
            padding: const EdgeInsets.symmetric(vertical: spacing3),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    autofocus: true,
                    controller: titleInput,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.text_fields),
                      hintText: 'タイトルを入力してください',
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty) ? '値を入力してください' : null,
                  ),
                  TextFormField(
                    controller: bodyInput,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.notes),
                      hintText: '内容を入力してください',
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty) ? '値を入力してください' : null,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: dateInput,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      hintText: '期限を選択してください',
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty) ? '値を入力してください' : null,
                    onTap: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2200),
                      );
                      if (pickedDate != null) {
                        final formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        dateInput.text = formattedDate;
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('キャンセル'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final todo = TodosCompanion.insert(
                    title: titleInput.text,
                    content: bodyInput.text,
                    dueDate: DateTime.parse(dateInput.text),
                    createdAt: DateTime.now(),
                  );
                  database.into(database.todos).insert(todo);
                  Navigator.pop(context);
                }
              },
              child: const Text('保存'),
            ),
          ],
        );
      },
    );
  }
}

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(tutorial8DatabaseProvider);
    return StreamBuilder(
      stream: database.watchAllTodosByDueAsc(),
      builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
        final todos = snapshot.data ?? [];

        if (todos.isEmpty) {
          return const Center(
            child: Text(
              '登録しているTodoはありません',
              style: fontWeightBoldTextStyle,
            ),
          );
        }

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (_, index) {
            final todo = todos[index];
            return TodoListItem(todo, database);
          },
        );
      },
    );
  }
}

class TodoListItem extends StatelessWidget {
  const TodoListItem(this.todo, this.database, {super.key});

  final Todo todo;
  final Tutorial8Database database;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(todo.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              database.deleteTodo(todo);
            },
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
                todo.content,
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
