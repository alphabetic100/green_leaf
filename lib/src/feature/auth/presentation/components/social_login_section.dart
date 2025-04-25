import 'package:flutter/material.dart';
import 'package:green_leaf/src/core/utils/constants/asset_constants/icon_paths.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(IconPaths.googleIcon, () {}),
        SizedBox(width: getWidth(25)),
        _buildSocialButton(IconPaths.facebookIcon, () {}),
        SizedBox(width: getWidth(25)),
        _buildSocialButton(IconPaths.mircrosoftIcon, () {}),
        SizedBox(width: getWidth(25)),
        _buildSocialButton(IconPaths.appleIcon, () {}),
      ],
    );
  }

  Widget _buildSocialButton(String imagePath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(15),
              blurRadius: 5,
              spreadRadius: 7,
            ),
          ],
        ),
        child: Image.asset(imagePath),
      ),
    );
  }
}
