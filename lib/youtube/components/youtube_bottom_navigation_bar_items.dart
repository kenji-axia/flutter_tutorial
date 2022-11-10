import 'package:flutter/material.dart';

const youtubeBottomNavigationBarItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home_outlined,
    ),
    label: 'ホーム',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.explore,
    ),
    label: '探索',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.add_circle_outline_sharp,
      size: 50,
    ),
    label: '',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.slow_motion_video,
    ),
    label: '登録チャンネル',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.slideshow_outlined,
    ),
    label: 'ライブラリ',
  ),
];
