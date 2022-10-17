import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

class ResidenceFloatingActionButton extends StatelessWidget {
  const ResidenceFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: residenceMainAccentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.search,
              size: 30,
            ),
            Text(
              '物件',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
