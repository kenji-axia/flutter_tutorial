// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mercari_client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MercariClientStateTearOff {
  const _$MercariClientStateTearOff();

  _MercariClientState call(
      {bool isLoading = false,
      List<ItemMetadata> itemMetadataList = const <ItemMetadata>[]}) {
    return _MercariClientState(
      isLoading: isLoading,
      itemMetadataList: itemMetadataList,
    );
  }
}

/// @nodoc
const $MercariClientState = _$MercariClientStateTearOff();

/// @nodoc
mixin _$MercariClientState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ItemMetadata> get itemMetadataList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MercariClientStateCopyWith<MercariClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MercariClientStateCopyWith<$Res> {
  factory $MercariClientStateCopyWith(
          MercariClientState value, $Res Function(MercariClientState) then) =
      _$MercariClientStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, List<ItemMetadata> itemMetadataList});
}

/// @nodoc
class _$MercariClientStateCopyWithImpl<$Res>
    implements $MercariClientStateCopyWith<$Res> {
  _$MercariClientStateCopyWithImpl(this._value, this._then);

  final MercariClientState _value;
  // ignore: unused_field
  final $Res Function(MercariClientState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? itemMetadataList = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      itemMetadataList: itemMetadataList == freezed
          ? _value.itemMetadataList
          : itemMetadataList // ignore: cast_nullable_to_non_nullable
              as List<ItemMetadata>,
    ));
  }
}

/// @nodoc
abstract class _$MercariClientStateCopyWith<$Res>
    implements $MercariClientStateCopyWith<$Res> {
  factory _$MercariClientStateCopyWith(
          _MercariClientState value, $Res Function(_MercariClientState) then) =
      __$MercariClientStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, List<ItemMetadata> itemMetadataList});
}

/// @nodoc
class __$MercariClientStateCopyWithImpl<$Res>
    extends _$MercariClientStateCopyWithImpl<$Res>
    implements _$MercariClientStateCopyWith<$Res> {
  __$MercariClientStateCopyWithImpl(
      _MercariClientState _value, $Res Function(_MercariClientState) _then)
      : super(_value, (v) => _then(v as _MercariClientState));

  @override
  _MercariClientState get _value => super._value as _MercariClientState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? itemMetadataList = freezed,
  }) {
    return _then(_MercariClientState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      itemMetadataList: itemMetadataList == freezed
          ? _value.itemMetadataList
          : itemMetadataList // ignore: cast_nullable_to_non_nullable
              as List<ItemMetadata>,
    ));
  }
}

/// @nodoc

class _$_MercariClientState implements _MercariClientState {
  const _$_MercariClientState(
      {this.isLoading = false, this.itemMetadataList = const <ItemMetadata>[]});

  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final List<ItemMetadata> itemMetadataList;

  @override
  String toString() {
    return 'MercariClientState(isLoading: $isLoading, itemMetadataList: $itemMetadataList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MercariClientState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.itemMetadataList, itemMetadataList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(itemMetadataList));

  @JsonKey(ignore: true)
  @override
  _$MercariClientStateCopyWith<_MercariClientState> get copyWith =>
      __$MercariClientStateCopyWithImpl<_MercariClientState>(this, _$identity);
}

abstract class _MercariClientState implements MercariClientState {
  const factory _MercariClientState(
      {bool isLoading,
      List<ItemMetadata> itemMetadataList}) = _$_MercariClientState;

  @override
  bool get isLoading;
  @override
  List<ItemMetadata> get itemMetadataList;
  @override
  @JsonKey(ignore: true)
  _$MercariClientStateCopyWith<_MercariClientState> get copyWith =>
      throw _privateConstructorUsedError;
}
