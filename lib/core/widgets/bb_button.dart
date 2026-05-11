import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_dimensions.dart';

class BBButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final double? height;

  const BBButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? (isOutlined ? Colors.transparent : AppColors.primary);
    final fg = textColor ?? (isOutlined ? AppColors.primary : Colors.white);
    final enabled = onPressed != null;

    return SizedBox(
      width: double.infinity,
      height: height ?? AppDim.btnXl,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled ? bg : AppColors.border,
          foregroundColor: enabled ? fg : AppColors.textDisabled,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDim.radiusMd),
            side: isOutlined ? BorderSide(color: enabled ? bg : AppColors.border, width: 2) : BorderSide.none,
          ),
          textStyle: AppText.btnLg,
        ),
        child: isLoading
            ? SizedBox(
                width: 22, height: 22,
                child: CircularProgressIndicator(strokeWidth: 2.5, color: fg),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: AppDim.iconMd),
                    const SizedBox(width: AppDim.sm),
                  ],
                  Text(label),
                ],
              ),
      ),
    );
  }
}
