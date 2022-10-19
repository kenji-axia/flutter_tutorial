import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

class MercariBottomNavigationBar extends StatelessWidget {
  const MercariBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: mercariMainAccentColor,
      selectedItemColor: mercariMainAccentColor,
      iconSize: 30,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      currentIndex: 2,
      backgroundColor: white,
      selectedLabelStyle: fontWeightBoldTextStyle,
      unselectedLabelStyle: fontWeightBoldTextStyle,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          activeIcon: Icon(Icons.notifications),
          label: 'お知らせ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt_outlined),
          activeIcon: Icon(Icons.camera_alt_rounded),
          label: '出品',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          activeIcon: Icon(Icons.qr_code_scanner),
          label: 'メルペイ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'マイページ',
        ),
      ],
    );
  }
}
