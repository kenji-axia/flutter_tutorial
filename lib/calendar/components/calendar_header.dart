import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({
    super.key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
  });
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;

  @override
  Widget build(BuildContext context) {
    final onCurrentMonth =
        focusedDay.year == today.year && focusedDay.month == today.month;

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '${focusedDay.year}年 ${focusedDay.month}月',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: calendarDarkBlueTextColor,
              ),
            ),
          ),
          if (!onCurrentMonth)
            IconButton(
              icon: const Icon(Icons.calendar_today, size: 20),
              visualDensity: VisualDensity.compact,
              onPressed: onTodayButtonTap,
            ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.chevron_left, size: 30),
            onPressed: onLeftArrowTap,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right, size: 30),
            onPressed: onRightArrowTap,
          ),
        ],
      ),
    );
  }
}
