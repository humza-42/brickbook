import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_models.freezed.dart';
part 'project_models.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required String id,
    required String name,
    required String type,
    required double totalBudget,
    @Default(0.0) double totalSpent,
    String? location,
    String? startDate,
    String? endDate,
    @Default('active') String status,
    String? description,
    String? coverPhoto,
    @Default('PKR') String currency,
    @Default([]) List<ProjectPhase> phases,
    @Default(0) int membersCount,
    String? createdAt,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}

extension ProjectModelX on ProjectModel {
  double get remaining => totalBudget - totalSpent;
  double get percentUsed => totalBudget > 0 ? (totalSpent / totalBudget).clamp(0.0, 1.0) : 0.0;
  bool   get isOverBudget => totalSpent > totalBudget;
  bool   get isCompleted  => status == 'completed';
  bool   get isOnHold     => status == 'on_hold';
}

@freezed
class ProjectPhase with _$ProjectPhase {
  const factory ProjectPhase({
    required String id,
    required String projectId,
    required String name,
    @Default(0.0) double budgetAllocated,
    @Default(0.0) double spent,
    String? startDate,
    String? endDate,
    @Default('pending') String status,
    @Default(0) int sortOrder,
  }) = _ProjectPhase;

  factory ProjectPhase.fromJson(Map<String, dynamic> json) =>
      _$ProjectPhaseFromJson(json);
}

@freezed
class ProjectMember with _$ProjectMember {
  const factory ProjectMember({
    required String id,
    required String userId,
    required String name,
    required String permission,
    String? profilePhoto,
    String? email,
    String? phone,
    String? acceptedAt,
  }) = _ProjectMember;

  factory ProjectMember.fromJson(Map<String, dynamic> json) =>
      _$ProjectMemberFromJson(json);
}

@freezed
class DashboardSummary with _$DashboardSummary {
  const factory DashboardSummary({
    @Default(0) int totalProjects,
    @Default(0) int activeProjects,
    @Default(0.0) double totalBudget,
    @Default(0.0) double totalSpent,
    @Default([]) List<ProjectModel> recentProjects,
    @Default([]) List<Map<String, dynamic>> monthlySpend,
  }) = _DashboardSummary;

  factory DashboardSummary.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryFromJson(json);
}

const kProjectTypes = [
  {'slug': 'residential', 'label': 'Residential', 'icon': '🏠'},
  {'slug': 'commercial',  'label': 'Commercial',  'icon': '🏢'},
  {'slug': 'renovation',  'label': 'Renovation',  'icon': '🔨'},
  {'slug': 'industrial',  'label': 'Industrial',  'icon': '🏭'},
  {'slug': 'other',       'label': 'Other',        'icon': '📋'},
];

const kDefaultPhases = [
  'Foundation', 'Structure', 'Roof', 'Finishing',
  'Electrical', 'Plumbing', 'Exterior',
];
