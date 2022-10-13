import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

class MercariShortcutButtonsSection extends StatelessWidget {
  const MercariShortcutButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        ShortCutButton(
          iconData: Icons.camera_alt_outlined,
          iconLabel: '写真を撮る',
        ),
        ShortCutButton(
          iconData: Icons.collections_outlined,
          iconLabel: 'アルバム',
        ),
        ShortCutButton(
          iconData: Icons.screenshot,
          iconLabel: 'バーコード\n(本・コスメ)',
        ),
        ShortCutButton(
          iconData: Icons.text_snippet_outlined,
          iconLabel: '下書き一覧',
        ),
      ],
    );
  }
}

class ShortCutButton extends StatelessWidget {
  const ShortCutButton(
      {required this.iconData, required this.iconLabel, Key? key})
      : super(key: key);

  final IconData iconData;
  final String iconLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.symmetric(vertical: spacing2),
      child: Center(
        child: Column(
          children: [
            Icon(
              iconData,
              size: 30,
            ),
            sizedBox8,
            Expanded(
              child: Center(
                child: Text(
                  iconLabel,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    letterSpacing: 0.4,
                    height: 1,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
