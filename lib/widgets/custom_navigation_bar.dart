import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_icons.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onNavItemTapped;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onNavItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.cardBackground,
      shape: const CustomNotchedShape(),
      child: SizedBox(
        height: AppDimensions.navBarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildNavItem(0, AppIcons.profile, 'Profile')),
            Expanded(child: _buildNavItem(1, AppIcons.friends, 'Friends')),
            Expanded(child: _buildAddItemButton()),
            Expanded(child: _buildNavItem(3, AppIcons.search, 'Search')),
            Expanded(child: _buildNavItem(4, AppIcons.home, 'Home')),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String asset, String label) {
    final isActive = currentIndex == index;
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onNavItemTapped(index),
          splashColor: isActive
              ? Colors.transparent
              : AppColors.overlayLight.withValues(alpha: 0.2),
          highlightColor: isActive
              ? Colors.transparent
              : AppColors.overlayLight.withValues(alpha: 0.1),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.spacingS,
              horizontal: AppDimensions.spacingS,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  asset,
                  width: AppDimensions.iconSizeM,
                  height: AppDimensions.iconSizeM,
                  color: isActive ? AppColors.textPrimary : AppColors.textMuted,
                ),
                const SizedBox(height: AppDimensions.spacingXS),
                Text(
                  label,
                  style: isActive
                      ? AppTextStyles.navLabelActive
                      : AppTextStyles.navLabel,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddItemButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: AppDimensions.addItemButtonTopSpacing),
        const Text('Add Item', style: AppTextStyles.caption),
      ],
    );
  }
}

class CustomNotchedShape extends NotchedShape {
  const CustomNotchedShape();

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) {
      return Path()..addRect(host);
    }

    final fabRadius = guest.width / 4.0;
    final notchWidth = fabRadius * 2;
    final notchDepth = fabRadius;
    final center = guest.center;

    final path = Path()..moveTo(host.left, host.top);

    // left straight part before curve
    path.lineTo(center.dx - notchWidth * 1.5, host.top);

    // left curve inward
    path.cubicTo(
      center.dx - notchWidth * 0.6,
      host.top,
      center.dx - notchWidth * 0.8,
      host.top - notchDepth,
      center.dx,
      host.top - notchDepth,
    );

    // right curve
    path.cubicTo(
      center.dx + notchWidth * 0.8,
      host.top - notchDepth,
      center.dx + notchWidth * 0.6,
      host.top,
      center.dx + notchWidth * 1.5,
      host.top,
    );

    // rest of nav bar
    path.lineTo(host.right, host.top);
    path.lineTo(host.right, host.bottom);
    path.lineTo(host.left, host.bottom);

    path.close();
    return path;
  }
}
