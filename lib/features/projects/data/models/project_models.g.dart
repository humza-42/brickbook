// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      totalBudget: (json['totalBudget'] as num).toDouble(),
      totalSpent: (json['totalSpent'] as num?)?.toDouble() ?? 0.0,
      location: json['location'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      status: json['status'] as String? ?? 'active',
      description: json['description'] as String?,
      coverPhoto: json['coverPhoto'] as String?,
      currency: json['currency'] as String? ?? 'PKR',
      phases: (json['phases'] as List<dynamic>?)
              ?.map((e) => ProjectPhase.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      membersCount: (json['membersCount'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'totalBudget': instance.totalBudget,
      'totalSpent': instance.totalSpent,
      'location': instance.location,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'status': instance.status,
      'description': instance.description,
      'coverPhoto': instance.coverPhoto,
      'currency': instance.currency,
      'phases': instance.phases,
      'membersCount': instance.membersCount,
      'createdAt': instance.createdAt,
    };

_$ProjectPhaseImpl _$$ProjectPhaseImplFromJson(Map<String, dynamic> json) =>
    _$ProjectPhaseImpl(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      name: json['name'] as String,
      budgetAllocated: (json['budgetAllocated'] as num?)?.toDouble() ?? 0.0,
      spent: (json['spent'] as num?)?.toDouble() ?? 0.0,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      status: json['status'] as String? ?? 'pending',
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ProjectPhaseImplToJson(_$ProjectPhaseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'name': instance.name,
      'budgetAllocated': instance.budgetAllocated,
      'spent': instance.spent,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'status': instance.status,
      'sortOrder': instance.sortOrder,
    };

_$ProjectMemberImpl _$$ProjectMemberImplFromJson(Map<String, dynamic> json) =>
    _$ProjectMemberImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      permission: json['permission'] as String,
      profilePhoto: json['profilePhoto'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      acceptedAt: json['acceptedAt'] as String?,
    );

Map<String, dynamic> _$$ProjectMemberImplToJson(_$ProjectMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'permission': instance.permission,
      'profilePhoto': instance.profilePhoto,
      'email': instance.email,
      'phone': instance.phone,
      'acceptedAt': instance.acceptedAt,
    };

_$DashboardSummaryImpl _$$DashboardSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardSummaryImpl(
      totalProjects: (json['totalProjects'] as num?)?.toInt() ?? 0,
      activeProjects: (json['activeProjects'] as num?)?.toInt() ?? 0,
      totalBudget: (json['totalBudget'] as num?)?.toDouble() ?? 0.0,
      totalSpent: (json['totalSpent'] as num?)?.toDouble() ?? 0.0,
      recentProjects: (json['recentProjects'] as List<dynamic>?)
              ?.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      monthlySpend: (json['monthlySpend'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DashboardSummaryImplToJson(
        _$DashboardSummaryImpl instance) =>
    <String, dynamic>{
      'totalProjects': instance.totalProjects,
      'activeProjects': instance.activeProjects,
      'totalBudget': instance.totalBudget,
      'totalSpent': instance.totalSpent,
      'recentProjects': instance.recentProjects,
      'monthlySpend': instance.monthlySpend,
    };
