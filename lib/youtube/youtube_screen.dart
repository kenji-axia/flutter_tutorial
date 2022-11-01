import 'package:flutter/material.dart';

import 'components/youtube_app_bar.dart';
import 'components/youtube_categories_section.dart';
import 'components/youtube_videos_section.dart';
import 'components/youtube_bottom_navigation_bar_items.dart';

class YoutubeScreen extends StatelessWidget {
  const YoutubeScreen({super.key});

  Color get _mainBackgroundColor => const Color.fromRGBO(42, 39, 44, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _mainBackgroundColor,
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: ListView(
            children: const [
              YoutubeAppBar(),
              YoutubeCategoriesSection(),
              YoutubeVideosSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        selectedFontSize: 9,
        unselectedFontSize: 9,
        backgroundColor: _mainBackgroundColor,
        items: youtubeBottomNavigationBarItems,
      ),
    );
  }
}
