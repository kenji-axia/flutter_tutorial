// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarStateTearOff {
  const _$CalendarStateTearOff();

  _CalendarState call(
      {required DateTime selectedDate,
      String selectedTag = '全て',
      List<ScheduleModel> scheduleList = const <ScheduleModel>[]}) {
    return _CalendarState(
      selectedDate: selectedDate,
      selectedTag: selectedTag,
      scheduleList: scheduleList,
    );
  }
}

/// @nodoc
const $CalendarState = _$CalendarStateTearOff();

/// @nodoc
mixin _$CalendarState {
  DateTime get selectedDate => throw _privateConstructorUsedError;
  String get selectedTag => throw _privateConstructorUsedError;
  List<ScheduleModel> get scheduleList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res>;
  $Res call(
      {DateTime selectedDate,
      String selectedTag,
      List<ScheduleModel> scheduleList});
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  final CalendarState _value;
  // ignore: unused_field
  final $Res Function(CalendarState) _then;

  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? selectedTag = freezed,
    Object? scheduleList = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedTag: selectedTag == freezed
          ? _value.selectedTag
          : selectedTag // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleList: scheduleList == freezed
          ? _value.scheduleList
          : scheduleList // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>,
    ));
  }
}

/// @nodoc
abstract class _$CalendarStateCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(
          _CalendarState value, $Res Function(_CalendarState) then) =
      __$CalendarStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime selectedDate,
      String selectedTag,
      List<ScheduleModel> scheduleList});
}

/// @nodoc
class __$CalendarStateCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res>
    implements _$CalendarStateCopyWith<$Res> {
  __$CalendarStateCopyWithImpl(
      _CalendarState _value, $Res Function(_CalendarState) _then)
      : super(_value, (v) => _then(v as _CalendarState));

  @override
  _CalendarState get _value => super._value as _CalendarState;

  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? selectedTag = freezed,
    Object? scheduleList = freezed,
  }) {
    return _then(_CalendarState(
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedTag: selectedTag == freezed
          ? _value.selectedTag
          : selectedTag // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleList: scheduleList == freezed
          ? _value.scheduleList
          : scheduleList // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>,
    ));
  }
}

/// @nodoc

class _$_CalendarState implements _CalendarState {
  const _$_CalendarState(
      {required this.selectedDate,
      this.selectedTag = '全て',
      this.scheduleList = const <ScheduleModel>[]});

  @override
  final DateTime selectedDate;
  @JsonKey()
  @override
  final String selectedTag;
  @JsonKey()
  @override
  final List<ScheduleModel> scheduleList;

  @override
  String toString() {
    return 'CalendarState(selectedDate: $selectedDate, selectedTag: $selectedTag, scheduleList: $scheduleList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalendarState &&
            const DeepCollectionEquality()
                .equals(other.selectedDate, selectedDate) &&
            const DeepCollectionEquality()
                .equals(other.selectedTag, selectedTag) &&
            const DeepCollectionEquality()
                .equals(other.scheduleList, scheduleList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedDate),
      const DeepCollectionEquality().hash(selectedTag),
      const DeepCollectionEquality().hash(scheduleList));

  @JsonKey(ignore: true)
  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith =>
      __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  const factory _CalendarState(
      {required DateTime selectedDate,
      String selectedTag,
      List<ScheduleModel> scheduleList}) = _$_CalendarState;

  @override
  DateTime get selectedDate;
  @override
  String get selectedTag;
  @override
  List<ScheduleModel> get scheduleList;
  @override
  @JsonKey(ignore: true)
  _$CalendarStateCopyWith<_CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}
