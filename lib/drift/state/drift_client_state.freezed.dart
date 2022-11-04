// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'drift_client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DriftClientStateTearOff {
  const _$DriftClientStateTearOff();

  _TodoClientState call({List<Todo> todoList = const <Todo>[]}) {
    return _TodoClientState(
      todoList: todoList,
    );
  }
}

/// @nodoc
const $DriftClientState = _$DriftClientStateTearOff();

/// @nodoc
mixin _$DriftClientState {
  List<Todo> get todoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DriftClientStateCopyWith<DriftClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriftClientStateCopyWith<$Res> {
  factory $DriftClientStateCopyWith(
          DriftClientState value, $Res Function(DriftClientState) then) =
      _$DriftClientStateCopyWithImpl<$Res>;
  $Res call({List<Todo> todoList});
}

/// @nodoc
class _$DriftClientStateCopyWithImpl<$Res>
    implements $DriftClientStateCopyWith<$Res> {
  _$DriftClientStateCopyWithImpl(this._value, this._then);

  final DriftClientState _value;
  // ignore: unused_field
  final $Res Function(DriftClientState) _then;

  @override
  $Res call({
    Object? todoList = freezed,
  }) {
    return _then(_value.copyWith(
      todoList: todoList == freezed
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc
abstract class _$TodoClientStateCopyWith<$Res>
    implements $DriftClientStateCopyWith<$Res> {
  factory _$TodoClientStateCopyWith(
          _TodoClientState value, $Res Function(_TodoClientState) then) =
      __$TodoClientStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Todo> todoList});
}

/// @nodoc
class __$TodoClientStateCopyWithImpl<$Res>
    extends _$DriftClientStateCopyWithImpl<$Res>
    implements _$TodoClientStateCopyWith<$Res> {
  __$TodoClientStateCopyWithImpl(
      _TodoClientState _value, $Res Function(_TodoClientState) _then)
      : super(_value, (v) => _then(v as _TodoClientState));

  @override
  _TodoClientState get _value => super._value as _TodoClientState;

  @override
  $Res call({
    Object? todoList = freezed,
  }) {
    return _then(_TodoClientState(
      todoList: todoList == freezed
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc

class _$_TodoClientState implements _TodoClientState {
  const _$_TodoClientState({this.todoList = const <Todo>[]});

  @JsonKey()
  @override
  final List<Todo> todoList;

  @override
  String toString() {
    return 'DriftClientState(todoList: $todoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoClientState &&
            const DeepCollectionEquality().equals(other.todoList, todoList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(todoList));

  @JsonKey(ignore: true)
  @override
  _$TodoClientStateCopyWith<_TodoClientState> get copyWith =>
      __$TodoClientStateCopyWithImpl<_TodoClientState>(this, _$identity);
}

abstract class _TodoClientState implements DriftClientState {
  const factory _TodoClientState({List<Todo> todoList}) = _$_TodoClientState;

  @override
  List<Todo> get todoList;
  @override
  @JsonKey(ignore: true)
  _$TodoClientStateCopyWith<_TodoClientState> get copyWith =>
      throw _privateConstructorUsedError;
}
