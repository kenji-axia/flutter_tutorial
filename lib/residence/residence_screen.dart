import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

import 'components/residence_app_bar.dart';
import 'components/category_filtering_section.dart';
import 'components/category_content.dart';
import 'components/residence_floating_action_button.dart';
import 'components/residence_bottom_navigation_bar.dart';

class ResidenceScreen extends StatelessWidget {
  const ResidenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: residenceMainBackgroundColor,
      appBar: const ResidenceAppBar(),
      body: SafeArea(
        child: ListView(
          children: const [
            CategoryFilteringSection(),
            CategoryContent(
              name: 'Rising place川崎',
              price: '2,000万円',
              place: '京急本線 京急川崎駅 より 徒歩9分',
              size: '1K / 21.24㎡ 南西向き',
              buildingInfo: '2階/15階建 築5年',
              residenceInsideImagePath: 'images/residence_inside.jpg',
              residenceOutsideImagePath: 'images/residence_outside.jpg',
            ),
            CategoryContent(
              name: 'Rising place川崎 2',
              price: '2,000万円',
              place: '京急本線 京急川崎駅 より 徒歩9分',
              size: '1K / 21.24㎡ 南西向き',
              buildingInfo: '2階/15階建 築5年',
              residenceInsideImagePath: 'images/residence_inside.jpg',
              residenceOutsideImagePath: 'images/residence_outside.jpg',
            ),
          ],
        ),
      ),
      floatingActionButton: const ResidenceFloatingActionButton(),
      bottomNavigationBar: const ResidenceBottomNavigationBar(),
    );
  }
}
