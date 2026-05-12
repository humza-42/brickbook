import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../auth/data/models/auth_models.dart';

part 'profile_provider.freezed.dart';
part 'profile_provider.g.dart';

@riverpod
Future<UserModel> currentUser(CurrentUserRef ref) async {
  final dio = ref.watch(apiClientProvider);
  final r   = await dio.get(ApiEndpoints.user);
  return UserModel.fromJson(r.data['data']);
}

@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaved,
    String? error,
  }) = _ProfileEditState;
}

@riverpod
class ProfileEditNotifier extends _$ProfileEditNotifier {
  @override
  ProfileEditState build() => const ProfileEditState();

  Future<void> update(Map<String, dynamic> data) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final dio = ref.read(apiClientProvider);
      await dio.put(ApiEndpoints.user, data: data);
      ref.invalidate(currentUserProvider);
      state = state.copyWith(isLoading: false, isSaved: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void reset() => state = const ProfileEditState();
}
