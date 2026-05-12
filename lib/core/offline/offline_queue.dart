import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../network/connectivity_service.dart';
import '../../features/expenses/data/expense_repository.dart';
import '../../features/expenses/data/models/expense_models.dart';
import 'offline_db.dart';
import 'draft_expense.dart';

part 'offline_queue.g.dart';

@riverpod
class OfflineExpenseQueue extends _$OfflineExpenseQueue {
  @override
  List<DraftExpense> build() {
    _watchConnectivity();
    return [];
  }

  void _watchConnectivity() {
    ref.listen(connectivityNotifierProvider, (prev, next) {
      if (next && !(prev ?? false)) {
        syncAll();
      }
    });
  }

  Future<String> saveDraft(DraftExpense draft) async {
    final db = ref.read(offlineDbProvider);
    await db.into(db.offlineDrafts).insert(
      OfflineDraftsCompanion.insert(
        localId: draft.localId,
        projectId: draft.projectId,
        payload: jsonEncode(draft.toJson()),
        createdAt: Value(DateTime.now()),
      ),
    );
    state = [...state, draft];
    return draft.localId;
  }

  Future<void> loadDrafts() async {
    final db = ref.read(offlineDbProvider);
    final rows = await (db.select(db.offlineDrafts)
      ..where((t) => t.isSynced.equals(false))).get();
    state = rows.map((r) =>
        DraftExpense.fromJson(jsonDecode(r.payload) as Map<String, dynamic>)
    ).toList();
  }

  Future<void> syncAll() async {
    if (!ref.read(connectivityNotifierProvider)) return;

    final pending = state.where((d) => !d.isSynced).toList();
    if (pending.isEmpty) return;

    final repo = ref.read(expenseRepositoryProvider);
    final db = ref.read(offlineDbProvider);

    for (final draft in pending) {
      try {
        await repo.createExpense(draft.projectId, {
          'title': draft.title,
          'amount': draft.amount,
          'tax_amount': draft.taxAmount,
          'total_amount': draft.amount + draft.taxAmount,
          'category_id': draft.categoryId,
          'payment_method': draft.paymentMethod,
          'payment_status': draft.paymentStatus,
          'expense_date': draft.expenseDate,
          'notes': draft.notes,
          'vendor_id': draft.vendorId,
          'phase_id': draft.phaseId,
        });

        await (db.update(db.offlineDrafts)
          ..where((t) => t.localId.equals(draft.localId)))
            .write(const OfflineDraftsCompanion(isSynced: Value(true)));

        state = state.where((d) => d.localId != draft.localId).toList();
      } catch (_) {
        // Will retry on next connectivity event
      }
    }
  }

  int get pendingCount => state.where((d) => !d.isSynced).length;
}
