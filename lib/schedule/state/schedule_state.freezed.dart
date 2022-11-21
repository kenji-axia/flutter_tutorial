// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ScheduleStateTearOff {
  const _$ScheduleStateTearOff();

  _ScheduleState call(
      {required DateTime selectedDate,
      String selectedTag = '全て',
      Set<String> allTags = const <String>{},
      List<ScheduleModel> allSchedules = const <ScheduleModel>[]}) {
    return _ScheduleState(
      selectedDate: selectedDate,
      selectedTag: selectedTag,
      allTags: allTags,
      allSchedules: allSchedules,
    );
  }
}

/// @nodoc
const $ScheduleState = _$ScheduleStateTearOff();

/// @nodoc
mixin _$ScheduleState {
  DateTime get selectedDate => throw _privateConstructorUsedError;
  String get selectedTag => throw _privateConstructorUsedError;
  Set<String> get allTags => throw _privateConstructorUsedError;
  List<ScheduleModel> get allSchedules => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleStateCopyWith<ScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleStateCopyWith<$Res> {
  factory $ScheduleStateCopyWith(
          ScheduleState value, $Res Function(ScheduleState) then) =
      _$ScheduleStateCopyWithImpl<$Res>;
  $Res call(
      {DateTime selectedDate,
      String selectedTag,
      Set<String> allTags,
      List<ScheduleModel> allSchedules});
}

/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._value, this._then);

  final ScheduleState _value;
  // ignore: unused_field
  final $Res Function(ScheduleState) _then;

  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? selectedTag = freezed,
    Object? allTags = freezed,
    Object? allSchedules = freezed,
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
      allTags: allTags == freezed
          ? _value.allTags
          : allTags // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      allSchedules: allSchedules == freezed
          ? _value.allSchedules
          : allSchedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>,
    ));
  }
}

/// @nodoc
abstract class _$ScheduleStateCopyWith<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  factory _$ScheduleStateCopyWith(
          _ScheduleState value, $Res Function(_ScheduleState) then) =
      __$ScheduleStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime selectedDate,
      String selectedTag,
      Set<String> allTags,
      List<ScheduleModel> allSchedules});
}

/// @nodoc
class __$ScheduleStateCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res>
    implements _$ScheduleStateCopyWith<$Res> {
  __$ScheduleStateCopyWithImpl(
      _ScheduleState _value, $Res Function(_ScheduleState) _then)
      : super(_value, (v) => _then(v as _ScheduleState));

  @override
  _ScheduleState get _value => super._value as _ScheduleState;

  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? selectedTag = freezed,
    Object? allTags = freezed,
    Object? allSchedules = freezed,
  }) {
    return _then(_ScheduleState(
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedTag: selectedTag == freezed
          ? _value.selectedTag
          : selectedTag // ignore: cast_nullable_to_non_nullable
              as String,
      allTags: allTags == freezed
          ? _value.allTags
          : allTags // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      allSchedules: allSchedules == freezed
          ? _value.allSchedules
          : allSchedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleModel>,
    ));
  }
}

/// @nodoc

class _$_ScheduleState extends _ScheduleState {
  const _$_ScheduleState(
      {required this.selectedDate,
      this.selectedTag = '全て',
      this.allTags = const <String>{},
      this.allSchedules = const <ScheduleModel>[]})
      : super._();

  @override
  final DateTime selectedDate;
  @JsonKey()
  @override
  final String selectedTag;
  @JsonKey()
  @override
  final Set<String> allTags;
  @JsonKey()
  @override
  final List<ScheduleModel> allSchedules;

  @override
  String toString() {
    return 'ScheduleState(selectedDate: $selectedDate, selectedTag: $selectedTag, allTags: $allTags, allSchedules: $allSchedules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleState &&
            const DeepCollectionEquality()
                .equals(other.selectedDate, selectedDate) &&
            const DeepCollectionEquality()
                .equals(other.selectedTag, selectedTag) &&
            const DeepCollectionEquality().equals(other.allTags, allTags) &&
            const DeepCollectionEquality()
                .equals(other.allSchedules, allSchedules));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedDate),
      const DeepCollectionEquality().hash(selectedTag),
      const DeepCollectionEquality().hash(allTags),
      const DeepCollectionEquality().hash(allSchedules));

  @JsonKey(ignore: true)
  @override
  _$ScheduleStateCopyWith<_ScheduleState> get copyWith =>
      __$ScheduleStateCopyWithImpl<_ScheduleState>(this, _$identity);
}

abstract class _ScheduleState extends ScheduleState {
  const factory _ScheduleState(
      {required DateTime selectedDate,
      String selectedTag,
      Set<String> allTags,
      List<ScheduleModel> allSchedules}) = _$_ScheduleState;
  const _ScheduleState._() : super._();

  @override
  DateTime get selectedDate;
  @override
  String get selectedTag;
  @override
  Set<String> get allTags;
  @override
  List<ScheduleModel> get allSchedules;
  @override
  @JsonKey(ignore: true)
  _$ScheduleStateCopyWith<_ScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}
