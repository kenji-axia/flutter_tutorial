import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_metadata.freezed.dart';
part 'movie_metadata.g.dart';

@freezed
class MovieMetadata with _$MovieMetadata {
  const factory MovieMetadata({
    String? imagePath,
    String? iconPath,
    String? title,
    String? channelName,
    int? numOfViews,
    int? yearsAgo,
    String? duration,
  }) = _MovieMetadata;

  factory MovieMetadata.fromJson(Map<String, dynamic> json) =>
      _$MovieMetadataFromJson(json);
}
