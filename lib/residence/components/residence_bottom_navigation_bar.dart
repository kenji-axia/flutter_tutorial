import 'package:flutter/material.dart';

import 'package:badges/badges.dart';

class ResidenceBottomNavigationBar extends StatelessWidget {
  const ResidenceBottomNavigationBar(this._mainAccentColor, {Key? key})
      : super(key: key);

  final Color _mainAccentColor;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: _mainAccentColor,
      iconSize: 30,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      items: [
        ResidenceBottomNavigationBarItem(
          title: 'ホーム',
          inactiveIcon: Icons.home_outlined,
          activeIcon: Icons.home,
          notificationNum: 0,
        ),
        ResidenceBottomNavigationBarItem(
          title: 'お気に入り',
          inactiveIcon: Icons.favorite_border,
          activeIcon: Icons.favorite,
          notificationNum: 0,
        ),
        ResidenceBottomNavigationBarItem(
          title: 'メッセージ',
          inactiveIcon: Icons.chat_bubble_outline,
          activeIcon: Icons.chat_bubble,
          notificationNum: 1,
        ),
        ResidenceBottomNavigationBarItem(
          title: 'マイページ',
          inactiveIcon: Icons.person_outline,
          activeIcon: Icons.person,
          notificationNum: 0,
        ),
      ],
    );
  }
}

class ResidenceBottomNavigationBarItem extends BottomNavigationBarItem {
  ResidenceBottomNavigationBarItem({
    required String title,
    required IconData inactiveIcon,
    required IconData activeIcon,
    required int notificationNum,
  }) : super(
          icon: Badge(
            showBadge: notificationNum != 0 ? true : false,
            badgeContent: Text(
              notificationNum.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: Icon(
              inactiveIcon,
            ),
          ),
          activeIcon: Icon(
            activeIcon,
          ),
          label: title,
        );
}
