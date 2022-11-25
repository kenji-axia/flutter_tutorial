import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_line/dotted_line.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/schedule/schedule_state_notifier.dart';

class SwitchTagDialog extends ConsumerWidget {
  const SwitchTagDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTag = ref.watch(
      scheduleStateNotifierProvider.select((state) => state.selectedTag),
    );

    final allTags = ref
        .watch(scheduleStateNotifierProvider.select((state) => state.allTags));

    void updateSelectedTag(String newTag) {
      ref
          .read(scheduleStateNotifierProvider.notifier)
          .updateSelectedTag(newTag);
    }

    return AlertDialog(
      insetPadding: const EdgeInsets.all(space8),
      content: Container(
        width: 250,
        height: 400,
        padding: const EdgeInsets.only(top: space24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('表示するタグを選択'),
              sizedBoxH16,
              TagRadioButton(
                groupValue: selectedTag,
                value: '全て',
                onChanged: updateSelectedTag,
              ),
              sizedBoxH8,
              const DottedLine(),
              sizedBoxH8,
              for (var tag in allTags)
                TagRadioButton(
                  groupValue: selectedTag,
                  value: tag,
                  onChanged: updateSelectedTag,
                ),
            ],
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
          Text('# $value'),
        ],
      ),
    );
  }
}
