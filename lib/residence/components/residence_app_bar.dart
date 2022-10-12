import 'package:flutter/material.dart';

import 'package:badges/badges.dart';

import 'package:flutter_tutorial/constants.dart';

class ResidenceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ResidenceAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      titleSpacing: spacing0,
      iconTheme: const IconThemeData(
        color: residenceMainAccentColor,
      ),
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            CategoryButton(
              categoryText: '〇〇のおすすめ',
              isHighlight: true,
              notificationNum: 0,
            ),
            CategoryButton(
              categoryText: 'リフォーム済み',
              isHighlight: false,
              notificationNum: 1,
            ),
          ],
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: spacing2),
          child: const Icon(
            Icons.add_circle,
            size: 40,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    required this.categoryText,
    required this.isHighlight,
    required this.notificationNum,
    Key? key,
  }) : super(key: key);

  final String categoryText;
  final bool isHighlight;
  final int notificationNum;

  final double _categoryTextSize = 13;

  final Color _normalBackgroundColor = const Color.fromRGBO(243, 243, 243, 1);
  final Color _normalTextColor = Colors.black87;

  final Color _highlightBackgroundColor =
      const Color.fromRGBO(235, 239, 238, 1);
  final Color _highlightTextColor = const Color.fromRGBO(94, 150, 140, 1);

  @override
  Widget build(BuildContext context) {
    return Badge(
      showBadge: notificationNum != 0 ? true : false,
      position: BadgePosition.topEnd(end: 0),
      badgeContent: Text(
        notificationNum.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              isHighlight ? _highlightBackgroundColor : _normalBackgroundColor,
        ),
        margin: const EdgeInsets.only(right: spacing1),
        padding: const EdgeInsets.symmetric(
          horizontal: spacing2,
          vertical: spacing1,
        ),
        child: Row(
          children: [
            Text(
              categoryText,
              style: TextStyle(
                fontSize: _categoryTextSize,
                color: isHighlight ? _highlightTextColor : _normalTextColor,
                fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
