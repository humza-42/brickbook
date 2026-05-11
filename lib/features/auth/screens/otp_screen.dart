import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/router/route_names.dart';
import '../../../core/widgets/bb_button.dart';
import '../data/auth_repository.dart';

class OtpScreen extends ConsumerStatefulWidget {
  final Object? extra;
  const OtpScreen({super.key, this.extra});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final List<TextEditingController> _ctrl = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focus = List.generate(6, (_) => FocusNode());

  bool _isLoading = false;
  int _countdown = 60;
  Timer? _timer;

  String get _phone => (widget.extra as Map?)?['phone'] ?? '';
  String get _purpose => (widget.extra as Map?)?['purpose'] ?? 'register';

  @override
  void initState() {
    super.initState();
    _startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) => _focus[0].requestFocus());
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _countdown = 60);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_countdown == 0) { t.cancel(); return; }
      setState(() => _countdown--);
    });
  }

  @override
  void dispose() {
    for (final c in _ctrl) c.dispose();
    for (final f in _focus) f.dispose();
    _timer?.cancel();
    super.dispose();
  }

  String get _otp => _ctrl.map((c) => c.text).join();

  Future<void> _verify() async {
    if (_otp.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter the 6-digit code'), backgroundColor: AppColors.warning),
      );
      return;
    }
    setState(() => _isLoading = true);
    try {
      final repo = ref.read(authRepositoryProvider);
      await repo.verifyOtp(_phone, _otp);
      if (mounted) context.go(Routes.dashboard);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid code. Try again.'), backgroundColor: AppColors.error),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _resend() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.sendOtp(_phone, _purpose);
    _startTimer();
    for (final c in _ctrl) c.clear();
    _focus[0].requestFocus();
  }

  void _onDigitChanged(int index, String val) {
    if (val.isNotEmpty && index < 5) _focus[index + 1].requestFocus();
    if (val.isEmpty && index > 0) _focus[index - 1].requestFocus();
    if (index == 5 && val.isNotEmpty) _verify();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(AppDim.pageHPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDim.base),
              Container(
                width: 64, height: 64,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.sms_outlined, color: AppColors.primary, size: 32),
              ),
              const SizedBox(height: AppDim.xl),
              Text('Verify Your Phone', style: AppText.displaySm),
              const SizedBox(height: 8),
              Text.rich(TextSpan(
                text: 'We sent a 6-digit code to\n',
                style: AppText.bodyMd.copyWith(color: AppColors.textSecondary),
                children: [
                  TextSpan(
                    text: _phone,
                    style: AppText.bodyMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
                  ),
                ],
              )),
              const SizedBox(height: AppDim.xxl),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (i) => _OtpBox(
                  controller: _ctrl[i],
                  focusNode: _focus[i],
                  filled: _ctrl[i].text.isNotEmpty,
                  onChanged: (v) => _onDigitChanged(i, v),
                )),
              ),
              const SizedBox(height: AppDim.xxl),
              BBButton(label: 'Verify Code', isLoading: _isLoading, onPressed: _verify),
              const SizedBox(height: AppDim.xl),
              Center(
                child: _countdown > 0
                    ? Text.rich(TextSpan(
                        text: 'Resend code in ',
                        style: AppText.bodyMd.copyWith(color: AppColors.textSecondary),
                        children: [
                          TextSpan(
                            text: '${_countdown}s',
                            style: AppText.bodyMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ))
                    : GestureDetector(
                        onTap: _resend,
                        child: Text(
                          'Resend Code',
                          style: AppText.bodyMd.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool filled;
  final ValueChanged<String> onChanged;

  const _OtpBox({
    required this.controller,
    required this.focusNode,
    required this.filled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size.width - AppDim.pageHPadding * 2 - 40) / 6;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size * 1.1,
      decoration: BoxDecoration(
        color: filled ? AppColors.primary.withOpacity(0.08) : AppColors.surface,
        borderRadius: BorderRadius.circular(AppDim.radiusMd),
        border: Border.all(
          color: filled ? AppColors.primary : AppColors.border,
          width: filled ? 2 : 1,
        ),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: AppText.h2.copyWith(color: AppColors.primary),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: false,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: onChanged,
      ),
    );
  }
}
