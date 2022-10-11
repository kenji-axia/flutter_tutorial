import 'package:flutter/material.dart';

class CategoryContent extends StatelessWidget {
  const CategoryContent({Key? key}) : super(key: key);

  final name = 'Rising place川崎';
  final price = '2,000万円';
  final place = '京急本線 京急川崎駅 より 徒歩9分';
  final size = '1K / 21.24㎡ 南西向き';
  final buildingInfo = '2階/15階建 築5年';

  final _residenceInsideImagePath = 'images/residence_inside.jpg';
  final _residenceOutsideImagePath = 'images/residence_outside.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
      // padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
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
            children: [
              Expanded(
                child: Image.asset(_residenceOutsideImagePath),
              ),
              Expanded(
                child: Image.asset(_residenceInsideImagePath),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  name,
                  // textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[300]),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.train,
                      size: 15,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      place,
                      style: const TextStyle(fontSize: 11),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.grid_view_rounded,
                      size: 15,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      size,
                      style: const TextStyle(fontSize: 11),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.business,
                      size: 15,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      buildingInfo,
                      style: const TextStyle(fontSize: 11),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.grey.shade400,
                              size: 25,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              '興味なし',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.grey.shade400,
                              size: 25,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'お気に入り',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
