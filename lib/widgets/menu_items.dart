import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_icons.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(Icons.lock_outline, "Change Password"),
        const SizedBox(height: AppDimensions.spacingL),
        _buildMenuItem(Icons.logout, "Sign Out"),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusXL),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          splashColor: AppColors.overlayLight.withValues(alpha: 0.2),
          highlightColor: AppColors.overlayLight.withValues(alpha: 0.1),
          child: Container(
            padding: const EdgeInsets.only(
              left: AppDimensions.spacingM,
              right: AppDimensions.spacingXL,
              top: 7,
              bottom: AppDimensions.spacingM,
            ),
            child: Row(
              children: [
                _getMenuIcon(title),
                const SizedBox(width: AppDimensions.spacingL),
                Expanded(child: Text(title, style: AppTextStyles.bodyMedium)),
                if (_shouldShowArrow(title))
                  Image.asset(
                    AppIcons.arrowRight,
                    width: AppDimensions.iconSizeS,
                    height: AppDimensions.iconSizeS,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getMenuIcon(String title) {
    switch (title) {
      case 'Change Password':
        return Image.asset(
          AppIcons.password,
          width: AppDimensions.iconSizeXXXL,
          height: AppDimensions.iconSizeXXXL,
        );
      case 'Sign Out':
        return Image.asset(
          AppIcons.signOut,
          width: AppDimensions.iconSizeXXXL,
          height: AppDimensions.iconSizeXXXL,
        );
      default:
        return SizedBox(
          width: AppDimensions.iconSizeXXXL,
          height: AppDimensions.iconSizeXXXL,
        );
    }
  }

  bool _shouldShowArrow(String title) {
    return title == 'Change Password' || title == 'Sign Out';
  }
}
