// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residence_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResidenceMetadata _$$_ResidenceMetadataFromJson(Map<String, dynamic> json) =>
    _$_ResidenceMetadata(
      name: json['name'] as String?,
      price: json['price'] as int?,
      place: json['place'] as String?,
      size: json['size'] as String?,
      buildingInfo: json['buildingInfo'] as String?,
      residenceInsideImagePath: json['residenceInsideImagePath'] as String?,
      residenceOutsideImagePath: json['residenceOutsideImagePath'] as String?,
    );

Map<String, dynamic> _$$_ResidenceMetadataToJson(
        _$_ResidenceMetadata instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'place': instance.place,
      'size': instance.size,
      'buildingInfo': instance.buildingInfo,
      'residenceInsideImagePath': instance.residenceInsideImagePath,
      'residenceOutsideImagePath': instance.residenceOutsideImagePath,
    };
