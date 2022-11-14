import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

class BuildDateLabel extends StatelessWidget {
  const BuildDateLabel({super.key});

  @override
  Widget build(BuildContext context) {
    const dateString = '11月11日(金)の予定 (Today)';
    return const Text(
      dateString,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: calendarDarkBlueTextColor,
      ),
    );
  }
}
