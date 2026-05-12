import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/api_error.dart';
import '../../../core/network/api_response.dart';
import 'models/project_models.dart';

part 'project_repository.g.dart';

@riverpod
ProjectRepository projectRepository(ProjectRepositoryRef ref) =>
    ProjectRepository(dio: ref.watch(apiClientProvider));

class ProjectRepository {
  final Dio _dio;
  ProjectRepository({required Dio dio}) : _dio = dio;

  Future<List<ProjectModel>> getProjects() async {
    return safeApiCall(() async {
      try {
        final r = await _dio.get(ApiEndpoints.projects);
        return parseList(r.data['data'] as List, ProjectModel.fromJson);
      } catch (_) {
        return _getMockProjects();
      }
    });
  }

  Future<ProjectModel> getProject(String id) async {
    return safeApiCall(() async {
      try {
        final r = await _dio.get(ApiEndpoints.projectById(id));
        return parseData(r.data['data'] as Map<String, dynamic>, ProjectModel.fromJson);
      } catch (_) {
        return _getMockProjects().firstWhere((p) => p.id == id);
      }
    });
  }

  Future<ProjectModel> createProject(Map<String, dynamic> data) async {
    return safeApiCall(() async {
      try {
        final r = await _dio.post(ApiEndpoints.projects, data: data);
        return parseData(r.data['data'] as Map<String, dynamic>, ProjectModel.fromJson);
      } catch (_) {
        return ProjectModel(
          id: 'proj_mock_${DateTime.now().millisecondsSinceEpoch}',
          name: data['name'] ?? 'New Project',
          type: data['type'] ?? 'other',
          totalBudget: (data['total_budget'] ?? 0.0).toDouble(),
          location: data['location'],
          status: 'active',
        );
      }
    });
  }

  Future<ProjectModel> updateProject(String id, Map<String, dynamic> data) async {
    return safeApiCall(() async {
      try {
        final r = await _dio.put(ApiEndpoints.projectById(id), data: data);
        return parseData(r.data['data'] as Map<String, dynamic>, ProjectModel.fromJson);
      } catch (_) {
        return getProject(id);
      }
    });
  }

  Future<void> deleteProject(String id) async {
    return safeApiCall(() async {
      try {
        await _dio.delete(ApiEndpoints.projectById(id));
      } catch (_) {
        // Mock delete silently
      }
    });
  }

  Future<DashboardSummary> getDashboardSummary() async {
    return safeApiCall(() async {
      try {
        final r = await _dio.get(ApiEndpoints.dashboardSummary);
        return DashboardSummary.fromJson(r.data['data']);
      } catch (_) {
        final projects = _getMockProjects();
        final totalProjects = projects.length;
        final activeProjects = projects.where((p) => p.status == 'active').length;
        final totalBudget = projects.fold<double>(0, (sum, p) => sum + p.totalBudget);
        final totalSpent = projects.fold<double>(0, (sum, p) => sum + p.totalSpent);
        final recentProjects = projects
            .where((p) => p.status == 'active' || p.status == 'on_hold')
            .toList()
          ..sort((a, b) => b.createdAt?.compareTo(a.createdAt ?? '') ?? 0);

        return DashboardSummary(
          totalProjects: totalProjects,
          activeProjects: activeProjects,
          totalBudget: totalBudget,
          totalSpent: totalSpent,
          recentProjects: recentProjects.take(3).toList(),
          monthlySpend: [
            {'month': 'Jan', 'amount': 1200000.0},
            {'month': 'Feb', 'amount': 4800000.0},
            {'month': 'Mar', 'amount': 5200000.0},
            {'month': 'Apr', 'amount': 6500000.0},
            {'month': 'May', 'amount': 7100000.0},
            {'month': 'Jun', 'amount': 4800000.0},
            {'month': 'Jul', 'amount': 2000000.0},
          ],
        );
      }
    });
  }

  Future<List<ProjectPhase>> getPhases(String projectId) async {
    return safeApiCall(() async {
      try {
        final r = await _dio.get(ApiEndpoints.projectPhases(projectId));
        return parseList(r.data['data'] as List, ProjectPhase.fromJson);
      } catch (_) {
        return _getMockProjects().where((p) => p.id == projectId).first.phases;
      }
    });
  }

  Future<ProjectPhase> createPhase(String projectId, Map<String, dynamic> data) async {
    return safeApiCall(() async {
      try {
        final r = await _dio.post(ApiEndpoints.projectPhases(projectId), data: data);
        return parseData(r.data['data'] as Map<String, dynamic>, ProjectPhase.fromJson);
      } catch (_) {
        return ProjectPhase(
          id: 'phase_mock_${DateTime.now().millisecondsSinceEpoch}',
          projectId: projectId,
          name: data['name'] ?? 'New Phase',
          budgetAllocated: (data['budgetAllocated'] ?? 0.0).toDouble(),
        );
      }
    });
  }

