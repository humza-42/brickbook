import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

// User Model
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String role,
    String? email,
    String? phone,
    String? profilePhoto,
    @Default('en') String language,
    @Default(true) bool isActive,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

// Login Request
@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    String? email,
    String? phone,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

// Register Request
@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String name,
    String? email,
    String? phone,
    required String password,
    required String role,
    @Default('en') String language,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}

// Auth Response
@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String token,
    required UserModel user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

// OTP Request
@freezed
class OtpRequest with _$OtpRequest {
  const factory OtpRequest({
    required String phone,
    required String purpose, // register | login | reset_password
  }) = _OtpRequest;

  factory OtpRequest.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestFromJson(json);
}

// User roles list
const List<Map<String, String>> kUserRoles = [
  {'slug': 'house_owner',  'en': 'House Owner',          'ur': 'گھر کا مالک',     'icon': '🏠', 'desc': 'Building or renovating your home'},
  {'slug': 'contractor',   'en': 'Contractor',            'ur': 'کنٹریکٹر',       'icon': '🏗️', 'desc': 'Managing projects for clients'},
  {'slug': 'investor',     'en': 'Investor',              'ur': 'سرمایہ کار',     'icon': '💰', 'desc': 'Funding and monitoring projects'},
  {'slug': 'developer',    'en': 'Developer',             'ur': 'ڈویلپر',         'icon': '🏢', 'desc': 'Real estate or commercial developer'},
  {'slug': 'architect',    'en': 'Architect / Consultant','ur': 'آرکیٹیکٹ',       'icon': '📐', 'desc': 'Professional project oversight'},
  {'slug': 'shop_owner',   'en': 'Shop / Market Owner',  'ur': 'دکان / مارکیٹ مالک','icon': '🏪', 'desc': 'Commercial construction for business'},
];
