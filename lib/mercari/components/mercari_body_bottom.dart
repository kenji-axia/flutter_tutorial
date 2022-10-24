import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';
import 'package:flutter_tutorial/mercari/dataclass/item_metadata.dart';

import 'mercari_item.dart';

class MercariBodyBottom extends StatelessWidget {
  MercariBodyBottom({Key? key}) : super(key: key);

  final List<ItemMetadata> _dummyItemMetadata = [
    ItemMetadata(
      name: 'NikonD5500',
      price: '¥51,000',
      searchingNum: '446人',
      imagePath: 'images/mercari_sample.jpg',
    ),
    ItemMetadata(
      name: 'NikonD5500',
      price: '¥51,000',
      searchingNum: '446人',
      imagePath: 'images/mercari_sample.jpg',
    ),
    ItemMetadata(
      name: 'NikonD5500',
      price: '¥51,000',
      searchingNum: '446人',
      imagePath: 'images/mercari_sample.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: spacing2,
        left: spacing2,
      ),
      child: Column(
        children: [
          ItemListHeader(),
          sizedBoxH8,
          for (ItemMetadata itemMetadata in _dummyItemMetadata) ...{
            MercariItem(
              name: itemMetadata.name,
              price: itemMetadata.price,
              searchingNum: itemMetadata.searchingNum,
              imagePath: itemMetadata.imagePath,
            )
          }
        ],
      ),
    );
  }
}

class ItemListHeader extends StatelessWidget {
  const ItemListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '売れやすい持ち物',
                style: fontWeightBoldTextStyle,
              ),
              sizedBoxH2,
              Text(
                '使わないモノを出品してみよう！',
                style: TextStyle(
                  color: grey600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        // 「すべてを見る＞」　ボタンの作成
        GestureDetector(
          onTap: () {},
          child: Row(
            children: const [
              Text(
                'すべて見る',
                style: TextStyle(
                  fontSize: 13,
                  color: blueAccent,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: blueAccent,
              )
            ],
          ),
        ),
        sizedBoxW16,
      ],
    );
  }
}
