import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/calendar/model/schedule_model.dart';
import 'package:flutter_tutorial/calendar/view_model/schedule_service.dart';
import 'package:flutter_tutorial/calendar/view_model/calendar_state_providers.dart';

enum EditDialogMode {
  update(buttonText: '変更'),
  add(buttonText: '追加');

  const EditDialogMode({required this.buttonText});
  final String buttonText;
}

class EditScheduleDialog extends ConsumerWidget {
  const EditScheduleDialog({
    required this.mode,
    this.editingScheduleModel,
    super.key,
  });

  final EditDialogMode mode;
  final ScheduleModel? editingScheduleModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateInput = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(
        editingScheduleModel?.date ?? ref.watch(selectedDateStateProvider),
      ),
    );
    final tagInput = TextEditingController(
      text: editingScheduleModel?.tag,
    );
    final bodyInput = TextEditingController(
      text: editingScheduleModel?.body,
    );
    final formKey = GlobalKey<FormState>();

    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: calendarDarkBlueTextColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: calendarDarkBlueTextColor),
          ),
          iconColor: calendarDarkBlueTextColor,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: calendarDarkBlueTextColor,
        ),
      ),
      child: GestureDetector(
        // キーボードを閉じるためのGestureDetector
        // 複数行のTextFieldのキーボードは改行ボタンが表示されるため
        // （普通なら完了ボタンでキーボードを閉じることができる）
        onTap: () => primaryFocus?.unfocus(),
        child: AlertDialog(
          insetPadding: const EdgeInsets.all(spacing1),
          actionsPadding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
          content: Container(
            width: 250,
            padding: const EdgeInsets.symmetric(vertical: spacing3),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    readOnly: true,
                    controller: dateInput,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      hintText: '日付',
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty) ? '値を入力してください' : null,
                    onTap: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2200),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: calendarBackgroundColor,
                                onPrimary: calendarDarkBlueTextColor,
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary: calendarDarkBlueTextColor,
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (pickedDate != null) {
                        final formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        dateInput.text = formattedDate;
                      }
                    },
                  ),
                  TextFormField(
                    controller: tagInput,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.tag,
                      ),
                      hintText: 'タグ',
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty) ? '値を入力してください' : null,
                  ),
                  TextFormField(
                    controller: bodyInput,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.notes),
                      hintText: '予定',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    validator: (value) =>
                        (value == null || value.isEmpty) ? '値を入力してください' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                primary: calendarAccentColor,
              ),
              child: const Text(
                'キャンセル',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: calendarDarkBlueTextColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  switch (mode) {
                    case EditDialogMode.add:
                      ref.read(scheduleService).addSchedule(
                            DateTime.parse(dateInput.text),
                            tagInput.text,
                            bodyInput.text,
                          );
                      break;
                    case EditDialogMode.update:
                      ref.read(scheduleService).updateSchedule(
                            editingScheduleModel!,
                            DateTime.parse(dateInput.text),
                            tagInput.text,
                            bodyInput.text,
                          );
                      break;
                  }
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: calendarAccentColor,
              ),
              child: Text(
                mode.buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: calendarDarkBlueTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
