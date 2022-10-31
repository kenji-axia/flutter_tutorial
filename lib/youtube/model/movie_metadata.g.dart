// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieMetadata _$$_MovieMetadataFromJson(Map<String, dynamic> json) =>
    _$_MovieMetadata(
      imagePath: json['imagePath'] as String?,
      iconPath: json['iconPath'] as String?,
      title: json['title'] as String?,
      channelName: json['channelName'] as String?,
      numOfViews: json['numOfViews'] as int?,
      yearsAgo: json['yearsAgo'] as int?,
      duration: json['duration'] as String?,
    );

Map<String, dynamic> _$$_MovieMetadataToJson(_$_MovieMetadata instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'iconPath': instance.iconPath,
      'title': instance.title,
      'channelName': instance.channelName,
      'numOfViews': instance.numOfViews,
      'yearsAgo': instance.yearsAgo,
      'duration': instance.duration,
    };
