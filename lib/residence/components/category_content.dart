import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

import 'category_content_parts/category_content_images.dart';
import 'category_content_parts/category_content_texts.dart';
import 'category_content_parts/category_content_buttons.dart';

class CategoryContent extends StatelessWidget {
  const CategoryContent({
    required this.name,
    required this.price,
    required this.place,
    required this.size,
    required this.buildingInfo,
    required this.residenceInsideImagePath,
    required this.residenceOutsideImagePath,
    Key? key,
  }) : super(key: key);

  final String name;
  final String price;
  final String place;
  final String size;
  final String buildingInfo;

  final String residenceInsideImagePath;
  final String residenceOutsideImagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(spacing1),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius10,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // 写真2枚(建物外観・見取り図)を横並べに表示
          CategoryContentImages(
            residenceOutsideImagePath: residenceOutsideImagePath,
            residenceInsideImagePath: residenceInsideImagePath,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: spacing1,
              horizontal: spacing2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox4,
                // 建物情報を表示
                CategoryContentTexts(
                  residenceName: name,
                  residencePrice: price,
                  residencePlace: place,
                  residenceSize: size,
                  residenceInfo: buildingInfo,
                ),
                sizedBox16,
                // 興味なし / お気に入り ボタンを横並びに表示
                CategoryContentButtons(),
                sizedBox4,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
