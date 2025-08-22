import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_icons.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomFloatingActionButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, AppDimensions.fabOffset),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.cardBackground,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(AppDimensions.spacingS),
        clipBehavior: Clip.antiAlias,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            splashColor: AppColors.overlaySuccess.withValues(alpha: 0.3),
            highlightColor: AppColors.overlaySuccess.withValues(alpha: 0.2),
            child: Container(
              width: AppDimensions.fabSize,
              height: AppDimensions.fabSize,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                AppIcons.navBarMainButton,
                width: AppDimensions.fabSize,
                height: AppDimensions.fabSize,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
