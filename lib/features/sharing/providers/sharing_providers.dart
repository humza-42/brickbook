import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/sharing_repository.dart';
import '../data/models/sharing_models.dart';

part 'sharing_providers.freezed.dart';
part 'sharing_providers.g.dart';

// Guest links list
@riverpod
Future<List<GuestLink>> guestLinks(GuestLinksRef ref, String projectId) =>
    ref.watch(sharingRepositoryProvider).getGuestLinks(projectId);

// Create link state
@freezed
class CreateLinkState with _$CreateLinkState {
  const factory CreateLinkState({
    @Default(false) bool isLoading,
    GuestLink? created,
    String? error,
  }) = _CreateLinkState;
}

@riverpod
class CreateLinkNotifier extends _$CreateLinkNotifier {
  @override
  CreateLinkState build() => const CreateLinkState();

  Future<void> create(String projectId, CreateGuestLinkRequest req) async {
    state = state.copyWith(isLoading: true, error: null, created: null);
    try {
      final link = await ref.read(sharingRepositoryProvider)
          .createGuestLink(projectId, req);
      ref.invalidate(guestLinksProvider(projectId));
      state = state.copyWith(isLoading: false, created: link);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void reset() => state = const CreateLinkState();
}

// Export state
@freezed
class ExportState with _$ExportState {
  const factory ExportState({
    @Default(false) bool isLoading,
    @Default(false) bool isDone,
    File? file,
    String? error,
    String? exportType,
  }) = _ExportState;
}

@riverpod
class ExportNotifier extends _$ExportNotifier {
  @override
  ExportState build() => const ExportState();

  Future<void> exportPdf(String projectId) async {
    state = state.copyWith(isLoading: true, error: null, isDone: false, exportType: 'pdf');
    try {
      final file = await ref.read(sharingRepositoryProvider).exportPdf(projectId);
      state = state.copyWith(isLoading: false, isDone: true, file: file);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> exportExcel(String projectId) async {
    state = state.copyWith(isLoading: true, error: null, isDone: false, exportType: 'excel');
    try {
      final file = await ref.read(sharingRepositoryProvider).exportExcel(projectId);
      state = state.copyWith(isLoading: false, isDone: true, file: file);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void reset() => state = const ExportState();
}

// Email state
@freezed
class EmailReportState with _$EmailReportState {
  const factory EmailReportState({
    @Default(false) bool isLoading,
    @Default(false) bool isSent,
    String? error,
  }) = _EmailReportState;
}

@riverpod
class EmailReportNotifier extends _$EmailReportNotifier {
  @override
  EmailReportState build() => const EmailReportState();

  Future<void> send(String projectId, String email, String? message) async {
    state = state.copyWith(isLoading: true, error: null, isSent: false);
    try {
      await ref.read(sharingRepositoryProvider).sendEmailReport(projectId, email, message);
      state = state.copyWith(isLoading: false, isSent: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void reset() => state = const EmailReportState();
}
