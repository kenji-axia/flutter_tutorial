import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(6),
      ),
      child: Image.asset(imagePath),
    );
  }
}
