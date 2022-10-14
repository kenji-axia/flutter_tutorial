import 'package:flutter/material.dart';

class CategoryContentImages extends StatelessWidget {
  const CategoryContentImages(
      {required this.residenceOutsideImagePath,
      required this.residenceInsideImagePath,
      Key? key})
      : super(key: key);

  final String residenceOutsideImagePath;
  final String residenceInsideImagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(residenceOutsideImagePath),
        ),
        Expanded(
          child: Image.asset(residenceInsideImagePath),
        ),
      ],
    );
  }
}
