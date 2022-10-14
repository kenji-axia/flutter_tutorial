import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

import 'mercari_item.dart';

class MercariBodyBottom extends StatelessWidget {
  const MercariBodyBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: spacing2,
        left: spacing2,
      ),
      child: Column(
        children: const [
          ItemListHeader(),
          sizedBox8,
          MercariItem(
            name: 'NikonD5500',
            price: '¥51,000',
            searchingNum: '446人',
            imagePath: 'images/mercari_sample.jpg',
          ),
          MercariItem(
            name: 'NikonD5500',
            price: '¥51,000',
            searchingNum: '446人',
            imagePath: 'images/mercari_sample.jpg',
          ),
          MercariItem(
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
        // 「すべてを見る＞」　ボタンの作成
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
