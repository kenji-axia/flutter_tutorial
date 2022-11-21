import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';
import 'edit_schedule_dialog.dart';

class ScheduleFloatingActionButton extends StatelessWidget {
  const ScheduleFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: FloatingActionButton(
        backgroundColor: calendarAccentColor,
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (_) => const EditScheduleDialog(
              mode: EditDialogMode.newEntry,
            ),
          );
        },
        child: const Icon(
          Icons.edit,
          size: 40,
          color: calendarDarkBlueTextColor,
        ),
      ),
    );
  }
}
