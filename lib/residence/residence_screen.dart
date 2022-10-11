import 'package:flutter/material.dart';

import 'components/residence_app_bar.dart';
import 'components/category_filtering_section.dart';
import 'components/category_content.dart';
import 'components/residence_floating_action_button.dart';
import 'components/residence_bottom_navigation_bar.dart';

class ResidenceScreen extends StatelessWidget {
  const ResidenceScreen({Key? key}) : super(key: key);

  final _mainAccentColor = const Color.fromRGBO(82, 164, 154, 1);
  final _mainBackgroundColor = const Color.fromRGBO(250, 248, 245, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _mainBackgroundColor,
      appBar: ResidenceAppBar(_mainAccentColor),
      body: SafeArea(
        child: ListView(
          children: [
            CategoryFilteringSection(
              _mainAccentColor,
              _mainBackgroundColor,
            ),
            CategoryContent(),
            CategoryContent(),
          ],
        ),
      ),
      floatingActionButton: ResidenceFloatingActionButton(_mainAccentColor),
      bottomNavigationBar: ResidenceBottomNavigationBar(_mainAccentColor),
    );
  }
}
