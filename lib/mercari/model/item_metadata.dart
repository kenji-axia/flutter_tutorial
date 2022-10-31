import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_metadata.freezed.dart';
part 'item_metadata.g.dart';

@freezed
class ItemMetadata with _$ItemMetadata {
  const factory ItemMetadata({
    String? name,
    int? price,
    int? searchingNum,
    String? imagePath,
  }) = _ItemMetadata;

  factory ItemMetadata.fromJson(Map<String, dynamic> json) =>
      _$ItemMetadataFromJson(json);
}
