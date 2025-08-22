import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_icons.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppDimensions.borderRadiusXXL),
          bottomRight: Radius.circular(AppDimensions.borderRadiusXXL),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 48,
        left: AppDimensions.spacingXL,
        right: 18,
        bottom: 13,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppIcons.logo,
            width: AppDimensions.iconSizeXXL,
            height: AppDimensions.iconSizeXXL,
          ),
          const Text("Profile", style: AppTextStyles.headingLarge),
          _buildSearchButton(),
        ],
      ),
    );
  }

  Widget _buildSearchButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusL),
        splashColor: AppColors.overlayLight.withValues(alpha: 0.3),
        highlightColor: AppColors.overlayLight.withValues(alpha: 0.2),
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingS),
          child: Image.asset(
            AppIcons.magnifier,
            width: AppDimensions.iconSizeL,
            height: AppDimensions.iconSizeL,
          ),
        ),
      ),
    );
  }
}
