// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseCategoriesHash() => r'3d0a9711f19b7c3d50c2ce653e94d0dde00e1a3f';

/// See also [expenseCategories].
@ProviderFor(expenseCategories)
final expenseCategoriesProvider =
    AutoDisposeFutureProvider<List<ExpenseCategory>>.internal(
  expenseCategories,
  name: r'expenseCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expenseCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ExpenseCategoriesRef
    = AutoDisposeFutureProviderRef<List<ExpenseCategory>>;
String _$expensesListHash() => r'889d178ba12e64e5156d30d2569bb226a3b776d3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [expensesList].
@ProviderFor(expensesList)
const expensesListProvider = ExpensesListFamily();

/// See also [expensesList].
class ExpensesListFamily extends Family<AsyncValue<List<ExpenseModel>>> {
  /// See also [expensesList].
  const ExpensesListFamily();

  /// See also [expensesList].
  ExpensesListProvider call(
    String projectId,
    ExpenseFilter filter,
  ) {
    return ExpensesListProvider(
      projectId,
      filter,
    );
  }

  @override
  ExpensesListProvider getProviderOverride(
    covariant ExpensesListProvider provider,
  ) {
    return call(
      provider.projectId,
      provider.filter,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'expensesListProvider';
}

/// See also [expensesList].
class ExpensesListProvider
    extends AutoDisposeFutureProvider<List<ExpenseModel>> {
  /// See also [expensesList].
  ExpensesListProvider(
    String projectId,
    ExpenseFilter filter,
  ) : this._internal(
          (ref) => expensesList(
            ref as ExpensesListRef,
            projectId,
            filter,
          ),
          from: expensesListProvider,
          name: r'expensesListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expensesListHash,
          dependencies: ExpensesListFamily._dependencies,
          allTransitiveDependencies:
              ExpensesListFamily._allTransitiveDependencies,
          projectId: projectId,
          filter: filter,
        );

  ExpensesListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
    required this.filter,
  }) : super.internal();

  final String projectId;
  final ExpenseFilter filter;

  @override
  Override overrideWith(
    FutureOr<List<ExpenseModel>> Function(ExpensesListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExpensesListProvider._internal(
        (ref) => create(ref as ExpensesListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ExpenseModel>> createElement() {
    return _ExpensesListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpensesListProvider &&
        other.projectId == projectId &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExpensesListRef on AutoDisposeFutureProviderRef<List<ExpenseModel>> {
  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `filter` of this provider.
  ExpenseFilter get filter;
}

class _ExpensesListProviderElement
    extends AutoDisposeFutureProviderElement<List<ExpenseModel>>
    with ExpensesListRef {
  _ExpensesListProviderElement(super.provider);

  @override
  String get projectId => (origin as ExpensesListProvider).projectId;
  @override
  ExpenseFilter get filter => (origin as ExpensesListProvider).filter;
}

String _$expenseDetailHash() => r'fb697a5a832c8de7a42b2237ee2aec7b5baf1d9e';

/// See also [expenseDetail].
@ProviderFor(expenseDetail)
const expenseDetailProvider = ExpenseDetailFamily();

/// See also [expenseDetail].
class ExpenseDetailFamily extends Family<AsyncValue<ExpenseModel>> {
  /// See also [expenseDetail].
  const ExpenseDetailFamily();

  /// See also [expenseDetail].
  ExpenseDetailProvider call(
    String projectId,
    String expenseId,
  ) {
    return ExpenseDetailProvider(
      projectId,
      expenseId,
    );
  }

  @override
  ExpenseDetailProvider getProviderOverride(
    covariant ExpenseDetailProvider provider,
  ) {
    return call(
      provider.projectId,
      provider.expenseId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'expenseDetailProvider';
}

/// See also [expenseDetail].
class ExpenseDetailProvider extends AutoDisposeFutureProvider<ExpenseModel> {
  /// See also [expenseDetail].
  ExpenseDetailProvider(
    String projectId,
    String expenseId,
  ) : this._internal(
          (ref) => expenseDetail(
            ref as ExpenseDetailRef,
            projectId,
            expenseId,
          ),
          from: expenseDetailProvider,
          name: r'expenseDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$expenseDetailHash,
          dependencies: ExpenseDetailFamily._dependencies,
          allTransitiveDependencies:
              ExpenseDetailFamily._allTransitiveDependencies,
          projectId: projectId,
          expenseId: expenseId,
        );

  ExpenseDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
    required this.expenseId,
  }) : super.internal();

  final String projectId;
  final String expenseId;

  @override
  Override overrideWith(
    FutureOr<ExpenseModel> Function(ExpenseDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExpenseDetailProvider._internal(
        (ref) => create(ref as ExpenseDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
        expenseId: expenseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ExpenseModel> createElement() {
    return _ExpenseDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpenseDetailProvider &&
        other.projectId == projectId &&
        other.expenseId == expenseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);
    hash = _SystemHash.combine(hash, expenseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExpenseDetailRef on AutoDisposeFutureProviderRef<ExpenseModel> {
  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `expenseId` of this provider.
  String get expenseId;
}

class _ExpenseDetailProviderElement
    extends AutoDisposeFutureProviderElement<ExpenseModel>
    with ExpenseDetailRef {
  _ExpenseDetailProviderElement(super.provider);

  @override
  String get projectId => (origin as ExpenseDetailProvider).projectId;
  @override
  String get expenseId => (origin as ExpenseDetailProvider).expenseId;
}

String _$activeExpenseFilterHash() =>
    r'e6db7b478174eeb19b0e0c502c7334d808a22dad';

abstract class _$ActiveExpenseFilter
    extends BuildlessAutoDisposeNotifier<ExpenseFilter> {
  late final String projectId;

  ExpenseFilter build(
    String projectId,
  );
}

/// See also [ActiveExpenseFilter].
@ProviderFor(ActiveExpenseFilter)
const activeExpenseFilterProvider = ActiveExpenseFilterFamily();

/// See also [ActiveExpenseFilter].
class ActiveExpenseFilterFamily extends Family<ExpenseFilter> {
  /// See also [ActiveExpenseFilter].
  const ActiveExpenseFilterFamily();

  /// See also [ActiveExpenseFilter].
  ActiveExpenseFilterProvider call(
    String projectId,
  ) {
    return ActiveExpenseFilterProvider(
      projectId,
    );
  }

  @override
  ActiveExpenseFilterProvider getProviderOverride(
    covariant ActiveExpenseFilterProvider provider,
  ) {
    return call(
      provider.projectId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'activeExpenseFilterProvider';
}

/// See also [ActiveExpenseFilter].
class ActiveExpenseFilterProvider extends AutoDisposeNotifierProviderImpl<
    ActiveExpenseFilter, ExpenseFilter> {
  /// See also [ActiveExpenseFilter].
  ActiveExpenseFilterProvider(
    String projectId,
  ) : this._internal(
          () => ActiveExpenseFilter()..projectId = projectId,
          from: activeExpenseFilterProvider,
          name: r'activeExpenseFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$activeExpenseFilterHash,
          dependencies: ActiveExpenseFilterFamily._dependencies,
          allTransitiveDependencies:
              ActiveExpenseFilterFamily._allTransitiveDependencies,
          projectId: projectId,
        );

  ActiveExpenseFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final String projectId;

  @override
  ExpenseFilter runNotifierBuild(
    covariant ActiveExpenseFilter notifier,
  ) {
    return notifier.build(
      projectId,
    );
  }

  @override
  Override overrideWith(ActiveExpenseFilter Function() create) {
    return ProviderOverride(
      origin: this,
      override: ActiveExpenseFilterProvider._internal(
        () => create()..projectId = projectId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ActiveExpenseFilter, ExpenseFilter>
      createElement() {
    return _ActiveExpenseFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActiveExpenseFilterProvider && other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ActiveExpenseFilterRef on AutoDisposeNotifierProviderRef<ExpenseFilter> {
  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ActiveExpenseFilterProviderElement
    extends AutoDisposeNotifierProviderElement<ActiveExpenseFilter,
        ExpenseFilter> with ActiveExpenseFilterRef {
  _ActiveExpenseFilterProviderElement(super.provider);

  @override
  String get projectId => (origin as ActiveExpenseFilterProvider).projectId;
}

String _$expenseFormNotifierHash() =>
    r'c078561a021683952927b15f76f920e3504aaaab';

/// See also [ExpenseFormNotifier].
@ProviderFor(ExpenseFormNotifier)
final expenseFormNotifierProvider =
    AutoDisposeNotifierProvider<ExpenseFormNotifier, ExpenseFormState>.internal(
  ExpenseFormNotifier.new,
  name: r'expenseFormNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expenseFormNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExpenseFormNotifier = AutoDisposeNotifier<ExpenseFormState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
