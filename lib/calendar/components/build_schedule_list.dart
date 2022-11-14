import 'package:flutter/material.dart';
import 'build_schedule_item.dart';

class BuildScheduleList extends StatelessWidget {
  const BuildScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        BuildScheduleItem(
          tagName: '仕事',
          body: '9:30 ミーティング\n13:00 昼食',
        ),
        BuildScheduleItem(
          tagName: 'プライベート',
          body: '買い物にいく\nプログラミング\n早寝',
        ),
        BuildScheduleItem(
          tagName: 'プライベート',
          body: '買い物にいく\nプログラミング\n早寝',
        ),
        BuildScheduleItem(
          tagName: 'プライベート',
          body: '買い物にいく\nプログラミング\n早寝',
        ),
      ],
    );
  }
}
