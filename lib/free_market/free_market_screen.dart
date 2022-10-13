import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

import 'components/shortcut_buttons_section.dart';
import 'components/item_list_section.dart';
import 'components/free_market_bottom_navigation_bar.dart';

class FreeMarketScreen extends StatelessWidget {
  const FreeMarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('出品'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontSize: 18,
        ),
      ),
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 11,
          ),
          child: ListView(
            children: [
              // Body上部の作成　画像とショートカットボタン
              Container(
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
                      child: Image.asset('images/freemarket_guide.jpg'),
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
                    ShortcutButtonsSection(),
                  ],
                ),
              ),
              // Body下部の作成　「売れやすい持ち物」リストの表示
              ItemListSection(),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: freeMarketRedAccentColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.camera_alt,
                size: 24,
              ),
              Text(
                '出品',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const FreeMarketBottomNavigationBar(),
    );
  }
}
