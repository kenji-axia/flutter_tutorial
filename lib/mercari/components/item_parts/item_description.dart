import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription(
      {required this.name,
      required this.price,
      required this.searchingNum,
      Key? key})
      : super(key: key);

  final String name;
  final String price;
  final String searchingNum;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          style: fontWeight600TextStyle,
        ),
        sizedBoxH4,
        Text(
          price,
          style: fontWeight600TextStyle,
        ),
        sizedBoxH4,
        Row(
          children: [
            const Icon(
              Icons.local_fire_department_rounded,
              size: 17,
              color: Colors.blueAccent,
            ),
            sizedBoxW4,
            Text(
              '$searchingNumが探しています',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 11,
              ),
            ),
          ],
        )
      ],
    );
  }
}
