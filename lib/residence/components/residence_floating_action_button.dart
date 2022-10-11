import 'package:flutter/material.dart';

class ResidenceFloatingActionButton extends StatelessWidget {
  const ResidenceFloatingActionButton(this._mainAccentColor, {Key? key})
      : super(key: key);

  final Color _mainAccentColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: _mainAccentColor,
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
