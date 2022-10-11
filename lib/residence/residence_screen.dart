import 'package:flutter/material.dart';

import 'components/residence_app_bar.dart';

class ResidenceScreen extends StatelessWidget {
  const ResidenceScreen({Key? key}) : super(key: key);

  final _mainAccentColor = const Color.fromRGBO(82, 164, 154, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResidenceAppBar(_mainAccentColor),
      // appBar: ,
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
