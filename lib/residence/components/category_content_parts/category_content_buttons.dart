import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

class CategoryContentButtons extends StatelessWidget {
  const CategoryContentButtons({super.key});

  String get _unlikeButtonText => '興味なし';
  String get _favoriteButtonText => 'お気に入り';

  @override
  Widget build(BuildContext context) {
    return Row(
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
        sizedBoxW8,
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
    );
  }
}
