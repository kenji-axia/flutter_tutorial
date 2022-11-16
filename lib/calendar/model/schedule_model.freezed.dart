// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ScheduleModelTearOff {
  const _$ScheduleModelTearOff();

  _ScheduleModel call(
      {required int scheduleId,
      required int tagId,
      required String tagName,
      required String body,
      required DateTime date,
      required DateTime createdAt}) {
    return _ScheduleModel(
      scheduleId: scheduleId,
      tagId: tagId,
      tagName: tagName,
      body: body,
      date: date,
      createdAt: createdAt,
    );
  }
}

/// @nodoc
const $ScheduleModel = _$ScheduleModelTearOff();

/// @nodoc
mixin _$ScheduleModel {
  int get scheduleId => throw _privateConstructorUsedError;
  int get tagId => throw _privateConstructorUsedError;
  String get tagName => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleModelCopyWith<ScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleModelCopyWith<$Res> {
  factory $ScheduleModelCopyWith(
          ScheduleModel value, $Res Function(ScheduleModel) then) =
      _$ScheduleModelCopyWithImpl<$Res>;
  $Res call(
      {int scheduleId,
      int tagId,
      String tagName,
      String body,
      DateTime date,
      DateTime createdAt});
}

/// @nodoc
class _$ScheduleModelCopyWithImpl<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  _$ScheduleModelCopyWithImpl(this._value, this._then);

  final ScheduleModel _value;
  // ignore: unused_field
  final $Res Function(ScheduleModel) _then;

  @override
  $Res call({
    Object? scheduleId = freezed,
    Object? tagId = freezed,
    Object? tagName = freezed,
    Object? body = freezed,
    Object? date = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      tagId: tagId == freezed
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      tagName: tagName == freezed
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ScheduleModelCopyWith<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  factory _$ScheduleModelCopyWith(
          _ScheduleModel value, $Res Function(_ScheduleModel) then) =
      __$ScheduleModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int scheduleId,
      int tagId,
      String tagName,
      String body,
      DateTime date,
      DateTime createdAt});
}

/// @nodoc
class __$ScheduleModelCopyWithImpl<$Res>
    extends _$ScheduleModelCopyWithImpl<$Res>
    implements _$ScheduleModelCopyWith<$Res> {
  __$ScheduleModelCopyWithImpl(
      _ScheduleModel _value, $Res Function(_ScheduleModel) _then)
      : super(_value, (v) => _then(v as _ScheduleModel));

  @override
  _ScheduleModel get _value => super._value as _ScheduleModel;

  @override
  $Res call({
    Object? scheduleId = freezed,
    Object? tagId = freezed,
    Object? tagName = freezed,
    Object? body = freezed,
    Object? date = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_ScheduleModel(
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      tagId: tagId == freezed
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      tagName: tagName == freezed
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ScheduleModel implements _ScheduleModel {
  const _$_ScheduleModel(
      {required this.scheduleId,
      required this.tagId,
      required this.tagName,
      required this.body,
      required this.date,
      required this.createdAt});

  @override
  final int scheduleId;
  @override
  final int tagId;
  @override
  final String tagName;
  @override
  final String body;
  @override
  final DateTime date;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ScheduleModel(scheduleId: $scheduleId, tagId: $tagId, tagName: $tagName, body: $body, date: $date, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleModel &&
            const DeepCollectionEquality()
                .equals(other.scheduleId, scheduleId) &&
            const DeepCollectionEquality().equals(other.tagId, tagId) &&
            const DeepCollectionEquality().equals(other.tagName, tagName) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(scheduleId),
      const DeepCollectionEquality().hash(tagId),
      const DeepCollectionEquality().hash(tagName),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$ScheduleModelCopyWith<_ScheduleModel> get copyWith =>
      __$ScheduleModelCopyWithImpl<_ScheduleModel>(this, _$identity);
}

abstract class _ScheduleModel implements ScheduleModel {
  const factory _ScheduleModel(
      {required int scheduleId,
      required int tagId,
      required String tagName,
      required String body,
      required DateTime date,
      required DateTime createdAt}) = _$_ScheduleModel;

  @override
  int get scheduleId;
  @override
  int get tagId;
  @override
  String get tagName;
  @override
  String get body;
  @override
  DateTime get date;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$ScheduleModelCopyWith<_ScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
