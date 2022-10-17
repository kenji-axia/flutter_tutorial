import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

class ItemButton extends StatelessWidget {
  const ItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: mercariRedAccentColor,
        onPrimary: white,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius4,
        ),
      ),
      onPressed: () {},
      child: const Text(
        '出品する',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
