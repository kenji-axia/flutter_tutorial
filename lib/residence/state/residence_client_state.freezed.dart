// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'residence_client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResidenceClientStateTearOff {
  const _$ResidenceClientStateTearOff();

  _ResidenceClientState call(
      {bool isLoading = false,
      List<ResidenceMetadata> residenceMetadataList =
          const <ResidenceMetadata>[]}) {
    return _ResidenceClientState(
      isLoading: isLoading,
      residenceMetadataList: residenceMetadataList,
    );
  }
}

/// @nodoc
const $ResidenceClientState = _$ResidenceClientStateTearOff();

/// @nodoc
mixin _$ResidenceClientState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ResidenceMetadata> get residenceMetadataList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResidenceClientStateCopyWith<ResidenceClientState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidenceClientStateCopyWith<$Res> {
  factory $ResidenceClientStateCopyWith(ResidenceClientState value,
          $Res Function(ResidenceClientState) then) =
      _$ResidenceClientStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, List<ResidenceMetadata> residenceMetadataList});
}

/// @nodoc
class _$ResidenceClientStateCopyWithImpl<$Res>
    implements $ResidenceClientStateCopyWith<$Res> {
  _$ResidenceClientStateCopyWithImpl(this._value, this._then);

  final ResidenceClientState _value;
  // ignore: unused_field
  final $Res Function(ResidenceClientState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? residenceMetadataList = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      residenceMetadataList: residenceMetadataList == freezed
          ? _value.residenceMetadataList
          : residenceMetadataList // ignore: cast_nullable_to_non_nullable
              as List<ResidenceMetadata>,
    ));
  }
}

/// @nodoc
abstract class _$ResidenceClientStateCopyWith<$Res>
    implements $ResidenceClientStateCopyWith<$Res> {
  factory _$ResidenceClientStateCopyWith(_ResidenceClientState value,
          $Res Function(_ResidenceClientState) then) =
      __$ResidenceClientStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, List<ResidenceMetadata> residenceMetadataList});
}

/// @nodoc
class __$ResidenceClientStateCopyWithImpl<$Res>
    extends _$ResidenceClientStateCopyWithImpl<$Res>
    implements _$ResidenceClientStateCopyWith<$Res> {
  __$ResidenceClientStateCopyWithImpl(
      _ResidenceClientState _value, $Res Function(_ResidenceClientState) _then)
      : super(_value, (v) => _then(v as _ResidenceClientState));

  @override
  _ResidenceClientState get _value => super._value as _ResidenceClientState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? residenceMetadataList = freezed,
  }) {
    return _then(_ResidenceClientState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      residenceMetadataList: residenceMetadataList == freezed
          ? _value.residenceMetadataList
          : residenceMetadataList // ignore: cast_nullable_to_non_nullable
              as List<ResidenceMetadata>,
    ));
  }
}

/// @nodoc

class _$_ResidenceClientState implements _ResidenceClientState {
  const _$_ResidenceClientState(
      {this.isLoading = false,
      this.residenceMetadataList = const <ResidenceMetadata>[]});

  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final List<ResidenceMetadata> residenceMetadataList;

  @override
  String toString() {
    return 'ResidenceClientState(isLoading: $isLoading, residenceMetadataList: $residenceMetadataList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResidenceClientState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.residenceMetadataList, residenceMetadataList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(residenceMetadataList));

  @JsonKey(ignore: true)
  @override
  _$ResidenceClientStateCopyWith<_ResidenceClientState> get copyWith =>
      __$ResidenceClientStateCopyWithImpl<_ResidenceClientState>(
          this, _$identity);
}

abstract class _ResidenceClientState implements ResidenceClientState {
  const factory _ResidenceClientState(
      {bool isLoading,
      List<ResidenceMetadata> residenceMetadataList}) = _$_ResidenceClientState;

  @override
  bool get isLoading;
  @override
  List<ResidenceMetadata> get residenceMetadataList;
  @override
  @JsonKey(ignore: true)
  _$ResidenceClientStateCopyWith<_ResidenceClientState> get copyWith =>
      throw _privateConstructorUsedError;
}
