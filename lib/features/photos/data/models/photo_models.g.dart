// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SitePhotoImpl _$$SitePhotoImplFromJson(Map<String, dynamic> json) =>
    _$SitePhotoImpl(
      id: json['id'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      caption: json['caption'] as String?,
      category: json['category'] as String?,
      projectId: json['projectId'] as String?,
      projectName: json['projectName'] as String?,
      uploadedBy: json['uploadedBy'] as String?,
      takenAt: DateTime.parse(json['takenAt'] as String),
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      locationNotes: json['locationNotes'] as String?,
    );

Map<String, dynamic> _$$SitePhotoImplToJson(_$SitePhotoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'caption': instance.caption,
      'category': instance.category,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'uploadedBy': instance.uploadedBy,
      'takenAt': instance.takenAt.toIso8601String(),
      'uploadedAt': instance.uploadedAt.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'locationNotes': instance.locationNotes,
    };
