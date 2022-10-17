import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

import 'data_class/residence_metadata.dart';
import 'components/residence_app_bar.dart';
import 'components/category_filtering_section.dart';
import 'components/category_content.dart';
import 'components/residence_floating_action_button.dart';
import 'components/residence_bottom_navigation_bar.dart';

class ResidenceScreen extends StatelessWidget {
  ResidenceScreen({Key? key}) : super(key: key);

  final List<ResidenceMetadata> _dummyResidenceMetadata = [
    ResidenceMetadata(
      name: 'Rising place川崎',
      price: '2,000万円',
      place: '京急本線 京急川崎駅 より 徒歩9分',
      size: '1K / 21.24㎡ 南西向き',
      buildingInfo: '2階/15階建 築5年',
      residenceInsideImagePath: 'images/residence_inside.jpg',
      residenceOutsideImagePath: 'images/residence_outside.jpg',
    ),
    ResidenceMetadata(
      name: 'Rising place川崎',
      price: '2,000万円',
      place: '京急本線 京急川崎駅 より 徒歩9分',
      size: '1K / 21.24㎡ 南西向き',
      buildingInfo: '2階/15階建 築5年',
      residenceInsideImagePath: 'images/residence_inside.jpg',
      residenceOutsideImagePath: 'images/residence_outside.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: residenceMainBackgroundColor,
      appBar: const ResidenceAppBar(),
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 11,
            color: Colors.black87,
          ),
          child: ListView(
            children: [
              CategoryFilteringSection(),
              for (ResidenceMetadata residenceMetadata
                  in _dummyResidenceMetadata) ...{
                CategoryContent(
                  name: residenceMetadata.name,
                  price: residenceMetadata.price,
                  place: residenceMetadata.place,
                  size: residenceMetadata.size,
                  buildingInfo: residenceMetadata.buildingInfo,
                  residenceInsideImagePath:
                      residenceMetadata.residenceInsideImagePath,
                  residenceOutsideImagePath:
                      residenceMetadata.residenceOutsideImagePath,
                )
              }
            ],
          ),
        ),
      ),
      floatingActionButton: const ResidenceFloatingActionButton(),
      bottomNavigationBar: const ResidenceBottomNavigationBar(),
    );
  }
}
