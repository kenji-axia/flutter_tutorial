import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/schedule/schedule_state_notifier.dart';
import 'package:flutter_tutorial/schedule/model/schedule_model.dart';

import 'edit_dialog_fields.dart';

enum EditDialogMode {
  edit(buttonText: '変更'),
  newEntry(buttonText: '追加');

  const EditDialogMode({required this.buttonText});
  final String buttonText;
}

class EditScheduleDialog extends ConsumerStatefulWidget {
  const EditScheduleDialog({
    required this.mode,
    this.editingScheduleModel,
    super.key,
  });

  final EditDialogMode mode;

  // 予定の編集時（EditDialogMode.edit時）に、変更前のデータを表示させるために使用
  final ScheduleModel? editingScheduleModel;

  @override
  EditScheduleDialogState createState() => EditScheduleDialogState();
}

class EditScheduleDialogState extends ConsumerState<EditScheduleDialog> {
  final dateField = TextEditingController();
  final tagField = TextEditingController();
  final bodyField = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final selectedDate = ref.read(scheduleStateNotifier).selectedDate;

    // 編集時のみ、変更前のデータを表示させる
    dateField.text = DateFormat('yyyy-MM-dd').format(
      widget.editingScheduleModel?.date ?? selectedDate,
    );
    tagField.text = widget.editingScheduleModel?.tag ?? '';
    bodyField.text = widget.editingScheduleModel?.body ?? '';
  }

  @override
  void dispose() {
    dateField.dispose();
    tagField.dispose();
    bodyField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          content: EditDialogFields(
            formKey: formKey,
            dateField: dateField,
            tagField: tagField,
            bodyField: bodyField,
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
                  // 追加 or 更新 処理
                  switch (widget.mode) {
                    case EditDialogMode.newEntry:
                      ref.read(scheduleStateNotifier.notifier).addSchedule(
                            DateTime.parse(dateField.text),
                            tagField.text,
                            bodyField.text,
                          );
                      break;
                    case EditDialogMode.edit:
                      ref.read(scheduleStateNotifier.notifier).updateSchedule(
                            widget.editingScheduleModel!,
                            DateTime.parse(dateField.text),
                            tagField.text,
                            bodyField.text,
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
                widget.mode.buttonText,
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
