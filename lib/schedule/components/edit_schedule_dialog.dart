import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/schedule/schedule_state_notifier.dart';
import 'package:flutter_tutorial/schedule/model/schedule_model.dart';

enum EditDialogMode {
  update(buttonText: '変更'),
  newEntry(buttonText: '追加');

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

  // 予定の変更時（EditDialogMode.update時）のみ使用します
  // （変更前のデータを表示させるため）
  final ScheduleModel? editingScheduleModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(scheduleStateNotifier).selectedDate;

    final dateInput = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(
        editingScheduleModel?.date ?? selectedDate,
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
      // 日付・タグ・予定本文のテキストインプットに重複するスタイルをあらかじめ指定
      data: _createDialogTheme(context),
      child: GestureDetector(
        // キーボードを閉じるためのGestureDetector
        // （複数行のTextFieldのキーボードは改行ボタンが表示されるため）
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
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                primary: calendarAccentColor,
              ),
              child: const Text(
                'キャンセル',
                style: editScheduleDialogActionButtonTextStyle,
              ),
            ),
            // 変更or追加ボタンの作成
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // 予定の追加or予定の更新処理
                  switch (mode) {
                    case EditDialogMode.newEntry:
                      ref.read(scheduleStateNotifier.notifier).addSchedule(
                            DateTime.parse(dateInput.text),
                            tagInput.text,
                            bodyInput.text,
                          );
                      break;
                    case EditDialogMode.update:
                      ref.read(scheduleStateNotifier.notifier).updateSchedule(
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
                style: editScheduleDialogActionButtonTextStyle,
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
