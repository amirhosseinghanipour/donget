import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_icons.dart';
import '../models/user.dart';

class InfoCards extends StatelessWidget {
  final User user;

  const InfoCards({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.infoCardHeight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            _buildPackageCard(),
            _buildExpiryCard(),
            _buildUidCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageCard() {
    return _InfoCard(
      backgroundColor: AppColors.warning,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Packages", style: AppTextStyles.infoCardLabel),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.circle,
                size: AppDimensions.iconSizeXS,
                color: Color(0xFF2E354D),
              ),
              const SizedBox(width: AppDimensions.spacingSS),
              Text(user.package, style: AppTextStyles.infoCardValue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpiryCard() {
    return _InfoCard(
      backgroundColor: AppColors.success,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Expires On", style: AppTextStyles.infoCardLabel),
          Text(user.expiryDate, style: AppTextStyles.infoCardValue),
        ],
      ),
    );
  }

  Widget _buildUidCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _copyUidToClipboard(context),
          splashColor: Colors.white.withOpacity(0.2),
          highlightColor: Colors.white.withOpacity(0.1),
          child: Container(
            margin: const EdgeInsets.only(right: AppDimensions.spacingXL),
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.infoCardHorizontalPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "UID (Referral Code)",
                  style: AppTextStyles.uidLabel,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppIcons.copy,
                      width: AppDimensions.iconSizeS,
                      height: AppDimensions.iconSizeS,
                    ),
                    const SizedBox(width: AppDimensions.spacingS),
                    Text(user.uid, style: AppTextStyles.uidValue),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _copyUidToClipboard(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: user.uid));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'UID copied to clipboard: ${user.uid}',
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
          ),
        ),
      );
    }
  }
}

class _InfoCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;

  const _InfoCard({required this.backgroundColor, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: AppDimensions.spacingXL),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusM),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.infoCardHorizontalPadding,
      ),
      child: child,
    );
  }
}
