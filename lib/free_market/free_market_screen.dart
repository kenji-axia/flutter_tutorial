import 'package:flutter/material.dart';

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
          style: const TextStyle(color: Colors.white),
          child: ListView(
            children: const [],
          ),
        ),
      ),
      bottomNavigationBar: const FreeMarketBottomNavigationBar(),
    );
  }
}
