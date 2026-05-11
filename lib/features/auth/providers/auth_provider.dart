import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/auth_repository.dart';
import '../data/models/auth_models.dart';
import '../../../core/storage/secure_storage.dart';

part 'auth_provider.freezed.dart';
part 'auth_provider.g.dart';

// Auth State
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoggedIn,
    @Default(false) bool isLoading,
    UserModel? user,
    String? error,
  }) = _AuthState;
}

// Auth State Notifier
@riverpod
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  AuthState build() {
    _checkAuth();
    return const AuthState();
  }

  Future<void> _checkAuth() async {
    final storage = ref.read(secureStorageProvider);
    final isLoggedIn = await storage.getToken() != null;
    state = state.copyWith(isLoggedIn: isLoggedIn);
  }

  Future<void> login({String? email, String? phone, required String password}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo = ref.read(authRepositoryProvider);
      final auth = await repo.login(LoginRequest(
        email: email,
        phone: phone,
        password: password,
      ));
      state = state.copyWith(isLoading: false, isLoggedIn: true, user: auth.user);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: _parseError(e));
    }
  }

  Future<void> register({
    required String name,
    String? email,
    String? phone,
    required String password,
    required String role,
    required String language,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo = ref.read(authRepositoryProvider);
      final auth = await repo.register(RegisterRequest(
        name: name,
        email: email,
        phone: phone,
        password: password,
        role: role,
        language: language,
      ));
      state = state.copyWith(isLoading: false, isLoggedIn: true, user: auth.user);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: _parseError(e));
    }
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AuthState(isLoggedIn: false);
  }

  void clearError() => state = state.copyWith(error: null);

  String _parseError(dynamic e) {
    if (e is Exception) {
      final msg = e.toString();
      if (msg.contains('401')) return 'Invalid credentials';
      if (msg.contains('422')) return 'Please check your input';
      if (msg.contains('SocketException')) return 'No internet connection';
    }
    return 'Something went wrong. Please try again.';
  }
}

// Convenience provider to watch auth state
@riverpod
AuthState authState(AuthStateRef ref) {
  return ref.watch(authStateNotifierProvider);
}
