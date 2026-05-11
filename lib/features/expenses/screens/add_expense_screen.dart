import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/widgets/bb_button.dart';
import '../../../core/widgets/bb_text_field.dart';
import '../../../core/utils/formatters.dart';
import '../providers/expense_providers.dart';
import '../data/models/expense_models.dart';

class AddExpenseScreen extends ConsumerStatefulWidget {
  final String projectId;
  final ExpenseModel? editExpense;
  const AddExpenseScreen({super.key, required this.projectId, this.editExpense});

  @override
  ConsumerState<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends ConsumerState<AddExpenseScreen> {
  final _formKey      = GlobalKey<FormState>();
  final _titleCtrl    = TextEditingController();
  final _amountCtrl   = TextEditingController();
  final _taxCtrl      = TextEditingController();
  final _notesCtrl    = TextEditingController();

  String  _categoryId     = '1';
  String  _paymentMethod  = 'cash';
  String  _paymentStatus  = 'paid';
  DateTime _date          = DateTime.now();
  final List<String> _attachmentPaths = [];
  final _picker = ImagePicker();

  // Derived
  double get _amount  => double.tryParse(_amountCtrl.text.replaceAll(',', '')) ?? 0;
  double get _tax     => double.tryParse(_taxCtrl.text) ?? 0;
  double get _total   => _amount + (_amount * _tax / 100);

  @override
  void initState() {
    super.initState();
    final e = widget.editExpense;
    if (e != null) {
      _titleCtrl.text   = e.title;
      _amountCtrl.text  = e.amount.toStringAsFixed(0);
      _notesCtrl.text   = e.notes ?? '';
      _categoryId       = e.categoryId;
      _paymentMethod    = e.paymentMethod;
      _paymentStatus    = e.paymentStatus;
      _date             = DateTime.tryParse(e.expenseDate) ?? DateTime.now();
    }
  }

  @override
  void dispose() {
    _titleCtrl.dispose(); _amountCtrl.dispose();
    _taxCtrl.dispose(); _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(colorScheme: const ColorScheme.light(primary: AppColors.primary)),
        child: child!,
      ),
    );
    if (d != null) setState(() => _date = d);
  }

  Future<void> _addPhoto(ImageSource source) async {
    if (_attachmentPaths.length >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Maximum 5 receipts allowed')),
      );
      return;
    }
    final img = await _picker.pickImage(source: source, imageQuality: 75);
    if (img != null) setState(() => _attachmentPaths.add(img.path));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_categoryId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category'), backgroundColor: AppColors.warning),
      );
      return;
    }

    await ref.read(expenseFormNotifierProvider.notifier).save(
      widget.projectId,
      {
        'title':          _titleCtrl.text.trim(),
        'amount':         _amount,
        'tax_amount':     _amount * _tax / 100,
        'total_amount':   _total,
        'category_id':    _categoryId,
        'payment_method': _paymentMethod,
        'payment_status': _paymentStatus,
        'expense_date':   _date.toIso8601String().split('T').first,
        'notes':          _notesCtrl.text.trim(),
      },
      editId: widget.editExpense?.id,
      attachmentPaths: _attachmentPaths,
    );

    final state = ref.read(expenseFormNotifierProvider);
    if (state.isSaved && mounted) {
      ref.read(expenseFormNotifierProvider.notifier).reset();
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state      = ref.watch(expenseFormNotifierProvider);
    final categories = ref.watch(expenseCategoriesProvider);
    final isEdit     = widget.editExpense != null;

    ref.listen(expenseFormNotifierProvider, (_, s) {
      if (s.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(s.error!), backgroundColor: AppColors.error),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Expense' : 'Add Expense'),
        leading: IconButton(icon: const Icon(Icons.close_rounded), onPressed: () => context.pop()),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppDim.pageHPadding),
          children: [

            // Amount hero input
            _AmountCard(
              amountCtrl: _amountCtrl,
              taxCtrl: _taxCtrl,
              total: _total,
              onChanged: () => setState(() {}),
            ),
            const SizedBox(height: AppDim.base),

            // Title
            BBTextField(
              controller: _titleCtrl,
              label: 'Title / Description',
              hint: 'e.g. 500 bags cement from Ali Traders',
              prefixIcon: Icons.drive_file_rename_outline_rounded,
              validator: (v) => (v == null || v.isEmpty) ? 'Title is required' : null,
            ),
            const SizedBox(height: AppDim.base),

            // Category
            Text('Category', style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            categories.when(
              data: (cats) => _CategoryPicker(
                categories: cats,
                selected: _categoryId,
                onSelect: (id) => setState(() => _categoryId = id),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (_, __) => _CategoryPicker(
                categories: kDefaultCategories.map((c) => ExpenseCategory(
                  id: c['id']!,
                  nameEn: c['nameEn']!,
                  nameUr: c['nameUr']!,
                  icon: c['icon']!,
                  colorHex: c['color'],
                )).toList(),
                selected: _categoryId,
                onSelect: (id) => setState(() => _categoryId = id),
              ),
            ),
            const SizedBox(height: AppDim.base),

            // Date
            GestureDetector(
              onTap: _pickDate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date', style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppDim.base, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(AppDim.radiusMd),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(children: [
                      const Icon(Icons.calendar_today_outlined, size: 18, color: AppColors.textTertiary),
                      const SizedBox(width: 10),
                      Text(Formatters.date(_date), style: AppText.bodyLg),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down_rounded, color: AppColors.textTertiary),
                    ]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDim.base),

            // Payment Method
            Text('Payment Method', style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            _PaymentMethodPicker(
              selected: _paymentMethod,
              onSelect: (m) => setState(() => _paymentMethod = m),
            ),
            const SizedBox(height: AppDim.base),

            // Payment Status
            Text('Payment Status', style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            Row(children: ['paid', 'pending', 'partial'].map((s) => Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _paymentStatus = s),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  margin: const EdgeInsets.only(right: 6),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: _paymentStatus == s
                        ? (s == 'paid' ? AppColors.success : s == 'pending' ? AppColors.warning : AppColors.info).withOpacity(0.12)
                        : AppColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(AppDim.radiusMd),
                    border: Border.all(
                      color: _paymentStatus == s
                          ? (s == 'paid' ? AppColors.success : s == 'pending' ? AppColors.warning : AppColors.info)
                          : AppColors.border,
                      width: _paymentStatus == s ? 2 : 1,
                    ),
                  ),
                  child: Text(
                    s[0].toUpperCase() + s.substring(1),
                    textAlign: TextAlign.center,
                    style: AppText.labelMd.copyWith(
                      color: _paymentStatus == s
                          ? (s == 'paid' ? AppColors.success : s == 'pending' ? AppColors.warning : AppColors.info)
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            )).toList()),
            const SizedBox(height: AppDim.base),

            // Notes
            BBTextField(
              controller: _notesCtrl,
              label: 'Notes (optional)',
              hint: 'Any additional details...',
              maxLines: 3,
            ),
            const SizedBox(height: AppDim.base),

            // Receipt photos
            _ReceiptSection(
              paths: _attachmentPaths,
              onAdd: () => _showPhotoOptions(),
              onRemove: (i) => setState(() => _attachmentPaths.removeAt(i)),
            ),

            const SizedBox(height: AppDim.xxl),
            BBButton(
              label: isEdit ? 'Save Changes' : 'Save Expense',
              isLoading: state.isLoading,
              onPressed: _submit,
              icon: Icons.save_outlined,
            ),
            const SizedBox(height: AppDim.xxl),
          ],
        ),
      ),
    );
  }

  void _showPhotoOptions() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppDim.md),
            Container(width: 40, height: 4,
                decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2))),
            const SizedBox(height: AppDim.base),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Take Photo'),
              onTap: () { Navigator.pop(context); _addPhoto(ImageSource.camera); },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from Gallery'),
              onTap: () { Navigator.pop(context); _addPhoto(ImageSource.gallery); },
            ),
            const SizedBox(height: AppDim.base),
          ],
        ),
      ),
    );
  }
}

