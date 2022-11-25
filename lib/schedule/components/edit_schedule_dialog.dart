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

  // 予定の編集時（EditDialogMode.edit時）に、編集するデータを受け取る
  final ScheduleModel? editingScheduleModel;

  @override
  EditScheduleDialogState createState() => EditScheduleDialogState();
}

class EditScheduleDialogState extends ConsumerState<EditScheduleDialog> {
  final dateFieldController = TextEditingController();
  final tagFieldController = TextEditingController();
  final bodyFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final selectedDate = ref.read(scheduleStateNotifierProvider).selectedDate;

    // 編集時のみ、編集するデータを表示させる
    dateFieldController.text = DateFormat('yyyy-MM-dd').format(
      widget.editingScheduleModel?.date ?? selectedDate,
    );
    tagFieldController.text = widget.editingScheduleModel?.tag ?? '';
    bodyFieldController.text = widget.editingScheduleModel?.body ?? '';
  }

  @override
  void dispose() {
    dateFieldController.dispose();
    tagFieldController.dispose();
    bodyFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      // 日付・タグ・予定本文のテキストフィールドに共通するスタイルを指定
      data: _createDialogTheme(context),
      child: GestureDetector(
        // キーボードを閉じるためのGestureDetector
        // 複数行のTextFieldの入力時、
        // キーボードに完了ボタンではなく改行ボタンが表示されるため、
        // ダイアログの余白をタップするとキーボードが閉じるようにしたい
        onTap: () => primaryFocus?.unfocus(),
        child: AlertDialog(
          insetPadding: const EdgeInsets.all(space8),
          actionsPadding: const EdgeInsets.only(right: space8, bottom: space8),
          // 予定・タグ・予定入力テキストフィールドを作成
          content: EditDialogFields(
            formKey: formKey,
            dateFieldController: dateFieldController,
            tagFieldController: tagFieldController,
            bodyFieldController: bodyFieldController,
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
                      ref
                          .read(scheduleStateNotifierProvider.notifier)
                          .addSchedule(
                            DateTime.parse(dateFieldController.text),
                            tagFieldController.text,
                            bodyFieldController.text,
                          );
                      break;
                    case EditDialogMode.edit:
                      ref
                          .read(scheduleStateNotifierProvider.notifier)
                          .updateSchedule(
                            widget.editingScheduleModel!,
                            DateTime.parse(dateFieldController.text),
                            tagFieldController.text,
                            bodyFieldController.text,
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
