import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

class CategoryFilteringSection extends StatelessWidget {
  const CategoryFilteringSection({super.key});

  String get _trainInfo => '東京駅・品川駅・川崎駅・横浜駅・目黒駅・恵比寿駅・渋谷駅・';
  String get _priceInfo => '下限なし 〜 2,000万円';
  String get _anotherInfo => '1R 〜 4LDK / 10㎡以上 / 徒歩20分';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(spacing1),
      padding: const EdgeInsets.all(spacing1),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  sizedBox8,
                  const Text(
                    '〇〇のおすすめ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                  sizedBox8,
                  Text(
                    '新着3件',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.red[300],
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    '編集',
                    style: TextStyle(
                      fontSize: 12,
                      color: residenceMainAccentColor,
                    ),
                  ),
                  sizedBox4,
                  Icon(
                    Icons.edit,
                    color: residenceMainAccentColor,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: spacing1),
            padding: const EdgeInsets.all(spacing1),
            decoration: BoxDecoration(
              color: residenceMainBackgroundColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                sizedBox4,
                Row(
                  children: [
                    Icon(
                      Icons.train,
                      size: 15,
                      color: Colors.grey[700],
                    ),
                    sizedBox8,
                    Text(_trainInfo),
                  ],
                ),
                sizedBox4,
                Row(
                  children: [
                    Icon(
                      Icons.currency_yen,
                      size: 15,
                      color: Colors.grey[700],
                    ),
                    sizedBox8,
                    Text(_priceInfo),
                  ],
                ),
                sizedBox4,
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 15,
                      color: Colors.grey[700],
                    ),
                    sizedBox8,
                    Text(_anotherInfo),
                  ],
                ),
                sizedBox4,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
