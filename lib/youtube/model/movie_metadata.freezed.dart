// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieMetadata _$MovieMetadataFromJson(Map<String, dynamic> json) {
  return _MovieMetadata.fromJson(json);
}

/// @nodoc
class _$MovieMetadataTearOff {
  const _$MovieMetadataTearOff();

  _MovieMetadata call(
      {String? imagePath,
      String? iconPath,
      String? title,
      String? channelName,
      int? numOfViews,
      int? yearsAgo,
      String? duration}) {
    return _MovieMetadata(
      imagePath: imagePath,
      iconPath: iconPath,
      title: title,
      channelName: channelName,
      numOfViews: numOfViews,
      yearsAgo: yearsAgo,
      duration: duration,
    );
  }

  MovieMetadata fromJson(Map<String, Object?> json) {
    return MovieMetadata.fromJson(json);
  }
}

/// @nodoc
const $MovieMetadata = _$MovieMetadataTearOff();

/// @nodoc
mixin _$MovieMetadata {
  String? get imagePath => throw _privateConstructorUsedError;
  String? get iconPath => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get channelName => throw _privateConstructorUsedError;
  int? get numOfViews => throw _privateConstructorUsedError;
  int? get yearsAgo => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieMetadataCopyWith<MovieMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieMetadataCopyWith<$Res> {
  factory $MovieMetadataCopyWith(
          MovieMetadata value, $Res Function(MovieMetadata) then) =
      _$MovieMetadataCopyWithImpl<$Res>;
  $Res call(
      {String? imagePath,
      String? iconPath,
      String? title,
      String? channelName,
      int? numOfViews,
      int? yearsAgo,
      String? duration});
}

/// @nodoc
class _$MovieMetadataCopyWithImpl<$Res>
    implements $MovieMetadataCopyWith<$Res> {
  _$MovieMetadataCopyWithImpl(this._value, this._then);

  final MovieMetadata _value;
  // ignore: unused_field
  final $Res Function(MovieMetadata) _then;

  @override
  $Res call({
    Object? imagePath = freezed,
    Object? iconPath = freezed,
    Object? title = freezed,
    Object? channelName = freezed,
    Object? numOfViews = freezed,
    Object? yearsAgo = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      iconPath: iconPath == freezed
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      channelName: channelName == freezed
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String?,
      numOfViews: numOfViews == freezed
          ? _value.numOfViews
          : numOfViews // ignore: cast_nullable_to_non_nullable
              as int?,
      yearsAgo: yearsAgo == freezed
          ? _value.yearsAgo
          : yearsAgo // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MovieMetadataCopyWith<$Res>
    implements $MovieMetadataCopyWith<$Res> {
  factory _$MovieMetadataCopyWith(
          _MovieMetadata value, $Res Function(_MovieMetadata) then) =
      __$MovieMetadataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? imagePath,
      String? iconPath,
      String? title,
      String? channelName,
      int? numOfViews,
      int? yearsAgo,
      String? duration});
}

/// @nodoc
class __$MovieMetadataCopyWithImpl<$Res>
    extends _$MovieMetadataCopyWithImpl<$Res>
    implements _$MovieMetadataCopyWith<$Res> {
  __$MovieMetadataCopyWithImpl(
      _MovieMetadata _value, $Res Function(_MovieMetadata) _then)
      : super(_value, (v) => _then(v as _MovieMetadata));

  @override
  _MovieMetadata get _value => super._value as _MovieMetadata;

  @override
  $Res call({
    Object? imagePath = freezed,
    Object? iconPath = freezed,
    Object? title = freezed,
    Object? channelName = freezed,
    Object? numOfViews = freezed,
    Object? yearsAgo = freezed,
    Object? duration = freezed,
  }) {
    return _then(_MovieMetadata(
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      iconPath: iconPath == freezed
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      channelName: channelName == freezed
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String?,
      numOfViews: numOfViews == freezed
          ? _value.numOfViews
          : numOfViews // ignore: cast_nullable_to_non_nullable
              as int?,
      yearsAgo: yearsAgo == freezed
          ? _value.yearsAgo
          : yearsAgo // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieMetadata implements _MovieMetadata {
  const _$_MovieMetadata(
      {this.imagePath,
      this.iconPath,
      this.title,
      this.channelName,
      this.numOfViews,
      this.yearsAgo,
      this.duration});

  factory _$_MovieMetadata.fromJson(Map<String, dynamic> json) =>
      _$$_MovieMetadataFromJson(json);

  @override
  final String? imagePath;
  @override
  final String? iconPath;
  @override
  final String? title;
  @override
  final String? channelName;
  @override
  final int? numOfViews;
  @override
  final int? yearsAgo;
  @override
  final String? duration;

  @override
  String toString() {
    return 'MovieMetadata(imagePath: $imagePath, iconPath: $iconPath, title: $title, channelName: $channelName, numOfViews: $numOfViews, yearsAgo: $yearsAgo, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovieMetadata &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality().equals(other.iconPath, iconPath) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.channelName, channelName) &&
            const DeepCollectionEquality()
                .equals(other.numOfViews, numOfViews) &&
            const DeepCollectionEquality().equals(other.yearsAgo, yearsAgo) &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imagePath),
      const DeepCollectionEquality().hash(iconPath),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(channelName),
      const DeepCollectionEquality().hash(numOfViews),
      const DeepCollectionEquality().hash(yearsAgo),
      const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$MovieMetadataCopyWith<_MovieMetadata> get copyWith =>
      __$MovieMetadataCopyWithImpl<_MovieMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieMetadataToJson(this);
  }
}

abstract class _MovieMetadata implements MovieMetadata {
  const factory _MovieMetadata(
      {String? imagePath,
      String? iconPath,
      String? title,
      String? channelName,
      int? numOfViews,
      int? yearsAgo,
      String? duration}) = _$_MovieMetadata;

  factory _MovieMetadata.fromJson(Map<String, dynamic> json) =
      _$_MovieMetadata.fromJson;

  @override
  String? get imagePath;
  @override
  String? get iconPath;
  @override
  String? get title;
  @override
  String? get channelName;
  @override
  int? get numOfViews;
  @override
  int? get yearsAgo;
  @override
  String? get duration;
  @override
  @JsonKey(ignore: true)
  _$MovieMetadataCopyWith<_MovieMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}
