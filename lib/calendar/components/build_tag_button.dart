import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/calendar/schedules_view_model.dart';

import 'package:flutter_tutorial/constants.dart';

import 'switch_tag_dialog.dart';

class BuildTagButton extends ConsumerWidget {
  const BuildTagButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagName = ref.watch(calendarViewModel).selectedTag;
    return TextButton.icon(
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (_) => const SwitchTagDialog(),
        );
      },
      style: TextButton.styleFrom(
        primary: calendarAccentColor,
      ),
      icon: const Icon(
        Icons.arrow_drop_down_outlined,
        color: calendarDarkBlueTextColor,
        size: 30,
      ),
      label: Text(
        '# $tagName',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: calendarDarkBlueTextColor,
        ),
      ),
    );
  }
}
