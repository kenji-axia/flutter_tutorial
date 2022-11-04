import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:intl/intl.dart';

import 'components/todo_list.dart';
import 'drift_client_state_notifier.dart';

class DriftScreen extends ConsumerStatefulWidget {
  const DriftScreen({super.key});

  @override
  DriftScreenState createState() => DriftScreenState();
}

class DriftScreenState extends ConsumerState<DriftScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayInputDialog(context),
        child: const Icon(Icons.edit),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _displayInputDialog(BuildContext context) {
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
                  ref.read(driftClientStateNotifier.notifier).addTodo(
                        titleInput.text,
                        bodyInput.text,
                        dateInput.text,
                      );
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
