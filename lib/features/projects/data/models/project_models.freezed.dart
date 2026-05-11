// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get totalBudget => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get coverPhoto => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  List<ProjectPhase> get phases => throw _privateConstructorUsedError;
  int get membersCount => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      double totalBudget,
      double totalSpent,
      String? location,
      String? startDate,
      String? endDate,
      String status,
      String? description,
      String? coverPhoto,
      String currency,
      List<ProjectPhase> phases,
      int membersCount,
      String? createdAt});
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? totalBudget = null,
    Object? totalSpent = null,
    Object? location = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? status = null,
    Object? description = freezed,
    Object? coverPhoto = freezed,
    Object? currency = null,
    Object? phases = null,
    Object? membersCount = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      coverPhoto: freezed == coverPhoto
          ? _value.coverPhoto
          : coverPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      phases: null == phases
          ? _value.phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<ProjectPhase>,
      membersCount: null == membersCount
          ? _value.membersCount
          : membersCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectModelImplCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$ProjectModelImplCopyWith(
          _$ProjectModelImpl value, $Res Function(_$ProjectModelImpl) then) =
      __$$ProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      double totalBudget,
      double totalSpent,
      String? location,
      String? startDate,
      String? endDate,
      String status,
      String? description,
      String? coverPhoto,
      String currency,
      List<ProjectPhase> phases,
      int membersCount,
      String? createdAt});
}

