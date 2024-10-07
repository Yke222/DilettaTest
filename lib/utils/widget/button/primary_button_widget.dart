import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wishlist/config/theme/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    required this.name,
    required this.onPressed,
    this.paddingHorizontal = 16,
    this.loading = false,
    super.key,
  });

  final String name;
  final void Function() onPressed;
  final bool loading;
  final double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        child: loading
            ? LoadingAnimationWidget.waveDots(
                size: 20,
                color: AppColors.textPrimary,
              )
            : Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
      ),
    );
  }
}
