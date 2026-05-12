import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_provider.freezed.dart';
part 'notification_provider.g.dart';

@freezed
class NotificationPrefs with _$NotificationPrefs {
  const factory NotificationPrefs({
    @Default(true)  bool budgetAlerts,     // 70%, 85%, 100% alerts
    @Default(true)  bool expenseAdded,     // when team member adds expense
    @Default(true)  bool guestLinkViewed,  // when someone views guest link
    @Default(false) bool dailySummary,     // daily spending summary
    @Default(true)  bool paymentReminders, // upcoming payment due
    @Default(true)  bool announcements,    // in-app announcements from admin
  }) = _NotificationPrefs;
}

@riverpod
class NotificationPreferences extends _$NotificationPreferences {
  @override
  NotificationPrefs build() => const NotificationPrefs();

  void toggle(String key) {
    state = switch (key) {
      'budgetAlerts'    => state.copyWith(budgetAlerts:    !state.budgetAlerts),
      'expenseAdded'    => state.copyWith(expenseAdded:    !state.expenseAdded),
      'guestLinkViewed' => state.copyWith(guestLinkViewed: !state.guestLinkViewed),
      'dailySummary'    => state.copyWith(dailySummary:    !state.dailySummary),
      'paymentReminders'=> state.copyWith(paymentReminders:!state.paymentReminders),
      'announcements'   => state.copyWith(announcements:   !state.announcements),
      _                 => state,
    };
  }
}
