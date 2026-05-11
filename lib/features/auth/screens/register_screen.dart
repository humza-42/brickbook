import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../../../core/widgets/bb_button.dart';
import '../../../core/widgets/bb_text_field.dart';
import '../providers/auth_provider.dart';
import '../data/models/auth_models.dart';

class _ToggleBtn extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _ToggleBtn({required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: active ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(AppDim.radiusSm),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Sora',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: active ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    ),
  );
}

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _usePhone = false;
  bool _obscure = true;
  bool _obscure2 = true;
  String _role = '';
  int _step = 1;

  @override
  void dispose() {
    _nameCtrl.dispose(); _emailCtrl.dispose(); _phoneCtrl.dispose();
    _passCtrl.dispose(); _confirmCtrl.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _step = 2);
  }

  Future<void> _register() async {
    if (_role.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a role'), backgroundColor: AppColors.warning),
      );
      return;
    }
    final notifier = ref.read(authStateNotifierProvider.notifier);
    await notifier.register(
      name: _nameCtrl.text.trim(),
      email: _usePhone ? null : _emailCtrl.text.trim(),
      phone: _usePhone ? _phoneCtrl.text.trim() : null,
      password: _passCtrl.text,
      role: _role,
      language: 'en',
    );
    final state = ref.read(authStateNotifierProvider);
    if (state.isLoggedIn && mounted) context.go(Routes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateNotifierProvider);

    ref.listen(authStateNotifierProvider, (_, state) {
      if (state.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error!), backgroundColor: AppColors.error),
        );
        ref.read(authStateNotifierProvider.notifier).clearError();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: _step == 2
              ? () => setState(() => _step = 1)
              : () => context.pop(),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDim.pageHPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(2, (i) => Expanded(
                  child: Container(
                    height: 4,
                    margin: EdgeInsets.only(right: i == 0 ? 4 : 0, left: i == 1 ? 4 : 0),
                    decoration: BoxDecoration(
                      color: _step > i ? AppColors.primary : AppColors.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                )),
              ),
              const SizedBox(height: AppDim.xl),
              Text(
                _step == 1 ? 'Create Account' : 'What\'s your role?',
                style: AppText.displaySm,
              ),
              const SizedBox(height: 6),
              Text(
                _step == 1
                    ? 'Start tracking your construction expenses'
                    : 'This helps us customize your experience',
                style: AppText.bodyMd.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppDim.xxl),
              if (_step == 1) _buildStep1() else _buildStep2(authState),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep1() => Form(
    key: _formKey,
    child: Column(
      children: [
        BBTextField(
          controller: _nameCtrl,
          label: 'Full Name',
          hint: 'Muhammad Ali',
          prefixIcon: Icons.person_outline,
          validator: (v) => (v == null || v.isEmpty) ? 'Name is required' : null,
        ),
        const SizedBox(height: AppDim.base),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(AppDim.radiusMd),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(children: [
            _ToggleBtn(label: 'Email', active: !_usePhone, onTap: () => setState(() => _usePhone = false)),
            _ToggleBtn(label: 'Phone', active: _usePhone, onTap: () => setState(() => _usePhone = true)),
          ]),
        ),
        const SizedBox(height: AppDim.base),
        if (!_usePhone)
          BBTextField(
            controller: _emailCtrl,
            label: 'Email',
            hint: 'you@example.com',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email_outlined,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Email is required';
              if (!v.contains('@')) return 'Enter a valid email';
              return null;
            },
          )
        else
          BBTextField(
            controller: _phoneCtrl,
            label: 'Phone Number',
            hint: '+923001234567',
            keyboardType: TextInputType.phone,
            prefixIcon: Icons.phone_outlined,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Phone is required';
              if (v.length < 10) return 'Invalid number';
              return null;
            },
          ),
        const SizedBox(height: AppDim.base),
        BBTextField(
          controller: _passCtrl,
          label: 'Password',
          hint: 'Min. 8 characters',
          obscureText: _obscure,
          prefixIcon: Icons.lock_outline,
          suffixIcon: _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          onSuffixTap: () => setState(() => _obscure = !_obscure),
          validator: (v) {
            if (v == null || v.isEmpty) return 'Password is required';
            if (v.length < 8) return 'At least 8 characters';
            return null;
          },
        ),
        const SizedBox(height: AppDim.base),
        BBTextField(
          controller: _confirmCtrl,
          label: 'Confirm Password',
          hint: '••••••••',
          obscureText: _obscure2,
          prefixIcon: Icons.lock_outline,
          suffixIcon: _obscure2 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          onSuffixTap: () => setState(() => _obscure2 = !_obscure2),
          validator: (v) {
            if (v != _passCtrl.text) return 'Passwords do not match';
            return null;
          },
        ),
        const SizedBox(height: AppDim.xxl),
        BBButton(label: 'Continue', onPressed: _nextStep),
        const SizedBox(height: AppDim.xl),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Already have an account? ", style: AppText.bodyMd.copyWith(color: AppColors.textSecondary)),
          GestureDetector(
            onTap: () => context.go(Routes.login),
            child: Text('Sign In', style: AppText.bodyMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600)),
          ),
        ]),
      ],
    ),
  );

  Widget _buildStep2(AuthState authState) => Column(
    children: [
      ...kUserRoles.map((role) => _RoleCard(
        role: role,
        selected: _role == role['slug'],
        onTap: () => setState(() => _role = role['slug']!),
      )),
      const SizedBox(height: AppDim.xxl),
      BBButton(
        label: 'Create Account',
        isLoading: authState.isLoading,
        onPressed: _register,
      ),
    ],
  );
}

class _RoleCard extends StatelessWidget {
  final Map<String, String> role;
  final bool selected;
  final VoidCallback onTap;
  const _RoleCard({required this.role, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: AppDim.sm),
      padding: const EdgeInsets.symmetric(horizontal: AppDim.base, vertical: AppDim.md),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary.withOpacity(0.06) : AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.radiusMd),
        border: Border.all(
          color: selected ? AppColors.primary : AppColors.border,
          width: selected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Text(role['icon']!, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: AppDim.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(role['en']!, style: AppText.labelLg),
                Text(role['desc']!, style: AppText.caption),
              ],
            ),
          ),
          if (selected)
            Container(
              width: 22, height: 22,
              decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
              child: const Icon(Icons.check_rounded, color: Colors.white, size: 14),
            )
          else
            Container(
              width: 22, height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.border, width: 2),
              ),
            ),
        ],
      ),
    ),
  );
}
