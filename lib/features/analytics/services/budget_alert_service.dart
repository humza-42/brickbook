import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_alert_service.g.dart';

@riverpod
BudgetAlertService budgetAlertService(BudgetAlertServiceRef ref) =>
    BudgetAlertService();

class BudgetAlertService {
  final _notif = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios     = DarwinInitializationSettings();
    await _notif.initialize(
      const InitializationSettings(android: android, iOS: ios),
    );
    _initialized = true;
  }

  /// Call after each new expense is saved to check thresholds
  Future<void> checkBudget({
    required String projectName,
    required double spent,
    required double budget,
  }) async {
    await init();
    if (budget <= 0) return;

    final pct = spent / budget;

    if (pct >= 1.0) {
      await _send(
        id: projectName.hashCode,
        title: '🚨 Over Budget!',
        body: '$projectName has exceeded its budget. Rs. ${(spent - budget).toStringAsFixed(0)} over.',
      );
    } else if (pct >= 0.85) {
      await _send(
        id: projectName.hashCode + 1,
        title: '⚠️ Budget Warning',
        body: '$projectName is at ${(pct * 100).toStringAsFixed(0)}% budget. Rs. ${(budget - spent).toStringAsFixed(0)} remaining.',
      );
    } else if (pct >= 0.70) {
      await _send(
        id: projectName.hashCode + 2,
        title: '💛 Budget Notice',
        body: '$projectName has used 70% of its budget.',
      );
    }
  }

  Future<void> _send({required int id, required String title, required String body}) async {
    const androidDetails = AndroidNotificationDetails(
      'budget_alerts',
      'Budget Alerts',
      channelDescription: 'BrickBook budget threshold notifications',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );
    const iosDetails = DarwinNotificationDetails();
    await _notif.show(
      id, title, body,
      const NotificationDetails(android: androidDetails, iOS: iosDetails),
    );
  }
}
