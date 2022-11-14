import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

import 'edit_schedule_dialog.dart';

class BuildScheduleItem extends StatelessWidget {
  const BuildScheduleItem({
    required this.tagName,
    required this.body,
    super.key,
  });

  final String tagName;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  Text(
                    '# $tagName',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: calendarDarkBlueTextColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        builder: (_) => const EditScheduleDialog(
                          mode: EditDialogMode.change,
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
                body,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: calendarDarkBlueTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
