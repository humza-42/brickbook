import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';
import '../../auth/providers/auth_provider.dart';
import '../../settings/providers/profile_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language  = ref.watch(languageProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    final user      = ref.watch(currentUserProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // Profile header
          user.when(
            data: (u) => _ProfileHeader(
              name: u.name,
              role: u.role,
              email: u.email,
              phone: u.phone,
              onTap: () => context.push(Routes.profile),
            ),
            loading: () => const _ProfileHeaderShimmer(),
            error: (_, __) => const SizedBox.shrink(),
          ),

          const SizedBox(height: AppDim.base),

          // Account
          _SettingsGroup(
            title: 'Account',
            tiles: [
              _SettingsTile(
                icon: Icons.person_outline_rounded,
                iconColor: AppColors.primary,
                label: 'Edit Profile',
                subtitle: 'Name, email, phone',
                onTap: () => context.push(Routes.profile),
              ),
              _SettingsTile(
                icon: Icons.lock_outline_rounded,
                iconColor: AppColors.primaryLight,
                label: 'Change Password',
                onTap: () => _showChangePasswordSheet(context),
              ),
            ],
          ),

          // Preferences
          _SettingsGroup(
            title: 'Preferences',
            tiles: [
              // Language
              _SettingsTile(
                icon: Icons.language_rounded,
                iconColor: AppColors.catTransport,
                label: 'Language',
                trailing: _LanguagePill(lang: language),
                onTap: () => context.push(Routes.language),
              ),
              // Dark mode
              _SettingsTile(
                icon: Icons.dark_mode_outlined,
                iconColor: AppColors.textSecondary,
                label: 'Dark Mode',
                trailing: Switch(
                  value: themeMode == ThemeMode.dark,
                  onChanged: (_) =>
                      ref.read(appThemeModeProvider.notifier).toggle(),
                  activeColor: AppColors.primary,
                ),
                onTap: () =>
                    ref.read(appThemeModeProvider.notifier).toggle(),
              ),
              // Notifications
              _SettingsTile(
                icon: Icons.notifications_outlined,
                iconColor: AppColors.warning,
                label: 'Notifications',
                subtitle: 'Budget alerts, reminders, activity',
                onTap: () => context.push(Routes.notifications),
              ),
            ],
          ),

          // About
          _SettingsGroup(
            title: 'About',
            tiles: [
              _SettingsTile(
                icon: Icons.info_outline_rounded,
                iconColor: AppColors.info,
                label: 'App Version',
                trailing: FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (_, snap) => Text(
                    snap.data != null
                        ? 'v${snap.data!.version} (${snap.data!.buildNumber})'
                        : '—',
                    style: AppText.caption,
                  ),
                ),
              ),
              _SettingsTile(
                icon: Icons.privacy_tip_outlined,
                iconColor: AppColors.success,
                label: 'Privacy Policy',
                onTap: () {},
              ),
              _SettingsTile(
                icon: Icons.description_outlined,
                iconColor: AppColors.success,
                label: 'Terms of Service',
                onTap: () {},
              ),
              _SettingsTile(
                icon: Icons.star_outline_rounded,
                iconColor: AppColors.accent,
                label: 'Rate BrickBook',
                onTap: () {},
              ),
            ],
          ),

          // Danger zone
          _SettingsGroup(
            title: 'Account Actions',
            tiles: [
              _SettingsTile(
                icon: Icons.logout_rounded,
                iconColor: AppColors.error,
                label: 'Log Out',
                labelColor: AppColors.error,
                onTap: () => _confirmLogout(context, ref),
              ),
            ],
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.fromLTRB(
          AppDim.pageHPadding,
          AppDim.xl,
          AppDim.pageHPadding,
          MediaQuery.of(context).padding.bottom + AppDim.xl,
        ),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppDim.radiusXxl)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64, height: 64,
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.logout_rounded,
                  color: AppColors.error, size: 32),
            ),
            const SizedBox(height: AppDim.base),
            Text('Log Out?', style: AppText.h2),
            const SizedBox(height: 6),
            Text(
              'You will be signed out of your account.\nYour data will remain safe.',
              textAlign: TextAlign.center,
              style: AppText.bodyMd.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppDim.xxl),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await ref
                      .read(authStateNotifierProvider.notifier)
                      .logout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, AppDim.btnXl),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppDim.radiusMd)),
                ),
                child: const Text('Yes, Log Out'),
              ),
            ),
            const SizedBox(height: AppDim.sm),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel',
                  style: AppText.btnMd
                      .copyWith(color: AppColors.textSecondary)),
            ),
          ],
        ),
      ),
    );
  }

  void _showChangePasswordSheet(BuildContext context) {
    final currentCtrl = TextEditingController();
    final newCtrl     = TextEditingController();
    final confirmCtrl = TextEditingController();
    bool obs1 = true, obs2 = true, obs3 = true;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => StatefulBuilder(
        builder: (ctx, set) => Container(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppDim.radiusXxl)),
          ),
          padding: EdgeInsets.fromLTRB(
            AppDim.pageHPadding,
            AppDim.base,
            AppDim.pageHPadding,
            MediaQuery.of(ctx).viewInsets.bottom + AppDim.pageVPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    width: 40, height: 4,
                    decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(2))),
              ),
              const SizedBox(height: AppDim.base),
              Text('Change Password', style: AppText.h3),
              const SizedBox(height: AppDim.xl),
              _PassField(
                ctrl: currentCtrl, label: 'Current Password',
                obs: obs1, onToggle: () => set(() => obs1 = !obs1),
              ),
              const SizedBox(height: AppDim.base),
              _PassField(
                ctrl: newCtrl, label: 'New Password',
                obs: obs2, onToggle: () => set(() => obs2 = !obs2),
              ),
              const SizedBox(height: AppDim.base),
              _PassField(
                ctrl: confirmCtrl, label: 'Confirm New Password',
                obs: obs3, onToggle: () => set(() => obs3 = !obs3),
              ),
              const SizedBox(height: AppDim.xxl),
              SizedBox(
                width: double.infinity,
                height: AppDim.btnXl,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(ctx),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDim.radiusMd)),
                  ),
                  child: const Text('Update Password'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PassField extends StatelessWidget {
  final TextEditingController ctrl;
  final String label;
  final bool obs;
  final VoidCallback onToggle;
  const _PassField(
      {required this.ctrl, required this.label,
       required this.obs, required this.onToggle});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
          style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
      const SizedBox(height: 6),
      TextField(
        controller: ctrl,
        obscureText: obs,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.surfaceVariant,
          suffixIcon: GestureDetector(
            onTap: onToggle,
            child: Icon(
              obs ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              size: 18, color: AppColors.textTertiary,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDim.radiusMd),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDim.radiusMd),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDim.radiusMd),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: AppDim.base, vertical: 14),
        ),
      ),
    ],
  );
}

