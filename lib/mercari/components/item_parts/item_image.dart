import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({required this.imagePath, Key? key}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: borderRadius6,
      ),
      child: Image.asset(imagePath),
    );
  }
}
