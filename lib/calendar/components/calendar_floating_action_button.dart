import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

import 'edit_schedule_dialog.dart';

class CalendarFloatingActionButton extends StatelessWidget {
  const CalendarFloatingActionButton({super.key});

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
              mode: EditDialogMode.add,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.edit,
              size: 40,
              color: calendarDarkBlueTextColor,
            ),
          ],
        ),
      ),
    );
  }
}