// Profile Header
class _ProfileHeader extends StatelessWidget {
  final String name, role;
  final String? email, phone;
  final VoidCallback onTap;
  const _ProfileHeader({
    required this.name, required this.role,
    this.email, this.phone, required this.onTap,
  });

  String get _initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return name.substring(0, name.length.clamp(0, 2)).toUpperCase();
  }

  String get _roleLabel => switch (role) {
    'house_owner'  => 'House Owner',
    'contractor'   => 'Contractor',
    'investor'     => 'Investor',
    'developer'    => 'Developer',
    'architect'    => 'Architect / Consultant',
    'shop_owner'   => 'Shop / Market Owner',
    _              => role,
  };

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.all(AppDim.pageHPadding),
      padding: const EdgeInsets.all(AppDim.base),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [AppColors.primaryDark, AppColors.primary],
        ),
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDim.cardRadius),
            child: CustomPaint(painter: _DiagPainter()),
          )),
          Row(
            children: [
              Container(
                width: 60, height: 60,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(
                    color: AppColors.accent.withOpacity(0.3),
                    blurRadius: 12, offset: const Offset(0, 4),
                  )],
                ),
                child: Center(child: Text(_initials,
                    style: const TextStyle(fontFamily: 'Sora', fontSize: 20,
                        fontWeight: FontWeight.w700, color: Colors.white))),
              ),
              const SizedBox(width: AppDim.base),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontFamily: 'Sora',
                      fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
                  const SizedBox(height: 3),
                  Text(_roleLabel, style: TextStyle(fontFamily: 'Sora',
                      fontSize: 13, color: Colors.white.withOpacity(0.7))),
                  const SizedBox(height: 4),
                  Text(email ?? phone ?? '',
                      style: TextStyle(fontFamily: 'Sora', fontSize: 12,
                          color: Colors.white.withOpacity(0.55))),
                ],
              )),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white54, size: 16),
            ],
          ),
        ],
      ),
    ),
  );
}

class _ProfileHeaderShimmer extends StatelessWidget {
  const _ProfileHeaderShimmer();

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.all(AppDim.pageHPadding),
    height: 88,
    decoration: BoxDecoration(
      color: AppColors.surfaceVariant,
      borderRadius: BorderRadius.circular(AppDim.cardRadius),
    ),
  );
}

class _DiagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = Colors.white.withOpacity(0.04)..strokeWidth = 1;
    for (double i = -size.height; i < size.width + size.height; i += 50) {
      canvas.drawLine(Offset(i, 0), Offset(i + size.height, size.height), p);
    }
  }
  @override bool shouldRepaint(_) => false;
}

// Settings Group
class _SettingsGroup extends StatelessWidget {
  final String title;
  final List<Widget> tiles;
  const _SettingsGroup({required this.title, required this.tiles});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(
        AppDim.pageHPadding, 0, AppDim.pageHPadding, AppDim.base),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 4, bottom: AppDim.sm, top: AppDim.sm),
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
            final i    = e.key;
            final tile = e.value;
            return Column(children: [
              tile,
              if (i < tiles.length - 1)
                const Divider(height: 1, indent: 52, color: AppColors.borderLight),
            ]);
          }).toList()),
        ),
      ],
    ),
  );
}

// Settings Tile
class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String? subtitle;
  final Color? labelColor;
  final Widget? trailing;
  final VoidCallback? onTap;
  const _SettingsTile({
    required this.icon, required this.iconColor, required this.label,
    this.subtitle, this.labelColor, this.trailing, this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDim.base, vertical: AppDim.md),
      child: Row(children: [
        Container(
          width: 36, height: 36,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(AppDim.radiusSm),
          ),
          child: Icon(icon, color: iconColor, size: 18),
        ),
        const SizedBox(width: AppDim.md),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppText.labelLg.copyWith(
                color: labelColor ?? AppColors.textPrimary)),
            if (subtitle != null)
              Text(subtitle!, style: AppText.caption),
          ],
        )),
        if (trailing != null)
          trailing!
        else if (onTap != null)
          const Icon(Icons.chevron_right_rounded,
              color: AppColors.textTertiary, size: 18),
      ]),
    ),
  );
}

class _LanguagePill extends StatelessWidget {
  final String lang;
  const _LanguagePill({required this.lang});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: AppColors.primary.withOpacity(0.1),
      borderRadius: BorderRadius.circular(AppDim.radiusFull),
      border: Border.all(color: AppColors.primary.withOpacity(0.3)),
    ),
    child: Text(lang == 'ur' ? '🇵🇰 اردو' : '🇬🇧 English',
        style: AppText.labelSm.copyWith(color: AppColors.primary)),
  );
}