// Amount Card
class _AmountCard extends StatelessWidget {
  final TextEditingController amountCtrl, taxCtrl;
  final double total;
  final VoidCallback onChanged;
  const _AmountCard({required this.amountCtrl, required this.taxCtrl, required this.total, required this.onChanged});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppDim.base),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.primary, AppColors.primaryLight],
      ),
      borderRadius: BorderRadius.circular(AppDim.cardRadius),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Amount', style: AppText.labelLg.copyWith(color: Colors.white70)),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Rs.', style: AppText.h3.copyWith(color: Colors.white70)),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: amountCtrl,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9,]'))],
                style: const TextStyle(fontFamily: 'Sora', fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: '0',
                  hintStyle: TextStyle(fontFamily: 'Sora', fontSize: 32, color: Colors.white38),
                  filled: false,
                  contentPadding: EdgeInsets.zero,
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Amount is required';
                  final n = double.tryParse(v.replaceAll(',', ''));
                  if (n == null || n <= 0) return 'Enter valid amount';
                  return null;
                },
                onChanged: (_) => onChanged(),
              ),
            ),
          ],
        ),
        const Divider(color: Colors.white24, height: 20),
        Row(children: [
          Expanded(
            child: Row(children: [
              Text('Tax %', style: AppText.caption.copyWith(color: Colors.white70)),
              const SizedBox(width: 8),
              SizedBox(
                width: 60,
                child: TextField(
                  controller: taxCtrl,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                  style: const TextStyle(fontFamily: 'Sora', fontSize: 14, color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none, enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none, filled: false,
                    hintText: '0', hintStyle: TextStyle(color: Colors.white38, fontSize: 14),
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (_) => onChanged(),
                ),
              ),
            ]),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('Total', style: AppText.caption.copyWith(color: Colors.white70)),
            Text(Formatters.pkr(total), style: AppText.moneySm.copyWith(color: AppColors.accentLight)),
          ]),
        ]),
      ],
    ),
  );
}

