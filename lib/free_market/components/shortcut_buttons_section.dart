import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

class ShortcutButtonsSection extends StatelessWidget {
  const ShortcutButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          ShortCutButton(
            iconData: Icons.camera_alt_outlined,
            iconLabel: '写真を撮る',
          ),
          sizedBox8,
          ShortCutButton(
            iconData: Icons.collections_outlined,
            iconLabel: 'アルバム',
          ),
          sizedBox8,
          ShortCutButton(
            iconData: Icons.screenshot,
            iconLabel: 'バーコード\n(本・コスメ)',
          ),
          sizedBox8,
          ShortCutButton(
            iconData: Icons.text_snippet_outlined,
            iconLabel: '下書き一覧',
          ),
        ],
      ),
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.symmetric(vertical: spacing2),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
