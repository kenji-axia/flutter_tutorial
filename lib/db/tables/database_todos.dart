import 'package:drift/drift.dart';

class DatabaseTodos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  TextColumn get body => text().withLength(min: 1, max: 50)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get dueDate => dateTime()();
}
