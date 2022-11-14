import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

import 'switch_tag_dialog.dart';

class BuildTagButton extends StatelessWidget {
  const BuildTagButton({super.key});

  @override
  Widget build(BuildContext context) {
    const tagName = '全て';
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
      label: const Text(
        '# $tagName',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: calendarDarkBlueTextColor,
        ),
      ),
    );
  }
}
