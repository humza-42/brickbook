import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/project_repository.dart';
import '../data/models/project_models.dart';

part 'project_providers.freezed.dart';
part 'project_providers.g.dart';

// Projects List Provider
@riverpod
Future<List<ProjectModel>> projectsList(ProjectsListRef ref) =>
    ref.watch(projectRepositoryProvider).getProjects();

// Single Project Provider
@riverpod
Future<ProjectModel> projectDetail(ProjectDetailRef ref, String id) =>
    ref.watch(projectRepositoryProvider).getProject(id);

// Dashboard Provider
@riverpod
Future<DashboardSummary> dashboardSummary(DashboardSummaryRef ref) =>
    ref.watch(projectRepositoryProvider).getDashboardSummary();

// Create Project State
@freezed
class CreateProjectState with _$CreateProjectState {
  const factory CreateProjectState({
    @Default(false) bool isLoading,
    String? error,
    ProjectModel? created,
  }) = _CreateProjectState;
}

@riverpod
class CreateProjectNotifier extends _$CreateProjectNotifier {
  @override
  CreateProjectState build() => const CreateProjectState();

  Future<void> create(Map<String, dynamic> data) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final project = await ref.read(projectRepositoryProvider).createProject(data);
      ref.invalidate(projectsListProvider);
      ref.invalidate(dashboardSummaryProvider);
      state = state.copyWith(isLoading: false, created: project);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

// Project Filter State
@riverpod
class ProjectFilter extends _$ProjectFilter {
  @override
  String build() => 'all'; // all | active | completed | on_hold

  void set(String filter) => state = filter;
}