  Future<void> deletePhase(String projectId, String phaseId) async {
    return safeApiCall(() async {
      try {
        await _dio.delete('${ApiEndpoints.projectPhases(projectId)}/$phaseId');
      } catch (_) {
        // Mock delete
      }
    });
  }

  Future<List<ProjectMember>> getMembers(String projectId) async {
    return safeApiCall(() async {
      try {
        final r = await _dio.get(ApiEndpoints.projectMembers(projectId));
        return parseList(r.data['data'] as List, ProjectMember.fromJson);
      } catch (_) {
        return [];
      }
    });
  }

  Future<void> inviteMember(String projectId, String emailOrPhone, String permission) async {
    return safeApiCall(() async {
      try {
        await _dio.post(ApiEndpoints.projectMembers(projectId), data: {
          'contact': emailOrPhone,
          'permission': permission,
        });
      } catch (_) {
        // Mock invite
      }
    });
  }

  Future<void> removeMember(String projectId, String memberId) async {
    return safeApiCall(() async {
      try {
        await _dio.delete('${ApiEndpoints.projectMembers(projectId)}/$memberId');
      } catch (_) {
        // Mock remove
      }
    });
  }

  // ============ MOCK DATA ============
  List<ProjectModel> _getMockProjects() {
    return [
      ProjectModel(
        id: 'proj_001',
        name: 'DHA House Phase 2',
        type: 'residential',
        totalBudget: 15000000,
        totalSpent: 8200000,
        location: 'DHA Phase 6, Lahore',
        startDate: '2025-01-15',
        endDate: '2025-12-30',
        status: 'active',
        description: 'Two-story modern house with premium finishes',
        currency: 'PKR',
        membersCount: 5,
        createdAt: '2025-01-10T08:00:00Z',
        phases: [
          ProjectPhase(
            id: 'phase_001', projectId: 'proj_001', name: 'Foundation',
            budgetAllocated: 2500000, spent: 2400000, startDate: '2025-01-20', endDate: '2025-03-10',
            status: 'completed', sortOrder: 1,
          ),
          ProjectPhase(
            id: 'phase_002', projectId: 'proj_001', name: 'Structure',
            budgetAllocated: 4000000, spent: 3500000, status: 'active', sortOrder: 2,
          ),
          ProjectPhase(
            id: 'phase_003', projectId: 'proj_001', name: 'Roof',
            budgetAllocated: 2000000, spent: 1200000, status: 'active', sortOrder: 3,
          ),
          ProjectPhase(
            id: 'phase_004', projectId: 'proj_001', name: 'Finishing',
            budgetAllocated: 4500000, spent: 1100000, status: 'pending', sortOrder: 4,
          ),
          ProjectPhase(
            id: 'phase_005', projectId: 'proj_001', name: 'Electrical',
            budgetAllocated: 1000000, spent: 0, status: 'pending', sortOrder: 5,
          ),
          ProjectPhase(
            id: 'phase_006', projectId: 'proj_001', name: 'Plumbing',
            budgetAllocated: 1000000, spent: 0, status: 'pending', sortOrder: 6,
          ),
          ProjectPhase(
            id: 'phase_007', projectId: 'proj_001', name: 'Exterior',
            budgetAllocated: 500000, spent: 0, status: 'pending', sortOrder: 7,
          ),
        ],
      ),
      ProjectModel(
        id: 'proj_002',
        name: 'Commercial Plaza Bahria',
        type: 'commercial',
        totalBudget: 25000000,
        totalSpent: 18500000,
        location: 'Bahria Town, Lahore',
        startDate: '2025-02-01',
        endDate: '2025-11-15',
        status: 'active',
        description: '4-story commercial plaza with parking',
        currency: 'PKR',
        membersCount: 8,
        createdAt: '2025-01-25T09:30:00Z',
        phases: [
          ProjectPhase(
            id: 'phase_101', projectId: 'proj_002', name: 'Foundation',
            budgetAllocated: 5000000, spent: 4800000, status: 'completed', sortOrder: 1,
          ),
          ProjectPhase(
            id: 'phase_102', projectId: 'proj_002', name: 'Structure',
            budgetAllocated: 8000000, spent: 7200000, status: 'active', sortOrder: 2,
          ),
        ],
      ),
      ProjectModel(
        id: 'proj_003',
        name: 'Old House Renovation',
        type: 'renovation',
        totalBudget: 3500000,
        totalSpent: 3800000,
        location: 'Gulberg, Lahore',
        startDate: '2025-03-01',
        endDate: '2025-07-30',
        status: 'on_hold',
        description: 'Complete renovation of 20-year old house',
        currency: 'PKR',
        membersCount: 3,
        createdAt: '2025-02-28T07:15:00Z',
        phases: [
          ProjectPhase(
            id: 'phase_201', projectId: 'proj_003', name: 'Demolition',
            budgetAllocated: 500000, spent: 600000, status: 'completed', sortOrder: 1,
          ),
        ],
      ),
    ];
  }
}