// Category Picker
class _CategoryPicker extends StatelessWidget {
  final List<ExpenseCategory> categories;
  final String selected;
  final ValueChanged<String> onSelect;
  const _CategoryPicker({required this.categories, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 84,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (_, i) {
        final cat = categories[i];
        final sel = selected == cat.id;
        final color = cat.colorHex != null
            ? Color(int.parse('FF${cat.colorHex}', radix: 16))
            : AppColors.primary;

        return GestureDetector(
          onTap: () => onSelect(cat.id),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 68,
            decoration: BoxDecoration(
              color: sel ? color.withOpacity(0.12) : AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(AppDim.radiusMd),
              border: Border.all(color: sel ? color : AppColors.border, width: sel ? 2 : 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cat.icon, style: const TextStyle(fontSize: 22)),
                const SizedBox(height: 4),
                Text(
                  cat.nameEn.split(' ').first,
                  style: TextStyle(
                    fontFamily: 'Sora', fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: sel ? color : AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

// Payment Method Picker
class _PaymentMethodPicker extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelect;
  const _PaymentMethodPicker({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) => Row(
    children: kPaymentMethods.map((m) => Expanded(
      child: GestureDetector(
        onTap: () => onSelect(m['slug']!),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.only(right: 5),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: selected == m['slug'] ? AppColors.primary : AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(AppDim.radiusSm),
            border: Border.all(
                color: selected == m['slug'] ? AppColors.primary : AppColors.border),
          ),
          child: Column(children: [
            Text(m['icon']!, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 2),
            Text(
              m['slug']!.replaceAll('_', '\n'),
              style: TextStyle(
                fontFamily: 'Sora', fontSize: 8,
                fontWeight: FontWeight.w600,
                color: selected == m['slug'] ? Colors.white : AppColors.textTertiary,
              ),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    )).toList(),
  );
}

// Receipt Photo Section
class _ReceiptSection extends StatelessWidget {
  final List<String> paths;
  final VoidCallback onAdd;
  final ValueChanged<int> onRemove;
  const _ReceiptSection({required this.paths, required this.onAdd, required this.onRemove});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Receipts / Photos', style: AppText.labelLg.copyWith(color: AppColors.textSecondary)),
          Text('${paths.length}/5', style: AppText.caption),
        ],
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 90,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            // Add photo button
            if (paths.length < 5)
              GestureDetector(
                onTap: onAdd,
                child: Container(
                  width: 80, height: 80,
                  margin: const EdgeInsets.only(right: AppDim.sm),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(AppDim.radiusMd),
                    border: Border.all(color: AppColors.border, style: BorderStyle.solid),
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Icon(Icons.add_a_photo_outlined, color: AppColors.textTertiary, size: 24),
                    const SizedBox(height: 4),
                    Text('Add', style: AppText.caption),
                  ]),
                ),
              ),
            // Photo thumbnails
            ...paths.asMap().entries.map((entry) => Stack(
              children: [
                Container(
                  width: 80, height: 80,
                  margin: const EdgeInsets.only(right: AppDim.sm),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDim.radiusMd),
                    image: DecorationImage(
                      image: FileImage(File(entry.value)),
                      fit: BoxFit.cover,
                    ),
                    color: AppColors.surfaceVariant,
                  ),
                ),
                Positioned(
                  top: 0, right: AppDim.sm,
                  child: GestureDetector(
                    onTap: () => onRemove(entry.key),
                    child: Container(
                      width: 20, height: 20,
                      decoration: const BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close_rounded, color: Colors.white, size: 12),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    ],
  );
}
