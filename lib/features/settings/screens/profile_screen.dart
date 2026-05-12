import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/widgets/bb_button.dart';
import '../../../core/widgets/bb_text_field.dart';
import '../providers/profile_provider.dart';
import '../../auth/data/models/auth_models.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _nameCtrl  = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  String _role = '';
  bool   _loaded = false;
  final  _picker = ImagePicker();

  @override
  void dispose() {
    _nameCtrl.dispose(); _emailCtrl.dispose(); _phoneCtrl.dispose();
    super.dispose();
  }

  void _loadUser(UserModel user) {
    if (!_loaded) {
      _nameCtrl.text  = user.name;
      _emailCtrl.text = user.email ?? '';
      _phoneCtrl.text = user.phone ?? '';
      _role           = user.role;
      _loaded         = true;
    }
  }

  Future<void> _pickPhoto() async {
    final img = await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 80);
    if (img == null) return;
    // In production: upload to API and update profile photo URL
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Photo upload coming soon')));
    }
  }

  Future<void> _save() async {
    await ref.read(profileEditNotifierProvider.notifier).update({
      'name':  _nameCtrl.text.trim(),
      'email': _emailCtrl.text.trim().isEmpty ? null : _emailCtrl.text.trim(),
      'phone': _phoneCtrl.text.trim().isEmpty ? null : _phoneCtrl.text.trim(),
      'role':  _role,
    });
    final state = ref.read(profileEditNotifierProvider);
    if (state.isSaved && mounted) {
      ref.read(profileEditNotifierProvider.notifier).reset();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('✅ Profile updated'),
          backgroundColor: AppColors.success));
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final user  = ref.watch(currentUserProvider);
    final state = ref.watch(profileEditNotifierProvider);

    ref.listen(profileEditNotifierProvider, (_, s) {
      if (s.error != null) ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(s.error!), backgroundColor: AppColors.error));
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: state.isLoading ? null : _save,
            child: state.isLoading
                ? const SizedBox(width: 20, height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary))
                : Text('Save', style: AppText.labelLg.copyWith(color: AppColors.primary)),
          ),
        ],
      ),
      body: user.when(
        data: (u) {
          _loadUser(u);
          return SingleChildScrollView(
            child: Column(
              children: [
                _ProfileAvatarSection(
                  name: u.name,
                  onPickPhoto: _pickPhoto,
                ),

                Padding(
                  padding: const EdgeInsets.all(AppDim.pageHPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BBTextField(
                        controller: _nameCtrl,
                        label: 'Full Name',
                        hint: 'Your full name',
                        prefixIcon: Icons.person_outline,
                      ),
                      const SizedBox(height: AppDim.base),

                      BBTextField(
                        controller: _emailCtrl,
                        label: 'Email Address',
                        hint: 'your@email.com',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.email_outlined,
                      ),
                      const SizedBox(height: AppDim.base),

                      BBTextField(
                        controller: _phoneCtrl,
                        label: 'Phone Number',
                        hint: '+923001234567',
                        keyboardType: TextInputType.phone,
                        prefixIcon: Icons.phone_outlined,
                      ),
                      const SizedBox(height: AppDim.xl),

                      Text('Your Role',
                          style: AppText.labelLg
                              .copyWith(color: AppColors.textSecondary)),
                      const SizedBox(height: AppDim.sm),
                      _RolePicker(
                        selected: _role,
                        onSelect: (r) => setState(() => _role = r),
                      ),
                      const SizedBox(height: AppDim.xxl),

                      BBButton(
                        label: 'Save Changes',
                        isLoading: state.isLoading,
                        onPressed: _save,
                      ),
                      const SizedBox(height: AppDim.xxl),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

// Profile Avatar Section
class _ProfileAvatarSection extends StatelessWidget {
  final String name;
  final VoidCallback onPickPhoto;
  const _ProfileAvatarSection({required this.name, required this.onPickPhoto});

  String get _initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return name.substring(0, name.length.clamp(0, 2)).toUpperCase();
  }

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: AppDim.xxl),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [AppColors.primaryDark, AppColors.background],
      ),
    ),
    child: Column(children: [
      Stack(children: [
        Container(
          width: 90, height: 90,
          decoration: BoxDecoration(
            color: AppColors.accent,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(
              color: AppColors.accent.withOpacity(0.35),
              blurRadius: 20, offset: const Offset(0, 6),
            )],
          ),
          child: Center(child: Text(_initials,
              style: const TextStyle(fontFamily: 'Sora', fontSize: 32,
                  fontWeight: FontWeight.w700, color: Colors.white))),
        ),
        Positioned(
          bottom: 0, right: 0,
          child: GestureDetector(
            onTap: onPickPhoto,
            child: Container(
              width: 30, height: 30,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.camera_alt_rounded,
                  color: Colors.white, size: 15),
            ),
          ),
        ),
      ]),
      const SizedBox(height: AppDim.sm),
      Text('Tap camera to change photo',
          style: AppText.caption.copyWith(color: AppColors.textTertiary)),
    ]),
  );
}

// Role Picker
class _RolePicker extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelect;
  const _RolePicker({required this.selected, required this.onSelect});

  static const _roles = [
    {'slug': 'house_owner',  'label': 'House Owner',   'icon': '🏠'},
    {'slug': 'contractor',   'label': 'Contractor',     'icon': '🏗️'},
    {'slug': 'investor',     'label': 'Investor',       'icon': '💰'},
    {'slug': 'developer',    'label': 'Developer',      'icon': '🏢'},
    {'slug': 'architect',    'label': 'Architect',      'icon': '📐'},
    {'slug': 'shop_owner',   'label': 'Shop Owner',     'icon': '🏪'},
  ];

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: AppDim.sm,
    runSpacing: AppDim.sm,
    children: _roles.map((r) {
      final sel = selected == r['slug'];
      return GestureDetector(
        onTap: () => onSelect(r['slug']!),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: sel ? AppColors.primary : AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(AppDim.radiusFull),
            border: Border.all(
                color: sel ? AppColors.primary : AppColors.border,
                width: sel ? 2 : 1),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(r['icon']!, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 6),
            Text(r['label']!,
                style: AppText.labelMd.copyWith(
                    color: sel ? Colors.white : AppColors.textPrimary,
                    fontWeight: sel ? FontWeight.w600 : FontWeight.w400)),
          ]),
        ),
      );
    }).toList(),
  );
}
