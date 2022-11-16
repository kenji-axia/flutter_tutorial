import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_line/dotted_line.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/calendar/schedules_view_model.dart';

class SwitchTagDialog extends ConsumerWidget {
  const SwitchTagDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTag = ref.watch(calendarViewModel).selectedTag;

    void setTag(String newTag) {
      ref.watch(calendarViewModel.notifier).switchTag(newTag);
    }

    return Theme(
      data: Theme.of(context).copyWith(
          // inputDecorationTheme: const InputDecorationTheme(
          //   enabledBorder: UnderlineInputBorder(
          //     borderSide: BorderSide(color: calendarDarkBlueTextColor),
          //   ),
          //   focusedBorder: UnderlineInputBorder(
          //     borderSide: BorderSide(color: calendarDarkBlueTextColor),
          //   ),
          //   iconColor: calendarDarkBlueTextColor,
          // ),
          // textSelectionTheme: const TextSelectionThemeData(
          //   cursorColor: calendarDarkBlueTextColor,
          // ),
          ),
      child: AlertDialog(
        insetPadding: const EdgeInsets.all(spacing1),
        actionsPadding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
        // shape: RoundedRectangleBorder(
        //   borderRadius: borderRadius25,
        // ),
        content: Container(
          width: 250,
          height: 400,
          padding: const EdgeInsets.symmetric(vertical: spacing3),
          child: Form(
            // key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '表示するタグを選択',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: calendarDarkBlueTextColor,
                  ),
                ),
                sizedBoxH16,
                ListView(
                  shrinkWrap: true,
                  children: [
                    TagRadioButton(
                      groupValue: selectedTag,
                      value: '全て',
                      onChanged: setTag,
                    ),
                    sizedBoxH8,
                    const DottedLine(),
                    sizedBoxH8,
                    TagRadioButton(
                      groupValue: selectedTag,
                      value: '仕事',
                      onChanged: setTag,
                    ),
                    TagRadioButton(
                      groupValue: selectedTag,
                      value: 'プライベート',
                      onChanged: setTag,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TagRadioButton extends StatelessWidget {
  const TagRadioButton({
    super.key,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String groupValue;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Row(
        children: <Widget>[
          Radio<String>(
            groupValue: groupValue,
            value: value,
            onChanged: (String? newValue) {
              onChanged(newValue!);
            },
            activeColor: calendarRadioColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          Text(
            '# $value',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: calendarDarkBlueTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
