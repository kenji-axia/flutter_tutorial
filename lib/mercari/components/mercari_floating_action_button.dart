import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

class MercariFloatingActionButton extends StatelessWidget {
  const MercariFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: mercariRedAccentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.camera_alt,
              size: 24,
            ),
            Text(
              '出品',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
