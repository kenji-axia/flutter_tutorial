import 'package:flutter/material.dart';

import 'package:badges/badges.dart';

class ResidenceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ResidenceAppBar(this._mainAccentColor, {Key? key}) : super(key: key);

  final Color _mainAccentColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 64,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      iconTheme: IconThemeData(
        color: _mainAccentColor,
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
          margin: const EdgeInsets.only(right: 16),
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
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Badge(
        showBadge: notificationNum == 0 ? false : true,
        position: BadgePosition.topEnd(end: 0),
        badgeContent: Text(
          notificationNum.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isHighlight
                ? _highlightBackgroundColor
                : _normalBackgroundColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      ),
    );
  }
}
