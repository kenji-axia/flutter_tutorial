import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/schedule/schedule_state_notifier.dart';

class CalendarHeader extends ConsumerWidget {
  const CalendarHeader({
    super.key,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
  });
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // カレンダーが表示している月
    final focusedMonth = ref.watch(
      scheduleStateNotifier.select((state) => state.focusedMonth),
    );
    // カレンダーの表示している月が今月かどうか
    final isOnThisMonth =
        focusedMonth.year == today.year && focusedMonth.month == today.month;

    return Padding(
      padding: const EdgeInsets.only(left: spacing2),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '${focusedMonth.year}年 ${focusedMonth.month}月',
              style: const TextStyle(fontSize: 13),
            ),
          ),
          // 表示している月が今月ではない時、今月に戻るボタンを表示
          if (!isOnThisMonth)
            IconButton(
              icon: const Icon(Icons.calendar_today, size: 20),
              visualDensity: VisualDensity.compact,
              onPressed: () => ref
                  .read(scheduleStateNotifier.notifier)
                  .updateFocusedMonth(today),
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
