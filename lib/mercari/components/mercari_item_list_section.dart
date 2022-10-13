import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

class MercariItemListSection extends StatelessWidget {
  const MercariItemListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: spacing2,
        left: spacing2,
      ),
      child: Column(
        children: const [
          ItemListSectionHeader(),
          sizedBox8,
          Item(
            name: 'NikonD5500',
            price: '¥51,000',
            searchingNum: '446人',
            imagePath: 'images/mercari_sample.jpg',
          ),
          Item(
            name: 'NikonD5500',
            price: '¥51,000',
            searchingNum: '446人',
            imagePath: 'images/mercari_sample.jpg',
          ),
          Item(
            name: 'NikonD5500',
            price: '¥51,000',
            searchingNum: '446人',
            imagePath: 'images/mercari_sample.jpg',
          ),
        ],
      ),
    );
  }
}

class ItemListSectionHeader extends StatelessWidget {
  const ItemListSectionHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '売れやすい持ち物',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizedBox2,
              Text(
                '使わないモノを出品してみよう！',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: const [
              Text(
                'すべて見る',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.blueAccent,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.blueAccent,
              )
            ],
          ),
        ),
        sizedBox16,
      ],
    );
  }
}

class Item extends StatelessWidget {
  const Item(
      {required this.name,
      required this.price,
      required this.searchingNum,
      required this.imagePath,
      Key? key})
      : super(key: key);

  final String name;
  final String price;
  final String searchingNum;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey[400],
        ),
        sizedBox8,
        Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.asset(imagePath),
            ),
            sizedBox8,
            sizedBox4,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedBox4,
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  sizedBox4,
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department_rounded,
                        size: 17,
                        color: Colors.blueAccent,
                      ),
                      sizedBox4,
                      Text(
                        '$searchingNumが探しています',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 11,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: freeMarketRedAccentColor,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: () {},
              child: const Text(
                '出品する',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            sizedBox16,
          ],
        ),
        sizedBox8,
      ],
    );
  }
}
