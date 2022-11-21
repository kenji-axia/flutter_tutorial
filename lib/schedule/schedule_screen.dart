import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

import 'components/calendar_section.dart';
import 'components/calendar_floating_action_button.dart';
import 'components/select_tag_button.dart';
import 'components/selected_date_label.dart';
import 'components/schedule_list_section.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: calendarBackgroundColor,
        // 複数のダイアログを使用するので、ここで定義しておくとコードの削減ができます
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
        appBar: AppBar(
          backgroundColor: calendarBackgroundColor,
          centerTitle: false,
          title: const SelectTagButton(),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: const ScheduleFloatingActionButton(),
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
                    CalendarSection(),
                    SelectedDateLabel(),
                    ScheduleListSection(),
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
