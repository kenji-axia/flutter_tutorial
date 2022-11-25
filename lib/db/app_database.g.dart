// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DatabaseTodo extends DataClass implements Insertable<DatabaseTodo> {
  final int id;
  final String title;
  final String body;
  final DateTime createdAt;
  final DateTime dueDate;
  DatabaseTodo(
      {required this.id,
      required this.title,
      required this.body,
      required this.createdAt,
      required this.dueDate});
  factory DatabaseTodo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DatabaseTodo(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      dueDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['due_date'] = Variable<DateTime>(dueDate);
    return map;
  }

  DatabaseTodosCompanion toCompanion(bool nullToAbsent) {
    return DatabaseTodosCompanion(
      id: Value(id),
      title: Value(title),
      body: Value(body),
      createdAt: Value(createdAt),
      dueDate: Value(dueDate),
    );
  }

  factory DatabaseTodo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DatabaseTodo(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'dueDate': serializer.toJson<DateTime>(dueDate),
    };
  }

  DatabaseTodo copyWith(
          {int? id,
          String? title,
          String? body,
          DateTime? createdAt,
          DateTime? dueDate}) =>
      DatabaseTodo(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        createdAt: createdAt ?? this.createdAt,
        dueDate: dueDate ?? this.dueDate,
      );
  @override
  String toString() {
    return (StringBuffer('DatabaseTodo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, body, createdAt, dueDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DatabaseTodo &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.createdAt == this.createdAt &&
          other.dueDate == this.dueDate);
}

class DatabaseTodosCompanion extends UpdateCompanion<DatabaseTodo> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> body;
  final Value<DateTime> createdAt;
  final Value<DateTime> dueDate;
  const DatabaseTodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.dueDate = const Value.absent(),
  });
  DatabaseTodosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String body,
    required DateTime createdAt,
    required DateTime dueDate,
  })  : title = Value(title),
        body = Value(body),
        createdAt = Value(createdAt),
        dueDate = Value(dueDate);
  static Insertable<DatabaseTodo> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? dueDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (createdAt != null) 'created_at': createdAt,
      if (dueDate != null) 'due_date': dueDate,
    });
  }

  DatabaseTodosCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? body,
      Value<DateTime>? createdAt,
      Value<DateTime>? dueDate}) {
    return DatabaseTodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DatabaseTodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }
}

class $DatabaseTodosTable extends DatabaseTodos
    with TableInfo<$DatabaseTodosTable, DatabaseTodo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DatabaseTodosTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String?> body = GeneratedColumn<String?>(
      'body', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime?> dueDate = GeneratedColumn<DateTime?>(
      'due_date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, body, createdAt, dueDate];
  @override
  String get aliasedName => _alias ?? 'database_todos';
  @override
  String get actualTableName => 'database_todos';
  @override
  VerificationContext validateIntegrity(Insertable<DatabaseTodo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DatabaseTodo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DatabaseTodo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DatabaseTodosTable createAlias(String alias) {
    return $DatabaseTodosTable(attachedDatabase, alias);
  }
}

class Schedule extends DataClass implements Insertable<Schedule> {
  final int id;
  final DateTime date;
  final String tag;
  final String body;
  final DateTime createdAt;
  Schedule(
      {required this.id,
      required this.date,
      required this.tag,
      required this.body,
      required this.createdAt});
  factory Schedule.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Schedule(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      tag: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag'])!,
      body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['tag'] = Variable<String>(tag);
    map['body'] = Variable<String>(body);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SchedulesCompanion toCompanion(bool nullToAbsent) {
    return SchedulesCompanion(
      id: Value(id),
      date: Value(date),
      tag: Value(tag),
      body: Value(body),
      createdAt: Value(createdAt),
    );
  }

  factory Schedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Schedule(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      tag: serializer.fromJson<String>(json['tag']),
      body: serializer.fromJson<String>(json['body']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'tag': serializer.toJson<String>(tag),
      'body': serializer.toJson<String>(body),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Schedule copyWith(
          {int? id,
          DateTime? date,
          String? tag,
          String? body,
          DateTime? createdAt}) =>
      Schedule(
        id: id ?? this.id,
        date: date ?? this.date,
        tag: tag ?? this.tag,
        body: body ?? this.body,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Schedule(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('tag: $tag, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, tag, body, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Schedule &&
          other.id == this.id &&
          other.date == this.date &&
          other.tag == this.tag &&
          other.body == this.body &&
          other.createdAt == this.createdAt);
}

class SchedulesCompanion extends UpdateCompanion<Schedule> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> tag;
  final Value<String> body;
  final Value<DateTime> createdAt;
  const SchedulesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.tag = const Value.absent(),
    this.body = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SchedulesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String tag,
    required String body,
    required DateTime createdAt,
  })  : date = Value(date),
        tag = Value(tag),
        body = Value(body),
        createdAt = Value(createdAt);
  static Insertable<Schedule> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? tag,
    Expression<String>? body,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (tag != null) 'tag': tag,
      if (body != null) 'body': body,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SchedulesCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<String>? tag,
      Value<String>? body,
      Value<DateTime>? createdAt}) {
    return SchedulesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      tag: tag ?? this.tag,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('tag: $tag, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SchedulesTable extends Schedules
    with TableInfo<$SchedulesTable, Schedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchedulesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String?> tag = GeneratedColumn<String?>(
      'tag', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 30),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String?> body = GeneratedColumn<String?>(
      'body', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date, tag, body, createdAt];
  @override
  String get aliasedName => _alias ?? 'schedules';
  @override
  String get actualTableName => 'schedules';
  @override
  VerificationContext validateIntegrity(Insertable<Schedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Schedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Schedule.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SchedulesTable createAlias(String alias) {
    return $SchedulesTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DatabaseTodosTable databaseTodos = $DatabaseTodosTable(this);
  late final $SchedulesTable schedules = $SchedulesTable(this);
  late final Tutorial8 tutorial8 = Tutorial8(this as AppDatabase);
  late final Tutorial9 tutorial9 = Tutorial9(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [databaseTodos, schedules];
}
