import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

import 'mercari_shortcut_buttons.dart';

class MercariBodyTop extends StatelessWidget {
  const MercariBodyTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacing2),
      color: mercariBodyTopBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: borderRadius4,
            ),
            child: Image.asset('images/mercari_guide.jpg'),
          ),
          sizedBoxH24,
          Text(
            '出品へのショートカット',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: grey700,
            ),
          ),
          sizedBoxH16,
          const MercariShortcutButtons(),
        ],
      ),
    );
  }
}
