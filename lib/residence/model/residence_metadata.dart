import 'package:freezed_annotation/freezed_annotation.dart';

part 'residence_metadata.freezed.dart';
part 'residence_metadata.g.dart';

@freezed
class ResidenceMetadata with _$ResidenceMetadata {
  const factory ResidenceMetadata({
    String? name,
    int? price,
    String? place,
    String? size,
    String? buildingInfo,
    String? residenceInsideImagePath,
    String? residenceOutsideImagePath,
  }) = _ResidenceMetadata;

  factory ResidenceMetadata.fromJson(Map<String, dynamic> json) =>
      _$ResidenceMetadataFromJson(json);
}
