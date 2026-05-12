import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/analytics_repository.dart';
import '../data/models/analytics_models.dart';

part 'analytics_providers.g.dart';

@riverpod
Future<ProjectAnalytics> projectAnalytics(
  ProjectAnalyticsRef ref,
  String projectId,
) => ref.watch(analyticsRepositoryProvider).getProjectAnalytics(projectId);

@riverpod
Future<List<VendorSpend>> vendorSpend(
  VendorSpendRef ref,
  String projectId,
) => ref.watch(analyticsRepositoryProvider).getVendorSpend(projectId);

// Tab selection state
@riverpod
class AnalyticsTab extends _$AnalyticsTab {
  @override
  int build() => 0;
  void set(int i) => state = i;
}
