import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

import 'item_parts/item_image.dart';
import 'item_parts/item_description.dart';
import 'item_parts/item_button.dart';

class MercariItem extends StatelessWidget {
  const MercariItem({
    required this.name,
    required this.price,
    required this.searchingNum,
    required this.imagePath,
    super.key,
  });

  final String name;
  final String price;
  final String searchingNum;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: grey400,
        ),
        sizedBoxH8,
        Row(
          children: [
            // 商品写真の表示
            ItemImage(imagePath: imagePath),
            sizedBoxW12,
            Expanded(
              // 商品名・商品価格・その商品を探している人の数を表示
              child: ItemDescription(
                name: name,
                price: price,
                searchingNum: searchingNum,
              ),
            ),
            const ItemButton(),
            sizedBoxW16,
          ],
        ),
        sizedBoxH8,
      ],
    );
  }
}
