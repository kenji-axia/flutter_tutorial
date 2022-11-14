import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

enum EditDialogMode {
  change('変更'),
  add('追加');

  const EditDialogMode(this.text);
  final String text;
}

class EditScheduleDialog extends StatelessWidget {
  const EditScheduleDialog({required this.mode, super.key});

  final EditDialogMode mode;

  @override
  Widget build(BuildContext context) {
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
        // キーボードを閉じる
        // 複数行のTextFieldのキーボードは改行ボタンが表示されるため
        // （普通なら完了ボタンでキーボードを閉じることができる）
        onTap: () => primaryFocus?.unfocus(),
        child: AlertDialog(
          insetPadding: const EdgeInsets.all(spacing1),
          actionsPadding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
          // shape: RoundedRectangleBorder(
          //   borderRadius: borderRadius25,
          // ),
          content: Container(
            width: 250,
            padding: const EdgeInsets.symmetric(vertical: spacing3),
            child: Form(
              // key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    readOnly: true,
                    // controller: dateInput,
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
                        // final formattedDate =
                        // DateFormat('yyyy-MM-dd').format(pickedDate);
                        // dateInput.text = formattedDate;
                      }
                    },
                  ),
                  TextFormField(
                    // controller: titleInput,
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
                    // controller: bodyInput,
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: calendarAccentColor,
              ),
              child: Text(
                mode.text,
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
