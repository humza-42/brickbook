import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/widgets/bb_button.dart';
import '../../../core/widgets/bb_text_field.dart';
import '../providers/vendor_providers.dart';
import '../data/models/vendor_models.dart';
import '../../expenses/providers/expense_providers.dart';

class AddVendorScreen extends ConsumerStatefulWidget {
  final VendorModel? editVendor;
  const AddVendorScreen({super.key, this.editVendor});

  @override
  ConsumerState<AddVendorScreen> createState() => _AddVendorScreenState();
}

class _AddVendorScreenState extends ConsumerState<AddVendorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl    = TextEditingController();
  final _phoneCtrl   = TextEditingController();
  final _emailCtrl   = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _notesCtrl   = TextEditingController();
  String? _categoryId;

  bool get _isEdit => widget.editVendor != null;

  @override
  void initState() {
    super.initState();
    final v = widget.editVendor;
    if (v != null) {
      _nameCtrl.text    = v.name;
      _phoneCtrl.text   = v.phone ?? '';
      _emailCtrl.text   = v.email ?? '';
      _addressCtrl.text = v.address ?? '';
      _notesCtrl.text   = v.notes ?? '';
      _categoryId       = v.categoryId;
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose(); _phoneCtrl.dispose(); _emailCtrl.dispose();
    _addressCtrl.dispose(); _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(vendorFormNotifierProvider.notifier).save({
      'name':        _nameCtrl.text.trim(),
      'phone':       _phoneCtrl.text.trim().isEmpty ? null : _phoneCtrl.text.trim(),
      'email':       _emailCtrl.text.trim().isEmpty ? null : _emailCtrl.text.trim(),
      'address':     _addressCtrl.text.trim().isEmpty ? null : _addressCtrl.text.trim(),
      'notes':       _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
      'category_id': _categoryId,
    }, editId: widget.editVendor?.id);

    final state = ref.read(vendorFormNotifierProvider);
    if (state.isSaved && mounted) {
      ref.read(vendorFormNotifierProvider.notifier).reset();
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state      = ref.watch(vendorFormNotifierProvider);
    final categories = ref.watch(expenseCategoriesProvider);

    ref.listen(vendorFormNotifierProvider, (_, s) {
      if (s.error != null) ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(s.error!), backgroundColor: AppColors.error));
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(_isEdit ? 'Edit Vendor' : 'Add Vendor'),
        leading: IconButton(icon: const Icon(Icons.close_rounded), onPressed: () => context.pop()),
      ),
      body: Form(key: _formKey, child: ListView(
        padding: const EdgeInsets.all(AppDim.pageHPadding),
        children: [
          BBTextField(controller: _nameCtrl, label: 'Business Name',
              hint: 'e.g. Ali Traders', prefixIcon: Icons.store_outlined,
              validator: (v) => (v == null || v.isEmpty) ? 'Name is required' : null),
          const SizedBox(height: AppDim.base),

          Text('Primary Category (optional)',
              style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 8),
          categories.when(
            data: (cats) => SizedBox(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: cats.length + 1,
                separatorBuilder: (_, __) => const SizedBox(width: 6),
                itemBuilder: (_, i) {
                  if (i == 0) {
                    return GestureDetector(
                      onTap: () => setState(() => _categoryId = null),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        width: 56,
                        decoration: BoxDecoration(
                          color: _categoryId == null
                              ? AppColors.primary.withOpacity(0.1)
                              : AppColors.surfaceVariant,
                          borderRadius: BorderRadius.circular(AppDim.radiusMd),
                          border: Border.all(
                              color: _categoryId == null ? AppColors.primary : AppColors.border,
                              width: _categoryId == null ? 2 : 1),
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                          const Text('🏢', style: TextStyle(fontSize: 20)),
                          const SizedBox(height: 3),
                          Text('Any', style: TextStyle(fontFamily: 'Sora', fontSize: 9,
                              fontWeight: FontWeight.w600,
                              color: _categoryId == null ? AppColors.primary : AppColors.textSecondary)),
                        ]),
                      ),
                    );
                  }
                  final cat = cats[i - 1];
                  final sel = _categoryId == cat.id;
                  final color = cat.colorHex != null
                      ? Color(int.parse('FF${cat.colorHex}', radix: 16))
                      : AppColors.primary;
                  return GestureDetector(
                    onTap: () => setState(() => _categoryId = cat.id),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: 64,
                      decoration: BoxDecoration(
                        color: sel ? color.withOpacity(0.1) : AppColors.surfaceVariant,
                        borderRadius: BorderRadius.circular(AppDim.radiusMd),
                        border: Border.all(color: sel ? color : AppColors.border, width: sel ? 2 : 1),
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(cat.icon, style: const TextStyle(fontSize: 20)),
                        const SizedBox(height: 3),
                        Text(cat.nameEn.split(' ').first,
                            style: TextStyle(fontFamily: 'Sora', fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: sel ? color : AppColors.textSecondary),
                            textAlign: TextAlign.center,
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                      ]),
                    ),
                  );
                },
              ),
            ),
            loading: () => const SizedBox(height: 70),
            error: (_, __) => const SizedBox.shrink(),
          ),
          const SizedBox(height: AppDim.base),

          BBTextField(controller: _phoneCtrl, label: 'Phone (optional)',
              hint: '+923001234567', keyboardType: TextInputType.phone,
              prefixIcon: Icons.phone_outlined),
          const SizedBox(height: AppDim.base),

          BBTextField(controller: _emailCtrl, label: 'Email (optional)',
              hint: 'vendor@example.com', keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email_outlined),
          const SizedBox(height: AppDim.base),

          BBTextField(controller: _addressCtrl, label: 'Address (optional)',
              hint: 'Shop #12, Main Market, Lahore',
              prefixIcon: Icons.location_on_outlined, maxLines: 2),
          const SizedBox(height: AppDim.base),

          BBTextField(controller: _notesCtrl, label: 'Notes (optional)',
              hint: 'e.g. Always delivers on time, requires advance payment',
              maxLines: 3),
          const SizedBox(height: AppDim.xxl),

          BBButton(
            label: _isEdit ? 'Save Changes' : 'Add Vendor',
            isLoading: state.isLoading,
            onPressed: _submit,
            icon: _isEdit ? Icons.save_outlined : Icons.add_rounded,
          ),
          const SizedBox(height: AppDim.xxl),
        ],
      )),
    );
  }
}
