import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/vendor_repository.dart';
import '../data/models/vendor_models.dart';

part 'vendor_providers.freezed.dart';
part 'vendor_providers.g.dart';

@riverpod
Future<List<VendorModel>> vendorsList(VendorsListRef ref) =>
    ref.watch(vendorRepositoryProvider).getVendors();

@riverpod
Future<VendorSummary> vendorSummary(VendorSummaryRef ref, String id) =>
    ref.watch(vendorRepositoryProvider).getVendorSummary(id);

@riverpod
class VendorSearch extends _$VendorSearch {
  @override
  String build() => '';
  void set(String q) => state = q;
}

@freezed
class VendorFormState with _$VendorFormState {
  const factory VendorFormState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaved,
    VendorModel? saved,
    String? error,
  }) = _VendorFormState;
}

@riverpod
class VendorFormNotifier extends _$VendorFormNotifier {
  @override
  VendorFormState build() => const VendorFormState();

  Future<void> save(Map<String, dynamic> data, {String? editId}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo   = ref.read(vendorRepositoryProvider);
      final vendor = editId != null
          ? await repo.updateVendor(editId, data)
          : await repo.createVendor(data);
      ref.invalidate(vendorsListProvider);
      state = state.copyWith(isLoading: false, isSaved: true, saved: vendor);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void reset() => state = const VendorFormState();
}
