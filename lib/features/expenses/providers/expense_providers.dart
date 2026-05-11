import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/expense_repository.dart';
import '../data/models/expense_models.dart';

part 'expense_providers.freezed.dart';
part 'expense_providers.g.dart';

// Categories provider (cached)
@riverpod
Future<List<ExpenseCategory>> expenseCategories(ExpenseCategoriesRef ref) =>
    ref.watch(expenseRepositoryProvider).getCategories();

// Expenses list (with filter)
@riverpod
Future<List<ExpenseModel>> expensesList(
  ExpensesListRef ref,
  String projectId,
  ExpenseFilter filter,
) => ref.watch(expenseRepositoryProvider).getExpenses(projectId, filter);

// Single expense
@riverpod
Future<ExpenseModel> expenseDetail(
  ExpenseDetailRef ref,
  String projectId,
  String expenseId,
) => ref.watch(expenseRepositoryProvider).getExpense(projectId, expenseId);

// Active filter state per project
@riverpod
class ActiveExpenseFilter extends _$ActiveExpenseFilter {
  @override
  ExpenseFilter build(String projectId) => const ExpenseFilter();

  void update(ExpenseFilter filter) {
    state = filter;
    ref.invalidate(expensesListProvider(projectId, state));
  }

  void reset() => state = const ExpenseFilter();

  bool get hasActiveFilters =>
      state.categoryId    != null ||
      state.paymentMethod != null ||
      state.paymentStatus != null ||
      state.dateFrom      != null ||
      state.search        != null;
}

// Add/Edit Expense Notifier
@freezed
class ExpenseFormState with _$ExpenseFormState {
  const factory ExpenseFormState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaved,
    String? error,
    ExpenseModel? saved,
  }) = _ExpenseFormState;
}

@riverpod
class ExpenseFormNotifier extends _$ExpenseFormNotifier {
  @override
  ExpenseFormState build() => const ExpenseFormState();

  Future<void> save(String projectId, Map<String, dynamic> data,
      {String? editId, List<String> attachmentPaths = const []}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo = ref.read(expenseRepositoryProvider);
      late ExpenseModel saved;

      if (editId != null) {
        saved = await repo.updateExpense(projectId, editId, data);
      } else {
        saved = await repo.createExpense(projectId, data);
      }

      // Upload attachments after save
      for (final path in attachmentPaths) {
        await repo.uploadAttachment(projectId, saved.id, path);
      }

      ref.invalidate(expensesListProvider(projectId, const ExpenseFilter()));
      state = state.copyWith(isLoading: false, isSaved: true, saved: saved);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void reset() => state = const ExpenseFormState();
}