/// @nodoc
class __$$ProjectModelImplCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$ProjectModelImpl>
    implements _$$ProjectModelImplCopyWith<$Res> {
  __$$ProjectModelImplCopyWithImpl(
      _$ProjectModelImpl _value, $Res Function(_$ProjectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? totalBudget = null,
    Object? totalSpent = null,
    Object? location = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? status = null,
    Object? description = freezed,
    Object? coverPhoto = freezed,
    Object? currency = null,
    Object? phases = null,
    Object? membersCount = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ProjectModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      coverPhoto: freezed == coverPhoto
          ? _value.coverPhoto
          : coverPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      phases: null == phases
          ? _value._phases
          : phases // ignore: cast_nullable_to_non_nullable
              as List<ProjectPhase>,
      membersCount: null == membersCount
          ? _value.membersCount
          : membersCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectModelImpl implements _ProjectModel {
  const _$ProjectModelImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.totalBudget,
      this.totalSpent = 0.0,
      this.location,
      this.startDate,
      this.endDate,
      this.status = 'active',
      this.description,
      this.coverPhoto,
      this.currency = 'PKR',
      final List<ProjectPhase> phases = const [],
      this.membersCount = 0,
      this.createdAt})
      : _phases = phases;

  factory _$ProjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  final double totalBudget;
  @override
  @JsonKey()
  final double totalSpent;
  @override
  final String? location;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  @JsonKey()
  final String status;
  @override
  final String? description;
  @override
  final String? coverPhoto;
  @override
  @JsonKey()
  final String currency;
  final List<ProjectPhase> _phases;
  @override
  @JsonKey()
  List<ProjectPhase> get phases {
    if (_phases is EqualUnmodifiableListView) return _phases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phases);
  }

  @override
  @JsonKey()
  final int membersCount;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'ProjectModel(id: $id, name: $name, type: $type, totalBudget: $totalBudget, totalSpent: $totalSpent, location: $location, startDate: $startDate, endDate: $endDate, status: $status, description: $description, coverPhoto: $coverPhoto, currency: $currency, phases: $phases, membersCount: $membersCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.totalBudget, totalBudget) ||
                other.totalBudget == totalBudget) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverPhoto, coverPhoto) ||
                other.coverPhoto == coverPhoto) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(other._phases, _phases) &&
            (identical(other.membersCount, membersCount) ||
                other.membersCount == membersCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      totalBudget,
      totalSpent,
      location,
      startDate,
      endDate,
      status,
      description,
      coverPhoto,
      currency,
      const DeepCollectionEquality().hash(_phases),
      membersCount,
      createdAt);

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      __$$ProjectModelImplCopyWithImpl<_$ProjectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectModel implements ProjectModel {
  const factory _ProjectModel(
      {required final String id,
      required final String name,
      required final String type,
      required final double totalBudget,
      final double totalSpent,
      final String? location,
      final String? startDate,
      final String? endDate,
      final String status,
      final String? description,
      final String? coverPhoto,
      final String currency,
      final List<ProjectPhase> phases,
      final int membersCount,
      final String? createdAt}) = _$ProjectModelImpl;

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$ProjectModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  double get totalBudget;
  @override
  double get totalSpent;
  @override
  String? get location;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  String get status;
  @override
  String? get description;
  @override
  String? get coverPhoto;
  @override
  String get currency;
  @override
  List<ProjectPhase> get phases;
  @override
  int get membersCount;
  @override
  String? get createdAt;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectPhase _$ProjectPhaseFromJson(Map<String, dynamic> json) {
  return _ProjectPhase.fromJson(json);
}

/// @nodoc
mixin _$ProjectPhase {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get budgetAllocated => throw _privateConstructorUsedError;
  double get spent => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this ProjectPhase to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectPhase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectPhaseCopyWith<ProjectPhase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectPhaseCopyWith<$Res> {
  factory $ProjectPhaseCopyWith(
          ProjectPhase value, $Res Function(ProjectPhase) then) =
      _$ProjectPhaseCopyWithImpl<$Res, ProjectPhase>;
  @useResult
  $Res call(
      {String id,
      String projectId,
      String name,
      double budgetAllocated,
      double spent,
      String? startDate,
      String? endDate,
      String status,
      int sortOrder});
}

/// @nodoc
class _$ProjectPhaseCopyWithImpl<$Res, $Val extends ProjectPhase>
    implements $ProjectPhaseCopyWith<$Res> {
  _$ProjectPhaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectPhase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? name = null,
    Object? budgetAllocated = null,
    Object? spent = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? status = null,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      budgetAllocated: null == budgetAllocated
          ? _value.budgetAllocated
          : budgetAllocated // ignore: cast_nullable_to_non_nullable
              as double,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectPhaseImplCopyWith<$Res>
    implements $ProjectPhaseCopyWith<$Res> {
  factory _$$ProjectPhaseImplCopyWith(
          _$ProjectPhaseImpl value, $Res Function(_$ProjectPhaseImpl) then) =
      __$$ProjectPhaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String projectId,
      String name,
      double budgetAllocated,
      double spent,
      String? startDate,
      String? endDate,
      String status,
      int sortOrder});
}

/// @nodoc
class __$$ProjectPhaseImplCopyWithImpl<$Res>
    extends _$ProjectPhaseCopyWithImpl<$Res, _$ProjectPhaseImpl>
    implements _$$ProjectPhaseImplCopyWith<$Res> {
  __$$ProjectPhaseImplCopyWithImpl(
      _$ProjectPhaseImpl _value, $Res Function(_$ProjectPhaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectPhase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? name = null,
    Object? budgetAllocated = null,
    Object? spent = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? status = null,
    Object? sortOrder = null,
  }) {
    return _then(_$ProjectPhaseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      budgetAllocated: null == budgetAllocated
          ? _value.budgetAllocated
          : budgetAllocated // ignore: cast_nullable_to_non_nullable
              as double,
      spent: null == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectPhaseImpl implements _ProjectPhase {
  const _$ProjectPhaseImpl(
      {required this.id,
      required this.projectId,
      required this.name,
      this.budgetAllocated = 0.0,
      this.spent = 0.0,
      this.startDate,
      this.endDate,
      this.status = 'pending',
      this.sortOrder = 0});

  factory _$ProjectPhaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectPhaseImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String name;
  @override
  @JsonKey()
  final double budgetAllocated;
  @override
  @JsonKey()
  final double spent;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final int sortOrder;

  @override
  String toString() {
    return 'ProjectPhase(id: $id, projectId: $projectId, name: $name, budgetAllocated: $budgetAllocated, spent: $spent, startDate: $startDate, endDate: $endDate, status: $status, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectPhaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.budgetAllocated, budgetAllocated) ||
                other.budgetAllocated == budgetAllocated) &&
            (identical(other.spent, spent) || other.spent == spent) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, projectId, name,
      budgetAllocated, spent, startDate, endDate, status, sortOrder);

  /// Create a copy of ProjectPhase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectPhaseImplCopyWith<_$ProjectPhaseImpl> get copyWith =>
      __$$ProjectPhaseImplCopyWithImpl<_$ProjectPhaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectPhaseImplToJson(
      this,
    );
  }
}

abstract class _ProjectPhase implements ProjectPhase {
  const factory _ProjectPhase(
      {required final String id,
      required final String projectId,
      required final String name,
      final double budgetAllocated,
      final double spent,
      final String? startDate,
      final String? endDate,
      final String status,
      final int sortOrder}) = _$ProjectPhaseImpl;

  factory _ProjectPhase.fromJson(Map<String, dynamic> json) =
      _$ProjectPhaseImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get name;
  @override
  double get budgetAllocated;
  @override
  double get spent;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  String get status;
  @override
  int get sortOrder;

  /// Create a copy of ProjectPhase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectPhaseImplCopyWith<_$ProjectPhaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectMember _$ProjectMemberFromJson(Map<String, dynamic> json) {
  return _ProjectMember.fromJson(json);
}

/// @nodoc
mixin _$ProjectMember {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get permission => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get acceptedAt => throw _privateConstructorUsedError;

  /// Serializes this ProjectMember to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectMemberCopyWith<ProjectMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectMemberCopyWith<$Res> {
  factory $ProjectMemberCopyWith(
          ProjectMember value, $Res Function(ProjectMember) then) =
      _$ProjectMemberCopyWithImpl<$Res, ProjectMember>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String permission,
      String? profilePhoto,
      String? email,
      String? phone,
      String? acceptedAt});
}

