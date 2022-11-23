import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:flutter_tutorial/constants.dart';

class EditDialogFields extends StatelessWidget {
  const EditDialogFields({
    required this.formKey,
    required this.dateFieldController,
    required this.tagFieldController,
    required this.bodyFieldController,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController dateFieldController;
  final TextEditingController tagFieldController;
  final TextEditingController bodyFieldController;

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
              controller: dateFieldController,
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                hintText: '日付',
              ),
              validator: (value) =>
                  (value == null || value.isEmpty) ? '値を入力してください' : null,
              onTap: () async {
                final pickedDate = await _showCustomDatePicker(context);
                if (pickedDate != null) {
                  final formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  dateFieldController.text = formattedDate;
                }
              },
            ),
            // タグ入力テキストフィールド
            TextFormField(
              controller: tagFieldController,
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
              controller: bodyFieldController,
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

  Future<DateTime?> _showCustomDatePicker(BuildContext context) async {
    return showDatePicker(
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
  }
}
