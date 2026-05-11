import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/storage/secure_storage.dart';
import '../data/models/auth_models.dart';
import '../../../core/utils/extensions.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(
    dio: ref.watch(apiClientProvider),
    storage: ref.watch(secureStorageProvider),
  );
}

class AuthRepository {
  final Dio _dio;
  final SecureStorageService _storage;

  // Toggle mock mode for development/testing
  static const bool _useMock = true;

  AuthRepository({required Dio dio, required SecureStorageService storage})
      : _dio = dio, _storage = storage;

  Future<AuthResponse> login(LoginRequest request) async {
    if (_useMock) {
      await Future.delayed(const Duration(milliseconds: 800)); // Simulate network
      
      // Validate basic format
      if (request.email != null && !request.email!.contains('@')) {
        throw Exception('Invalid email format');
      }
      if (request.phone != null && request.phone!.length < 10) {
        throw Exception('Invalid phone number');
      }
      if (request.password == null || request.password!.length < 6) {
        throw Exception('Password too short');
      }

      return AuthResponse(
        token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
        user: UserModel(
          id: 'user_${DateTime.now().millisecondsSinceEpoch}',
          name: request.email != null 
              ? request.email!.split('@')[0].capitalize
              : 'User ${request.phone!.substring(request.phone!.length - 4)}',
          role: 'contractor', // Default role
          email: request.email,
          phone: request.phone,
          language: 'en',
        ),
      );
    }

    final response = await _dio.post(
      ApiEndpoints.login,
      data: request.toJson(),
    );
    final auth = AuthResponse.fromJson(response.data['data']);
    await _storage.saveToken(auth.token);
    await _storage.saveUser(
      id: auth.user.id,
      name: auth.user.name,
      role: auth.user.role,
    );
    return auth;
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    if (_useMock) {
      await Future.delayed(const Duration(milliseconds: 800));
      
      if (request.name.trim().isEmpty) {
        throw Exception('Name is required');
      }
      if (request.email != null && !request.email!.contains('@')) {
        throw Exception('Invalid email format');
      }
      if (request.phone != null && request.phone!.length < 10) {
        throw Exception('Invalid phone number');
      }
      if (request.password.length < 8) {
        throw Exception('Password must be at least 8 characters');
      }

      return AuthResponse(
        token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
        user: UserModel(
          id: 'user_${DateTime.now().millisecondsSinceEpoch}',
          name: request.name,
          role: request.role,
          email: request.email,
          phone: request.phone,
          language: request.language,
        ),
      );
    }

    final response = await _dio.post(
      ApiEndpoints.register,
      data: request.toJson(),
    );
    final auth = AuthResponse.fromJson(response.data['data']);
    await _storage.saveToken(auth.token);
    await _storage.saveUser(
      id: auth.user.id,
      name: auth.user.name,
      role: auth.user.role,
    );
    return auth;
  }

  Future<void> sendOtp(String phone, String purpose) async {
    if (_useMock) {
      await Future.delayed(const Duration(milliseconds: 500));
      // In mock mode, we accept any phone number
      return;
    }
    await _dio.post(ApiEndpoints.otpSend, data: {
      'phone': phone,
      'purpose': purpose,
    });
  }

  Future<AuthResponse> verifyOtp(String phone, String code) async {
    if (_useMock) {
      await Future.delayed(const Duration(milliseconds: 800));
      
      if (code.length != 6) {
        throw Exception('Invalid OTP code');
      }
      
      // Mock: any 6-digit code works
      return AuthResponse(
        token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
        user: UserModel(
          id: 'user_${DateTime.now().millisecondsSinceEpoch}',
          name: 'Verified User',
          role: 'house_owner',
          phone: phone,
          language: 'en',
        ),
      );
    }

    final response = await _dio.post(ApiEndpoints.otpVerify, data: {
      'phone': phone,
      'otp_code': code,
    });
    final auth = AuthResponse.fromJson(response.data['data']);
    await _storage.saveToken(auth.token);
    await _storage.saveUser(
      id: auth.user.id,
      name: auth.user.name,
      role: auth.user.role,
    );
    return auth;
  }

  Future<void> logout() async {
    if (!_useMock) {
      try {
        await _dio.post(ApiEndpoints.logout);
      } catch (_) {}
    }
    await _storage.clearAll();
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.getToken();
    return token != null;
  }
}
