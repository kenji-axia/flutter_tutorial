import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

class CategoryContentTexts extends StatelessWidget {
  const CategoryContentTexts({
    required this.residenceName,
    required this.residencePrice,
    required this.residencePlace,
    required this.residenceSize,
    required this.residenceInfo,
    super.key,
  });

  final String residenceName;
  final String residencePrice;
  final String residencePlace;
  final String residenceSize;
  final String residenceInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          residenceName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        sizedBox4,
        Text(
          residencePrice,
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
            Text(residencePlace),
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
            Text(residenceSize),
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
            Text(residenceInfo),
          ],
        ),
      ],
    );
  }
}
