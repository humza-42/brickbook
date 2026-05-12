import 'package:freezed_annotation/freezed_annotation.dart';

part 'sharing_models.freezed.dart';
part 'sharing_models.g.dart';

@freezed
class GuestLink with _$GuestLink {
  const factory GuestLink({
    required String id,
    required String projectId,
    required String token,
    required String accessLevel,   // full | summary
    required String url,
    @Default(0)  int    viewCount,
    @Default(true) bool isActive,
    String? passwordHash,
    String? expiresAt,
    String? createdAt,
  }) = _GuestLink;

  factory GuestLink.fromJson(Map<String, dynamic> json) =>
      _$GuestLinkFromJson(json);
}

extension GuestLinkX on GuestLink {
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.tryParse(expiresAt!)?.isBefore(DateTime.now()) ?? false;
  }

  bool get isPasswordProtected => passwordHash != null;

  String get expiryLabel {
    if (expiresAt == null) return 'Never expires';
    final dt = DateTime.tryParse(expiresAt!);
    if (dt == null) return 'Unknown';
    if (isExpired) return 'Expired';
    final diff = dt.difference(DateTime.now());
    if (diff.inDays > 0) return 'Expires in ${diff.inDays}d';
    if (diff.inHours > 0) return 'Expires in ${diff.inHours}h';
    return 'Expiring soon';
  }
}

@freezed
class CreateGuestLinkRequest with _$CreateGuestLinkRequest {
  const factory CreateGuestLinkRequest({
    @Default('full') String accessLevel,
    String? expiresAt,
    String? password,
  }) = _CreateGuestLinkRequest;

  factory CreateGuestLinkRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateGuestLinkRequestFromJson(json);
}

@freezed
class ShareLog with _$ShareLog {
  const factory ShareLog({
    required String id,
    required String shareType,
    required String createdAt,
    String? recipient,
  }) = _ShareLog;

  factory ShareLog.fromJson(Map<String, dynamic> json) =>
      _$ShareLogFromJson(json);
}

// Expiry options
const kExpiryOptions = [
  {'label': '24 Hours',  'value': '24h'},
  {'label': '7 Days',    'value': '7d'},
  {'label': '30 Days',   'value': '30d'},
  {'label': 'Permanent', 'value': 'never'},
];
