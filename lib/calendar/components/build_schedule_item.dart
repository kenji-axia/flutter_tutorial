import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/calendar/model/schedule_model.dart';
import 'package:flutter_tutorial/calendar/view_model/schedule_service.dart';
import 'edit_schedule_dialog.dart';

class BuildScheduleItem extends ConsumerWidget {
  const BuildScheduleItem({
    required this.scheduleModel,
    super.key,
  });

  final ScheduleModel scheduleModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      key: ValueKey(scheduleModel.scheduleId),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) =>
                ref.read(scheduleService).deleteSchedule(scheduleModel),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacing2),
        child: Column(
          children: [
            sizedBoxH8,
            Container(
              margin: const EdgeInsets.symmetric(vertical: spacingHalf),
              padding: const EdgeInsets.all(spacing2),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: borderRadius10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('# ${scheduleModel.tag}'),
                      TextButton(
                        onPressed: () {
                          showDialog<void>(
                            context: context,
                            builder: (_) => EditScheduleDialog(
                              mode: EditDialogMode.update,
                              editingScheduleModel: scheduleModel,
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          primary: calendarAccentColor,
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          '編集',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: calendarAccentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  sizedBoxH12,
                  Text(
                    scheduleModel.body,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
