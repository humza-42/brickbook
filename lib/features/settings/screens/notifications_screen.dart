import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../providers/notification_provider.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(notificationPreferencesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(AppDim.pageHPadding),
        children: [
          const SizedBox(height: AppDim.sm),

          // Master FCM toggle info
          Container(
            padding: const EdgeInsets.all(AppDim.base),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.06),
              borderRadius: BorderRadius.circular(AppDim.radiusMd),
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: Row(children: [
              const Icon(Icons.notifications_active_outlined,
                  color: AppColors.primary, size: 20),
              const SizedBox(width: AppDim.sm),
              Expanded(child: Text(
                'Push notifications are enabled. Manage individual types below.',
                style: AppText.bodySm.copyWith(color: AppColors.primary),
              )),
            ]),
          ),
          const SizedBox(height: AppDim.xl),

          // Budget alerts
          _NotifGroup(
            title: 'Budget & Finance',
            tiles: [
              _NotifTile(
                icon: Icons.account_balance_wallet_outlined,
                iconColor: AppColors.error,
                title: 'Budget Alerts',
                subtitle: 'Alert when project reaches 70%, 85% and 100% of budget',
                value: prefs.budgetAlerts,
                onChanged: (_) => ref
                    .read(notificationPreferencesProvider.notifier)
                    .toggle('budgetAlerts'),
              ),
              _NotifTile(
                icon: Icons.pending_outlined,
                iconColor: AppColors.warning,
                title: 'Payment Reminders',
                subtitle: 'Remind about pending and upcoming payments',
                value: prefs.paymentReminders,
                onChanged: (_) => ref
                    .read(notificationPreferencesProvider.notifier)
                    .toggle('paymentReminders'),
              ),
            ],
          ),

          // Activity alerts
          _NotifGroup(
            title: 'Project Activity',
            tiles: [
              _NotifTile(
                icon: Icons.receipt_long_outlined,
                iconColor: AppColors.primary,
                title: 'Expense Added',
                subtitle: 'When a team member adds an expense to your project',
                value: prefs.expenseAdded,
                onChanged: (_) => ref
                    .read(notificationPreferencesProvider.notifier)
                    .toggle('expenseAdded'),
              ),
              _NotifTile(
                icon: Icons.link_rounded,
                iconColor: AppColors.catTransport,
                title: 'Guest Link Viewed',
                subtitle: 'When someone opens your shared project link',
                value: prefs.guestLinkViewed,
                onChanged: (_) => ref
                    .read(notificationPreferencesProvider.notifier)
                    .toggle('guestLinkViewed'),
              ),
            ],
          ),

          // General
          _NotifGroup(
            title: 'General',
            tiles: [
              _NotifTile(
                icon: Icons.bar_chart_rounded,
                iconColor: AppColors.success,
                title: 'Daily Summary',
                subtitle: 'Daily spending summary for all active projects',
                value: prefs.dailySummary,
                onChanged: (_) => ref
                    .read(notificationPreferencesProvider.notifier)
                    .toggle('dailySummary'),
              ),
              _NotifTile(
                icon: Icons.campaign_outlined,
                iconColor: AppColors.accent,
                title: 'Announcements',
                subtitle: 'Important updates and new features from BrickBook',
                value: prefs.announcements,
                onChanged: (_) => ref
                    .read(notificationPreferencesProvider.notifier)
                    .toggle('announcements'),
              ),
            ],
          ),

          const SizedBox(height: AppDim.xxl),

          // Info footer
          Center(child: Text(
            'Changes are saved automatically',
            style: AppText.caption.copyWith(color: AppColors.textTertiary),
          )),
          const SizedBox(height: AppDim.xxl),
        ],
      ),
    );
  }
}

class _NotifGroup extends StatelessWidget {
  final String title;
  final List<Widget> tiles;
  const _NotifGroup({required this.title, required this.tiles});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 4, bottom: AppDim.sm),
        child: Text(title.toUpperCase(),
            style: AppText.overline.copyWith(color: AppColors.textTertiary)),
      ),
      Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDim.radiusMd),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(children: tiles.asMap().entries.map((e) {
          return Column(children: [
            e.value,
            if (e.key < tiles.length - 1)
              const Divider(height: 1, indent: 60, color: AppColors.borderLight),
          ]);
        }).toList()),
      ),
      const SizedBox(height: AppDim.base),
    ],
  );
}

class _NotifTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title, subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _NotifTile({
    required this.icon, required this.iconColor,
    required this.title, required this.subtitle,
    required this.value, required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: AppDim.base, vertical: AppDim.md),
    child: Row(children: [
      Container(
        width: 40, height: 40,
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      const SizedBox(width: AppDim.md),
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppText.labelLg),
          const SizedBox(height: 2),
          Text(subtitle, style: AppText.caption),
        ],
      )),
      const SizedBox(width: AppDim.sm),
      Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primary,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ]),
  );
}
