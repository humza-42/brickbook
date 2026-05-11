import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage.g.dart';

@riverpod
SecureStorageService secureStorage(SecureStorageRef ref) {
  return SecureStorageService();
}

class SecureStorageService {
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const _keyToken = 'auth_token';
  static const _keyUserId = 'user_id';
  static const _keyUserName = 'user_name';
  static const _keyUserRole = 'user_role';
  static const _keyOnboarded = 'onboarded';

  Future<void> saveToken(String token) => _storage.write(key: _keyToken, value: token);
  Future<String?> getToken() => _storage.read(key: _keyToken);
  Future<void> deleteToken() => _storage.delete(key: _keyToken);

  Future<void> saveUser({required String id, required String name, required String role}) async {
    await _storage.write(key: _keyUserId, value: id);
    await _storage.write(key: _keyUserName, value: name);
    await _storage.write(key: _keyUserRole, value: role);
  }
  
  Future<String?> getUserId() => _storage.read(key: _keyUserId);
  Future<String?> getUserName() => _storage.read(key: _keyUserName);
  Future<String?> getUserRole() => _storage.read(key: _keyUserRole);

  Future<void> setOnboarded() => _storage.write(key: _keyOnboarded, value: 'true');
  Future<bool> isOnboarded() async => await _storage.read(key: _keyOnboarded) == 'true';

  Future<void> clearAll() => _storage.deleteAll();
}
