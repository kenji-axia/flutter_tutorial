import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

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

  final String _unlikeButtonText = '興味なし';
  final String _favoriteButtonText = 'お気に入り';

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
          Row(
            children: [
              Expanded(
                child: Image.asset(residenceOutsideImagePath),
              ),
              Expanded(
                child: Image.asset(residenceInsideImagePath),
              ),
            ],
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
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                sizedBox4,
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[300],
                  ),
                ),
                sizedBox4,
                Row(
                  children: [
                    Icon(
                      Icons.train,
                      size: 15,
                      color: Colors.grey[600],
                    ),
                    sizedBox8,
                    Text(place),
                  ],
                ),
                sizedBox4,
                Row(
                  children: [
                    Icon(
                      Icons.grid_view_rounded,
                      size: 15,
                      color: Colors.grey[600],
                    ),
                    sizedBox8,
                    Text(size),
                  ],
                ),
                sizedBox4,
                Row(
                  children: [
                    Icon(
                      Icons.business,
                      size: 15,
                      color: Colors.grey[600],
                    ),
                    sizedBox8,
                    Text(buildingInfo),
                  ],
                ),
                sizedBox16,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: borderRadius10,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: spacing2,
                          vertical: spacingHalf,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.grey.shade400,
                              size: 25,
                            ),
                            sizedBox16,
                            Text(
                              _unlikeButtonText,
                              style: fontSize14,
                            ),
                          ],
                        ),
                      ),
                    ),
                    sizedBox8,
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: borderRadius10,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: spacing2,
                          vertical: spacingHalf,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.grey.shade400,
                              size: 25,
                            ),
                            sizedBox16,
                            Text(
                              _favoriteButtonText,
                              style: fontSize14,
                            ),
                          ],
                        ),
                      ),
                    ),
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
