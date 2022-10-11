import 'package:flutter/material.dart';

class CategoryFilteringSection extends StatelessWidget {
  const CategoryFilteringSection(
      this._mainAccentColor, this._mainBackgroundColor,
      {Key? key})
      : super(key: key);

  final Color _mainAccentColor;
  final Color _mainBackgroundColor;

  final String _trainInfo = '東京駅・品川駅・川崎駅・横浜駅・目黒駅・恵比寿駅・渋谷駅・';
  final String _priceInfo = '下限なし 〜 2,000万円';
  final String _anotherInfo = '1R 〜 4LDK / 10㎡以上 / 徒歩20分';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
                  SizedBox(width: 8),
                  Text(
                    '〇〇のおすすめ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: 8),
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
                children: [
                  Text(
                    '編集',
                    style: TextStyle(
                      fontSize: 12,
                      color: _mainAccentColor,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.edit,
                    color: _mainAccentColor,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: _mainBackgroundColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.train,
                      size: 15,
                      color: Colors.grey[700],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _trainInfo,
                      style: const TextStyle(fontSize: 11),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.currency_yen,
                      size: 15,
                      color: Colors.grey[700],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _priceInfo,
                      style: const TextStyle(fontSize: 11),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 15,
                      color: Colors.grey[700],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _anotherInfo,
                      style: const TextStyle(fontSize: 11),
                    )
                  ],
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
