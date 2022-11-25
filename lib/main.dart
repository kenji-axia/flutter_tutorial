import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'animation/animation_screen.dart';
import 'async/async_screen.dart';
import 'building/building_layout_screen.dart';
import 'drift/drift_screen.dart';
import 'mercari/mercari_screen.dart';
import 'qiita/qiita_client_screen.dart';
import 'residence/residence_screen.dart';
import 'youtube/youtube_screen.dart';
import 'schedule/schedule_screen.dart';

void main() async {
  // DateTimeの日本語表示
  await initializeDateFormatting('ja_JP');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({
    super.key,
    required this.title,
  });

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
          children: const [
            TransitionScreenButton(
              'Tutorial1',
              BuildingLayoutScreen(),
            ),
            TransitionScreenButton(
              'Tutorial1.1',
              AnimationScreen(),
            ),
            TransitionScreenButton(
              'Youtube',
              YoutubeScreen(),
            ),
            TransitionScreenButton(
              'Tutorial2.2',
              ResidenceScreen(),
            ),
            TransitionScreenButton(
              'Mercari',
              MercariScreen(),
            ),
            TransitionScreenButton(
              'Async',
              AsyncScreen(),
            ),
            TransitionScreenButton(
              'Qiita',
              QiitaClientScreen(),
            ),
            TransitionScreenButton(
              'Drift',
              DriftScreen(),
            ),
            TransitionScreenButton(
              'Schedule',
              ScheduleScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class TransitionScreenButton extends StatelessWidget {
  const TransitionScreenButton(this.text, this.newScreen, {super.key});
  final String text;
  final Widget newScreen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push<MaterialPageRoute<dynamic>>(
          MaterialPageRoute(
            builder: (context) => newScreen,
          ),
        );
      },
      child: Text(text),
    );
  }
}
