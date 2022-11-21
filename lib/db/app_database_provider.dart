import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/db/app_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((_) => AppDatabase());
