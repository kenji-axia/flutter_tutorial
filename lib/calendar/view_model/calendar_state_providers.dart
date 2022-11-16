import 'package:flutter_riverpod/flutter_riverpod.dart';

final tagStateProvider = StateProvider((ref) => '全て');

final tagSetStateProvider = StateProvider((ref) => <String>{});

final selectedDateStateProvider = StateProvider((ref) => DateTime.now());
