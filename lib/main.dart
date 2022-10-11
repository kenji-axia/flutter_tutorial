import 'package:flutter/material.dart';

import 'building/building_layout_screen.dart';
import 'animation/animation_screen.dart';
import 'residence/residence_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Tutorial'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            TransitionScreenButton(
              'Tutorial1',
              BuildingLayoutScreen(),
            ),
            TransitionScreenButton(
              'Tutorial1.1',
              AnimationScreen(),
            ),
            TransitionScreenButton(
              'Tutorial2.2',
              ResidenceScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class TransitionScreenButton extends StatelessWidget {
  const TransitionScreenButton(this.text, this.newScreen, {Key? key})
      : super(key: key);
  final String text;
  final Widget newScreen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => newScreen,
          ),
        );
      },
      child: Text(text),
    );
  }
}
