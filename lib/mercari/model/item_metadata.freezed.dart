// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemMetadata _$ItemMetadataFromJson(Map<String, dynamic> json) {
  return _ItemMetadata.fromJson(json);
}

/// @nodoc
class _$ItemMetadataTearOff {
  const _$ItemMetadataTearOff();

  _ItemMetadata call(
      {String? name, int? price, int? searchingNum, String? imagePath}) {
    return _ItemMetadata(
      name: name,
      price: price,
      searchingNum: searchingNum,
      imagePath: imagePath,
    );
  }

  ItemMetadata fromJson(Map<String, Object?> json) {
    return ItemMetadata.fromJson(json);
  }
}

/// @nodoc
const $ItemMetadata = _$ItemMetadataTearOff();

/// @nodoc
mixin _$ItemMetadata {
  String? get name => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get searchingNum => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemMetadataCopyWith<ItemMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemMetadataCopyWith<$Res> {
  factory $ItemMetadataCopyWith(
          ItemMetadata value, $Res Function(ItemMetadata) then) =
      _$ItemMetadataCopyWithImpl<$Res>;
  $Res call({String? name, int? price, int? searchingNum, String? imagePath});
}

/// @nodoc
class _$ItemMetadataCopyWithImpl<$Res> implements $ItemMetadataCopyWith<$Res> {
  _$ItemMetadataCopyWithImpl(this._value, this._then);

  final ItemMetadata _value;
  // ignore: unused_field
  final $Res Function(ItemMetadata) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? searchingNum = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      searchingNum: searchingNum == freezed
          ? _value.searchingNum
          : searchingNum // ignore: cast_nullable_to_non_nullable
              as int?,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ItemMetadataCopyWith<$Res>
    implements $ItemMetadataCopyWith<$Res> {
  factory _$ItemMetadataCopyWith(
          _ItemMetadata value, $Res Function(_ItemMetadata) then) =
      __$ItemMetadataCopyWithImpl<$Res>;
  @override
  $Res call({String? name, int? price, int? searchingNum, String? imagePath});
}

/// @nodoc
class __$ItemMetadataCopyWithImpl<$Res> extends _$ItemMetadataCopyWithImpl<$Res>
    implements _$ItemMetadataCopyWith<$Res> {
  __$ItemMetadataCopyWithImpl(
      _ItemMetadata _value, $Res Function(_ItemMetadata) _then)
      : super(_value, (v) => _then(v as _ItemMetadata));

  @override
  _ItemMetadata get _value => super._value as _ItemMetadata;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? searchingNum = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_ItemMetadata(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      searchingNum: searchingNum == freezed
          ? _value.searchingNum
          : searchingNum // ignore: cast_nullable_to_non_nullable
              as int?,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemMetadata implements _ItemMetadata {
  const _$_ItemMetadata(
      {this.name, this.price, this.searchingNum, this.imagePath});

  factory _$_ItemMetadata.fromJson(Map<String, dynamic> json) =>
      _$$_ItemMetadataFromJson(json);

  @override
  final String? name;
  @override
  final int? price;
  @override
  final int? searchingNum;
  @override
  final String? imagePath;

  @override
  String toString() {
    return 'ItemMetadata(name: $name, price: $price, searchingNum: $searchingNum, imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemMetadata &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.searchingNum, searchingNum) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(searchingNum),
      const DeepCollectionEquality().hash(imagePath));

  @JsonKey(ignore: true)
  @override
  _$ItemMetadataCopyWith<_ItemMetadata> get copyWith =>
      __$ItemMetadataCopyWithImpl<_ItemMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemMetadataToJson(this);
  }
}

abstract class _ItemMetadata implements ItemMetadata {
  const factory _ItemMetadata(
      {String? name,
      int? price,
      int? searchingNum,
      String? imagePath}) = _$_ItemMetadata;

  factory _ItemMetadata.fromJson(Map<String, dynamic> json) =
      _$_ItemMetadata.fromJson;

  @override
  String? get name;
  @override
  int? get price;
  @override
  int? get searchingNum;
  @override
  String? get imagePath;
  @override
  @JsonKey(ignore: true)
  _$ItemMetadataCopyWith<_ItemMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}
