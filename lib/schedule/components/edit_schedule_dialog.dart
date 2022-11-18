import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/schedule/model/schedule_model.dart';
import 'package:flutter_tutorial/schedule/view_model/schedule_service.dart';
import 'package:flutter_tutorial/schedule/view_model/calendar_state_providers.dart';

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
      data: _createDialogTheme(context),
      child: GestureDetector(
        // キーボードを閉じるためのGestureDetector
        // （複数行のTextFieldのキーボードは改行ボタンが表示されるため）
        // （ => 普通なら完了ボタンでキーボードを閉じることができる）
        onTap: () => primaryFocus?.unfocus(),
        child: AlertDialog(
          insetPadding: const EdgeInsets.all(spacing1),
          actionsPadding: const EdgeInsets.only(right: 10, bottom: 10),
          // 予定・タグ・予定入力テキストフィールドを作成
          content: BuildEditDialogContents(
            formKey: formKey,
            dateInput: dateInput,
            tagInput: tagInput,
            bodyInput: bodyInput,
          ),
          // キャンセルボタン・変更（追加）ボタンの作成
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
                // Dialogのモードによって '変更'or'追加'が入る
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

  ThemeData _createDialogTheme(BuildContext context) {
    return Theme.of(context).copyWith(
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
    );
  }
}

class BuildEditDialogContents extends StatelessWidget {
  const BuildEditDialogContents({
    required this.formKey,
    required this.dateInput,
    required this.tagInput,
    required this.bodyInput,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController dateInput;
  final TextEditingController tagInput;
  final TextEditingController bodyInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(vertical: spacing3),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 日付選択
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
            // タグ入力テキストフィールド
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
            // 予定入力テキストフィールド（複数行）
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
    );
  }
}
