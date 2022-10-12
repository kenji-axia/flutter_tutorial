import 'package:flutter/material.dart';

class FreeMarketScreen extends StatelessWidget {
  const FreeMarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: ListView(
            children: const [],
          ),
        ),
      ),
    );
  }
}
