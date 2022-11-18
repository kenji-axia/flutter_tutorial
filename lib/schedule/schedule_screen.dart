import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

import 'components/build_calendar.dart';
import 'components/calendar_floating_action_button.dart';
import 'components/build_tag_button.dart';
import 'components/build_date_label.dart';
import 'components/build_schedule_list.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: calendarBackgroundColor,
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius25,
          ),
          contentTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: calendarDarkBlueTextColor,
            fontSize: 15,
          ),
        ),
      ),
      child: Scaffold(
        floatingActionButton: const CalendarFloatingActionButton(),
        appBar: AppBar(
          backgroundColor: calendarBackgroundColor,
          centerTitle: false,
          title: const BuildTagButton(),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: DefaultTextStyle(
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: calendarDarkBlueTextColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: spacingHalf),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    BuildCalendar(),
                    BuildDateLabel(),
                    BuildScheduleList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
