import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constants.dart';

import 'components/free_market_bottom_navigation_bar.dart';
import 'components/shortcut_buttons_section.dart';

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
            ],
          ),
        ),
      ),
      bottomNavigationBar: const FreeMarketBottomNavigationBar(),
    );
  }
}
