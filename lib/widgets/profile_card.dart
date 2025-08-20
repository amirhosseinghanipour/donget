import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_icons.dart';
import '../models/user.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  const ProfileCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _buildCardBackground(),
        _buildAvatar(),
      ],
    );
  }

  Widget _buildCardBackground() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: AppDimensions.profileCardTopMargin),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusXL),
      ),
      child: Stack(
        children: [
          _buildCardContent(),
          _buildDecorativeVectors(),
          _buildRightVector(),
        ],
      ),
    );
  }

  Widget _buildCardContent() {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimensions.profileCardTopPadding,
        bottom: AppDimensions.profileCardBottomPadding,
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.spacingM),
            Text(user.name, style: AppTextStyles.headingMedium),
            const SizedBox(height: AppDimensions.spacingS),
            Text(user.email, style: AppTextStyles.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildDecorativeVectors() {
    return Positioned(
      top: 0,
      left: 19,
      child: Image.asset(AppIcons.leftVector),
    );
  }

  Widget _buildRightVector() {
    return Positioned(
      bottom: 0,
      right: 17,
      child: Image.asset(AppIcons.rightVectorSmall),
    );
  }

  Widget _buildAvatar() {
    return Positioned(
      top: 0,
      child: Stack(
        children: [
          _buildAvatarContainer(),
          _buildEditButton(),
        ],
      ),
    );
  }

  Widget _buildAvatarContainer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.cardBackground,
          width: AppDimensions.avatarBorderWidth,
        ),
        shape: BoxShape.circle,
      ),
      child: const CircleAvatar(
        radius: AppDimensions.avatarRadius,
        backgroundImage: AssetImage(AppIcons.avatar),
      ),
    );
  }

  Widget _buildEditButton() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusXXL),
          splashColor: AppColors.overlayLight.withOpacity(0.3),
          highlightColor: AppColors.overlayLight.withOpacity(0.2),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.cardBackground,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(1),
            child: Image.asset(
              AppIcons.edit,
              width: AppDimensions.iconSizeXL,
              height: AppDimensions.iconSizeXL,
            ),
          ),
        ),
      ),
    );
  }
} 