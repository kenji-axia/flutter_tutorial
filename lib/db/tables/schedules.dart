import 'package:drift/drift.dart';

class Schedules extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get tag => text().withLength(min: 1, max: 30)();
  TextColumn get body => text().withLength(min: 1, max: 1000)();
  DateTimeColumn get createdAt => dateTime()();
}
