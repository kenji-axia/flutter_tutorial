import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_metadata.freezed.dart';
part 'movie_metadata.g.dart';

@freezed
class MovieMetadata with _$MovieMetadata {
  const factory MovieMetadata({
    @JsonKey(name: "imagePath") String? imagePath,
    @JsonKey(name: "iconPath") String? iconPath,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "channelName") String? channelName,
    @JsonKey(name: "numOfViews") int? numOfViews,
    @JsonKey(name: "yearsAgo") int? yearsAgo,
    @JsonKey(name: "duration") String? duration,
  }) = _MovieMetadata;

  factory MovieMetadata.fromJson(Map<String, dynamic> json) =>
      _$MovieMetadataFromJson(json);
}
