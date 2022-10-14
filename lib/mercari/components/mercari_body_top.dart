import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

import 'mercari_shortcut_buttons.dart';

class MercariBodyTop extends StatelessWidget {
  const MercariBodyTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacing2),
      color: const Color.fromRGBO(239, 239, 239, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.asset('images/mercari_guide.jpg'),
          ),
          sizedBox24,
          Text(
            '出品へのショートカット',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey[700],
            ),
          ),
          sizedBox16,
          const MercariShortcutButtons(),
        ],
      ),
    );
  }
}
