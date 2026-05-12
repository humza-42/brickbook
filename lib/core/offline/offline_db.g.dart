// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_db.dart';

// ignore_for_file: type=lint
class $OfflineDraftsTable extends OfflineDrafts
    with TableInfo<$OfflineDraftsTable, OfflineDraft> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfflineDraftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<String> localId = GeneratedColumn<String>(
      'local_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _attemptsMeta =
      const VerificationMeta('attempts');
  @override
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
      'attempts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [localId, projectId, payload, isSynced, attempts, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offline_drafts';
  @override
  VerificationContext validateIntegrity(Insertable<OfflineDraft> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('attempts')) {
      context.handle(_attemptsMeta,
          attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  OfflineDraft map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfflineDraft(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_id'])!,
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      attempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attempts'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $OfflineDraftsTable createAlias(String alias) {
    return $OfflineDraftsTable(attachedDatabase, alias);
  }
}

class OfflineDraft extends DataClass implements Insertable<OfflineDraft> {
  final String localId;
  final String projectId;
  final String payload;
  final bool isSynced;
  final int attempts;
  final DateTime? createdAt;
  const OfflineDraft(
      {required this.localId,
      required this.projectId,
      required this.payload,
      required this.isSynced,
      required this.attempts,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<String>(localId);
    map['project_id'] = Variable<String>(projectId);
    map['payload'] = Variable<String>(payload);
    map['is_synced'] = Variable<bool>(isSynced);
    map['attempts'] = Variable<int>(attempts);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  OfflineDraftsCompanion toCompanion(bool nullToAbsent) {
    return OfflineDraftsCompanion(
      localId: Value(localId),
      projectId: Value(projectId),
      payload: Value(payload),
      isSynced: Value(isSynced),
      attempts: Value(attempts),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory OfflineDraft.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfflineDraft(
      localId: serializer.fromJson<String>(json['localId']),
      projectId: serializer.fromJson<String>(json['projectId']),
      payload: serializer.fromJson<String>(json['payload']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      attempts: serializer.fromJson<int>(json['attempts']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<String>(localId),
      'projectId': serializer.toJson<String>(projectId),
      'payload': serializer.toJson<String>(payload),
      'isSynced': serializer.toJson<bool>(isSynced),
      'attempts': serializer.toJson<int>(attempts),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  OfflineDraft copyWith(
          {String? localId,
          String? projectId,
          String? payload,
          bool? isSynced,
          int? attempts,
          Value<DateTime?> createdAt = const Value.absent()}) =>
      OfflineDraft(
        localId: localId ?? this.localId,
        projectId: projectId ?? this.projectId,
        payload: payload ?? this.payload,
        isSynced: isSynced ?? this.isSynced,
        attempts: attempts ?? this.attempts,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  OfflineDraft copyWithCompanion(OfflineDraftsCompanion data) {
    return OfflineDraft(
      localId: data.localId.present ? data.localId.value : this.localId,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      payload: data.payload.present ? data.payload.value : this.payload,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfflineDraft(')
          ..write('localId: $localId, ')
          ..write('projectId: $projectId, ')
          ..write('payload: $payload, ')
          ..write('isSynced: $isSynced, ')
          ..write('attempts: $attempts, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(localId, projectId, payload, isSynced, attempts, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflineDraft &&
          other.localId == this.localId &&
          other.projectId == this.projectId &&
          other.payload == this.payload &&
          other.isSynced == this.isSynced &&
          other.attempts == this.attempts &&
          other.createdAt == this.createdAt);
}

class OfflineDraftsCompanion extends UpdateCompanion<OfflineDraft> {
  final Value<String> localId;
  final Value<String> projectId;
  final Value<String> payload;
  final Value<bool> isSynced;
  final Value<int> attempts;
  final Value<DateTime?> createdAt;
  final Value<int> rowid;
  const OfflineDraftsCompanion({
    this.localId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.payload = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.attempts = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OfflineDraftsCompanion.insert({
    required String localId,
    required String projectId,
    required String payload,
    this.isSynced = const Value.absent(),
    this.attempts = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : localId = Value(localId),
        projectId = Value(projectId),
        payload = Value(payload);
  static Insertable<OfflineDraft> custom({
    Expression<String>? localId,
    Expression<String>? projectId,
    Expression<String>? payload,
    Expression<bool>? isSynced,
    Expression<int>? attempts,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (projectId != null) 'project_id': projectId,
      if (payload != null) 'payload': payload,
      if (isSynced != null) 'is_synced': isSynced,
      if (attempts != null) 'attempts': attempts,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OfflineDraftsCompanion copyWith(
      {Value<String>? localId,
      Value<String>? projectId,
      Value<String>? payload,
      Value<bool>? isSynced,
      Value<int>? attempts,
      Value<DateTime?>? createdAt,
      Value<int>? rowid}) {
    return OfflineDraftsCompanion(
      localId: localId ?? this.localId,
      projectId: projectId ?? this.projectId,
      payload: payload ?? this.payload,
      isSynced: isSynced ?? this.isSynced,
      attempts: attempts ?? this.attempts,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<String>(localId.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfflineDraftsCompanion(')
          ..write('localId: $localId, ')
          ..write('projectId: $projectId, ')
          ..write('payload: $payload, ')
          ..write('isSynced: $isSynced, ')
          ..write('attempts: $attempts, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedProjectsTable extends CachedProjects
    with TableInfo<$CachedProjectsTable, CachedProject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [projectId, payload, cachedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_projects';
  @override
  VerificationContext validateIntegrity(Insertable<CachedProject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    } else if (isInserting) {
      context.missing(_projectIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {projectId};
  @override
  CachedProject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedProject(
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $CachedProjectsTable createAlias(String alias) {
    return $CachedProjectsTable(attachedDatabase, alias);
  }
}

class CachedProject extends DataClass implements Insertable<CachedProject> {
  final String projectId;
  final String payload;
  final DateTime cachedAt;
  const CachedProject(
      {required this.projectId, required this.payload, required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['project_id'] = Variable<String>(projectId);
    map['payload'] = Variable<String>(payload);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedProjectsCompanion toCompanion(bool nullToAbsent) {
    return CachedProjectsCompanion(
      projectId: Value(projectId),
      payload: Value(payload),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedProject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedProject(
      projectId: serializer.fromJson<String>(json['projectId']),
      payload: serializer.fromJson<String>(json['payload']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'projectId': serializer.toJson<String>(projectId),
      'payload': serializer.toJson<String>(payload),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedProject copyWith(
          {String? projectId, String? payload, DateTime? cachedAt}) =>
      CachedProject(
        projectId: projectId ?? this.projectId,
        payload: payload ?? this.payload,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  CachedProject copyWithCompanion(CachedProjectsCompanion data) {
    return CachedProject(
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      payload: data.payload.present ? data.payload.value : this.payload,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedProject(')
          ..write('projectId: $projectId, ')
          ..write('payload: $payload, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(projectId, payload, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedProject &&
          other.projectId == this.projectId &&
          other.payload == this.payload &&
          other.cachedAt == this.cachedAt);
}

class CachedProjectsCompanion extends UpdateCompanion<CachedProject> {
  final Value<String> projectId;
  final Value<String> payload;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedProjectsCompanion({
    this.projectId = const Value.absent(),
    this.payload = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedProjectsCompanion.insert({
    required String projectId,
    required String payload,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  })  : projectId = Value(projectId),
        payload = Value(payload),
        cachedAt = Value(cachedAt);
  static Insertable<CachedProject> custom({
    Expression<String>? projectId,
    Expression<String>? payload,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (projectId != null) 'project_id': projectId,
      if (payload != null) 'payload': payload,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedProjectsCompanion copyWith(
      {Value<String>? projectId,
      Value<String>? payload,
      Value<DateTime>? cachedAt,
      Value<int>? rowid}) {
    return CachedProjectsCompanion(
      projectId: projectId ?? this.projectId,
      payload: payload ?? this.payload,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedProjectsCompanion(')
          ..write('projectId: $projectId, ')
          ..write('payload: $payload, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$OfflineDatabase extends GeneratedDatabase {
  _$OfflineDatabase(QueryExecutor e) : super(e);
  $OfflineDatabaseManager get managers => $OfflineDatabaseManager(this);
  late final $OfflineDraftsTable offlineDrafts = $OfflineDraftsTable(this);
  late final $CachedProjectsTable cachedProjects = $CachedProjectsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [offlineDrafts, cachedProjects];
}

typedef $$OfflineDraftsTableCreateCompanionBuilder = OfflineDraftsCompanion
    Function({
  required String localId,
  required String projectId,
  required String payload,
  Value<bool> isSynced,
  Value<int> attempts,
  Value<DateTime?> createdAt,
  Value<int> rowid,
});
typedef $$OfflineDraftsTableUpdateCompanionBuilder = OfflineDraftsCompanion
    Function({
  Value<String> localId,
  Value<String> projectId,
  Value<String> payload,
  Value<bool> isSynced,
  Value<int> attempts,
  Value<DateTime?> createdAt,
  Value<int> rowid,
});

class $$OfflineDraftsTableFilterComposer
    extends Composer<_$OfflineDatabase, $OfflineDraftsTable> {
  $$OfflineDraftsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$OfflineDraftsTableOrderingComposer
    extends Composer<_$OfflineDatabase, $OfflineDraftsTable> {
  $$OfflineDraftsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attempts => $composableBuilder(
      column: $table.attempts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$OfflineDraftsTableAnnotationComposer
    extends Composer<_$OfflineDatabase, $OfflineDraftsTable> {
  $$OfflineDraftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$OfflineDraftsTableTableManager extends RootTableManager<
    _$OfflineDatabase,
    $OfflineDraftsTable,
    OfflineDraft,
    $$OfflineDraftsTableFilterComposer,
    $$OfflineDraftsTableOrderingComposer,
    $$OfflineDraftsTableAnnotationComposer,
    $$OfflineDraftsTableCreateCompanionBuilder,
    $$OfflineDraftsTableUpdateCompanionBuilder,
    (
      OfflineDraft,
      BaseReferences<_$OfflineDatabase, $OfflineDraftsTable, OfflineDraft>
    ),
    OfflineDraft,
    PrefetchHooks Function()> {
  $$OfflineDraftsTableTableManager(
      _$OfflineDatabase db, $OfflineDraftsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfflineDraftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfflineDraftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfflineDraftsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> localId = const Value.absent(),
            Value<String> projectId = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OfflineDraftsCompanion(
            localId: localId,
            projectId: projectId,
            payload: payload,
            isSynced: isSynced,
            attempts: attempts,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String localId,
            required String projectId,
            required String payload,
            Value<bool> isSynced = const Value.absent(),
            Value<int> attempts = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OfflineDraftsCompanion.insert(
            localId: localId,
            projectId: projectId,
            payload: payload,
            isSynced: isSynced,
            attempts: attempts,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OfflineDraftsTableProcessedTableManager = ProcessedTableManager<
    _$OfflineDatabase,
    $OfflineDraftsTable,
    OfflineDraft,
    $$OfflineDraftsTableFilterComposer,
    $$OfflineDraftsTableOrderingComposer,
    $$OfflineDraftsTableAnnotationComposer,
    $$OfflineDraftsTableCreateCompanionBuilder,
    $$OfflineDraftsTableUpdateCompanionBuilder,
    (
      OfflineDraft,
      BaseReferences<_$OfflineDatabase, $OfflineDraftsTable, OfflineDraft>
    ),
    OfflineDraft,
    PrefetchHooks Function()>;
typedef $$CachedProjectsTableCreateCompanionBuilder = CachedProjectsCompanion
    Function({
  required String projectId,
  required String payload,
  required DateTime cachedAt,
  Value<int> rowid,
});
typedef $$CachedProjectsTableUpdateCompanionBuilder = CachedProjectsCompanion
    Function({
  Value<String> projectId,
  Value<String> payload,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});

class $$CachedProjectsTableFilterComposer
    extends Composer<_$OfflineDatabase, $CachedProjectsTable> {
  $$CachedProjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedProjectsTableOrderingComposer
    extends Composer<_$OfflineDatabase, $CachedProjectsTable> {
  $$CachedProjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedProjectsTableAnnotationComposer
    extends Composer<_$OfflineDatabase, $CachedProjectsTable> {
  $$CachedProjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedProjectsTableTableManager extends RootTableManager<
    _$OfflineDatabase,
    $CachedProjectsTable,
    CachedProject,
    $$CachedProjectsTableFilterComposer,
    $$CachedProjectsTableOrderingComposer,
    $$CachedProjectsTableAnnotationComposer,
    $$CachedProjectsTableCreateCompanionBuilder,
    $$CachedProjectsTableUpdateCompanionBuilder,
    (
      CachedProject,
      BaseReferences<_$OfflineDatabase, $CachedProjectsTable, CachedProject>
    ),
    CachedProject,
    PrefetchHooks Function()> {
  $$CachedProjectsTableTableManager(
      _$OfflineDatabase db, $CachedProjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedProjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedProjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> projectId = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedProjectsCompanion(
            projectId: projectId,
            payload: payload,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String projectId,
            required String payload,
            required DateTime cachedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedProjectsCompanion.insert(
            projectId: projectId,
            payload: payload,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedProjectsTableProcessedTableManager = ProcessedTableManager<
    _$OfflineDatabase,
    $CachedProjectsTable,
    CachedProject,
    $$CachedProjectsTableFilterComposer,
    $$CachedProjectsTableOrderingComposer,
    $$CachedProjectsTableAnnotationComposer,
    $$CachedProjectsTableCreateCompanionBuilder,
    $$CachedProjectsTableUpdateCompanionBuilder,
    (
      CachedProject,
      BaseReferences<_$OfflineDatabase, $CachedProjectsTable, CachedProject>
    ),
    CachedProject,
    PrefetchHooks Function()>;

class $OfflineDatabaseManager {
  final _$OfflineDatabase _db;
  $OfflineDatabaseManager(this._db);
  $$OfflineDraftsTableTableManager get offlineDrafts =>
      $$OfflineDraftsTableTableManager(_db, _db.offlineDrafts);
  $$CachedProjectsTableTableManager get cachedProjects =>
      $$CachedProjectsTableTableManager(_db, _db.cachedProjects);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$offlineDbHash() => r'f8a338ec32ab69e16355ec87f7545509cc013468';

/// See also [offlineDb].
@ProviderFor(offlineDb)
final offlineDbProvider = AutoDisposeProvider<OfflineDatabase>.internal(
  offlineDb,
  name: r'offlineDbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$offlineDbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OfflineDbRef = AutoDisposeProviderRef<OfflineDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
