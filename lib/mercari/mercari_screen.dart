import 'package:flutter/material.dart';

import 'package:flutter_tutorial/constants.dart';

import 'components/mercari_body_top.dart';
import 'components/mercari_body_bottom.dart';
import 'components/mercari_floating_action_button.dart';
import 'components/mercari_bottom_navigation_bar.dart';

class MercariScreen extends StatelessWidget {
  const MercariScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: const Text('出品'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: black87,
          fontSize: 18,
        ),
      ),
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(
            color: black87,
            fontSize: 15,
          ),
          child: ListView(
            children: const [
              // Body上部の作成　画像と複数のショートカットボタンを表示
              MercariBodyTop(),
              // Body下部の作成「売れやすい持ち物」リストを表示
              MercariBodyBottom(),
            ],
          ),
        ),
      ),
      floatingActionButton: const MercariFloatingActionButton(),
      bottomNavigationBar: const MercariBottomNavigationBar(),
    );
  }
}
