import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offline_db.g.dart';

class OfflineDrafts extends Table {
  TextColumn get localId => text()();
  TextColumn get projectId => text()();
  TextColumn get payload => text()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {localId};
}

class CachedProjects extends Table {
  TextColumn get projectId => text()();
  TextColumn get payload => text()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {projectId};
}

@DriftDatabase(tables: [OfflineDrafts, CachedProjects])
class OfflineDatabase extends _$OfflineDatabase {
  OfflineDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> cacheProject(String projectId, String json) async {
    await into(cachedProjects).insertOnConflictUpdate(
      CachedProjectsCompanion.insert(
        projectId: projectId,
        payload: json,
        cachedAt: DateTime.now(),
      ),
    );
  }

  Future<String?> getCachedProject(String projectId) async {
    final row = await (select(cachedProjects)
      ..where((t) => t.projectId.equals(projectId))).getSingleOrNull();
    return row?.payload;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'brickbook_offline.db'));
    return NativeDatabase(file);
  });
}

@riverpod
OfflineDatabase offlineDb(OfflineDbRef ref) {
  final db = OfflineDatabase();
  ref.onDispose(db.close);
  return db;
}