/// @nodoc
class _$ProjectMemberCopyWithImpl<$Res, $Val extends ProjectMember>
    implements $ProjectMemberCopyWith<$Res> {
  _$ProjectMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? permission = null,
    Object? profilePhoto = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? acceptedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectMemberImplCopyWith<$Res>
    implements $ProjectMemberCopyWith<$Res> {
  factory _$$ProjectMemberImplCopyWith(
          _$ProjectMemberImpl value, $Res Function(_$ProjectMemberImpl) then) =
      __$$ProjectMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String permission,
      String? profilePhoto,
      String? email,
      String? phone,
      String? acceptedAt});
}

/// @nodoc
class __$$ProjectMemberImplCopyWithImpl<$Res>
    extends _$ProjectMemberCopyWithImpl<$Res, _$ProjectMemberImpl>
    implements _$$ProjectMemberImplCopyWith<$Res> {
  __$$ProjectMemberImplCopyWithImpl(
      _$ProjectMemberImpl _value, $Res Function(_$ProjectMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? permission = null,
    Object? profilePhoto = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? acceptedAt = freezed,
  }) {
    return _then(_$ProjectMemberImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectMemberImpl implements _ProjectMember {
  const _$ProjectMemberImpl(
      {required this.id,
      required this.userId,
      required this.name,
      required this.permission,
      this.profilePhoto,
      this.email,
      this.phone,
      this.acceptedAt});

  factory _$ProjectMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectMemberImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String permission;
  @override
  final String? profilePhoto;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? acceptedAt;

  @override
  String toString() {
    return 'ProjectMember(id: $id, userId: $userId, name: $name, permission: $permission, profilePhoto: $profilePhoto, email: $email, phone: $phone, acceptedAt: $acceptedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.acceptedAt, acceptedAt) ||
                other.acceptedAt == acceptedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, name, permission,
      profilePhoto, email, phone, acceptedAt);

  /// Create a copy of ProjectMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectMemberImplCopyWith<_$ProjectMemberImpl> get copyWith =>
      __$$ProjectMemberImplCopyWithImpl<_$ProjectMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectMemberImplToJson(
      this,
    );
  }
}

abstract class _ProjectMember implements ProjectMember {
  const factory _ProjectMember(
      {required final String id,
      required final String userId,
      required final String name,
      required final String permission,
      final String? profilePhoto,
      final String? email,
      final String? phone,
      final String? acceptedAt}) = _$ProjectMemberImpl;

  factory _ProjectMember.fromJson(Map<String, dynamic> json) =
      _$ProjectMemberImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get name;
  @override
  String get permission;
  @override
  String? get profilePhoto;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get acceptedAt;

  /// Create a copy of ProjectMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectMemberImplCopyWith<_$ProjectMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardSummary _$DashboardSummaryFromJson(Map<String, dynamic> json) {
  return _DashboardSummary.fromJson(json);
}

/// @nodoc
mixin _$DashboardSummary {
  int get totalProjects => throw _privateConstructorUsedError;
  int get activeProjects => throw _privateConstructorUsedError;
  double get totalBudget => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  List<ProjectModel> get recentProjects => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get monthlySpend =>
      throw _privateConstructorUsedError;

  /// Serializes this DashboardSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardSummaryCopyWith<DashboardSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardSummaryCopyWith<$Res> {
  factory $DashboardSummaryCopyWith(
          DashboardSummary value, $Res Function(DashboardSummary) then) =
      _$DashboardSummaryCopyWithImpl<$Res, DashboardSummary>;
  @useResult
  $Res call(
      {int totalProjects,
      int activeProjects,
      double totalBudget,
      double totalSpent,
      List<ProjectModel> recentProjects,
      List<Map<String, dynamic>> monthlySpend});
}

/// @nodoc
class _$DashboardSummaryCopyWithImpl<$Res, $Val extends DashboardSummary>
    implements $DashboardSummaryCopyWith<$Res> {
  _$DashboardSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProjects = null,
    Object? activeProjects = null,
    Object? totalBudget = null,
    Object? totalSpent = null,
    Object? recentProjects = null,
    Object? monthlySpend = null,
  }) {
    return _then(_value.copyWith(
      totalProjects: null == totalProjects
          ? _value.totalProjects
          : totalProjects // ignore: cast_nullable_to_non_nullable
              as int,
      activeProjects: null == activeProjects
          ? _value.activeProjects
          : activeProjects // ignore: cast_nullable_to_non_nullable
              as int,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      recentProjects: null == recentProjects
          ? _value.recentProjects
          : recentProjects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>,
      monthlySpend: null == monthlySpend
          ? _value.monthlySpend
          : monthlySpend // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardSummaryImplCopyWith<$Res>
    implements $DashboardSummaryCopyWith<$Res> {
  factory _$$DashboardSummaryImplCopyWith(_$DashboardSummaryImpl value,
          $Res Function(_$DashboardSummaryImpl) then) =
      __$$DashboardSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalProjects,
      int activeProjects,
      double totalBudget,
      double totalSpent,
      List<ProjectModel> recentProjects,
      List<Map<String, dynamic>> monthlySpend});
}

/// @nodoc
class __$$DashboardSummaryImplCopyWithImpl<$Res>
    extends _$DashboardSummaryCopyWithImpl<$Res, _$DashboardSummaryImpl>
    implements _$$DashboardSummaryImplCopyWith<$Res> {
  __$$DashboardSummaryImplCopyWithImpl(_$DashboardSummaryImpl _value,
      $Res Function(_$DashboardSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProjects = null,
    Object? activeProjects = null,
    Object? totalBudget = null,
    Object? totalSpent = null,
    Object? recentProjects = null,
    Object? monthlySpend = null,
  }) {
    return _then(_$DashboardSummaryImpl(
      totalProjects: null == totalProjects
          ? _value.totalProjects
          : totalProjects // ignore: cast_nullable_to_non_nullable
              as int,
      activeProjects: null == activeProjects
          ? _value.activeProjects
          : activeProjects // ignore: cast_nullable_to_non_nullable
              as int,
      totalBudget: null == totalBudget
          ? _value.totalBudget
          : totalBudget // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      recentProjects: null == recentProjects
          ? _value._recentProjects
          : recentProjects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>,
      monthlySpend: null == monthlySpend
          ? _value._monthlySpend
          : monthlySpend // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardSummaryImpl implements _DashboardSummary {
  const _$DashboardSummaryImpl(
      {this.totalProjects = 0,
      this.activeProjects = 0,
      this.totalBudget = 0.0,
      this.totalSpent = 0.0,
      final List<ProjectModel> recentProjects = const [],
      final List<Map<String, dynamic>> monthlySpend = const []})
      : _recentProjects = recentProjects,
        _monthlySpend = monthlySpend;

  factory _$DashboardSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardSummaryImplFromJson(json);

  @override
  @JsonKey()
  final int totalProjects;
  @override
  @JsonKey()
  final int activeProjects;
  @override
  @JsonKey()
  final double totalBudget;
  @override
  @JsonKey()
  final double totalSpent;
  final List<ProjectModel> _recentProjects;
  @override
  @JsonKey()
  List<ProjectModel> get recentProjects {
    if (_recentProjects is EqualUnmodifiableListView) return _recentProjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentProjects);
  }

  final List<Map<String, dynamic>> _monthlySpend;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get monthlySpend {
    if (_monthlySpend is EqualUnmodifiableListView) return _monthlySpend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlySpend);
  }

  @override
  String toString() {
    return 'DashboardSummary(totalProjects: $totalProjects, activeProjects: $activeProjects, totalBudget: $totalBudget, totalSpent: $totalSpent, recentProjects: $recentProjects, monthlySpend: $monthlySpend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardSummaryImpl &&
            (identical(other.totalProjects, totalProjects) ||
                other.totalProjects == totalProjects) &&
            (identical(other.activeProjects, activeProjects) ||
                other.activeProjects == activeProjects) &&
            (identical(other.totalBudget, totalBudget) ||
                other.totalBudget == totalBudget) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            const DeepCollectionEquality()
                .equals(other._recentProjects, _recentProjects) &&
            const DeepCollectionEquality()
                .equals(other._monthlySpend, _monthlySpend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalProjects,
      activeProjects,
      totalBudget,
      totalSpent,
      const DeepCollectionEquality().hash(_recentProjects),
      const DeepCollectionEquality().hash(_monthlySpend));

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardSummaryImplCopyWith<_$DashboardSummaryImpl> get copyWith =>
      __$$DashboardSummaryImplCopyWithImpl<_$DashboardSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardSummaryImplToJson(
      this,
    );
  }
}

abstract class _DashboardSummary implements DashboardSummary {
  const factory _DashboardSummary(
      {final int totalProjects,
      final int activeProjects,
      final double totalBudget,
      final double totalSpent,
      final List<ProjectModel> recentProjects,
      final List<Map<String, dynamic>> monthlySpend}) = _$DashboardSummaryImpl;

  factory _DashboardSummary.fromJson(Map<String, dynamic> json) =
      _$DashboardSummaryImpl.fromJson;

  @override
  int get totalProjects;
  @override
  int get activeProjects;
  @override
  double get totalBudget;
  @override
  double get totalSpent;
  @override
  List<ProjectModel> get recentProjects;
  @override
  List<Map<String, dynamic>> get monthlySpend;

  /// Create a copy of DashboardSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardSummaryImplCopyWith<_$DashboardSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
