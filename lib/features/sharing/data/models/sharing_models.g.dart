// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sharing_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestLinkImpl _$$GuestLinkImplFromJson(Map<String, dynamic> json) =>
    _$GuestLinkImpl(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      token: json['token'] as String,
      accessLevel: json['accessLevel'] as String,
      url: json['url'] as String,
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      passwordHash: json['passwordHash'] as String?,
      expiresAt: json['expiresAt'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$GuestLinkImplToJson(_$GuestLinkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'token': instance.token,
      'accessLevel': instance.accessLevel,
      'url': instance.url,
      'viewCount': instance.viewCount,
      'isActive': instance.isActive,
      'passwordHash': instance.passwordHash,
      'expiresAt': instance.expiresAt,
      'createdAt': instance.createdAt,
    };

_$CreateGuestLinkRequestImpl _$$CreateGuestLinkRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateGuestLinkRequestImpl(
      accessLevel: json['accessLevel'] as String? ?? 'full',
      expiresAt: json['expiresAt'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$CreateGuestLinkRequestImplToJson(
        _$CreateGuestLinkRequestImpl instance) =>
    <String, dynamic>{
      'accessLevel': instance.accessLevel,
      'expiresAt': instance.expiresAt,
      'password': instance.password,
    };

_$ShareLogImpl _$$ShareLogImplFromJson(Map<String, dynamic> json) =>
    _$ShareLogImpl(
      id: json['id'] as String,
      shareType: json['shareType'] as String,
      createdAt: json['createdAt'] as String,
      recipient: json['recipient'] as String?,
    );

Map<String, dynamic> _$$ShareLogImplToJson(_$ShareLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shareType': instance.shareType,
      'createdAt': instance.createdAt,
      'recipient': instance.recipient,
    };
