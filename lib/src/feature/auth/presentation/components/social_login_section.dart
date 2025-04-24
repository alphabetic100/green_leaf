import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_leaf/src/core/utils/constants/asset_constants/icon_paths.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildSocialButton(IconPaths.googleIcon, () {}),
        const SizedBox(width: 20),
        _buildSocialButton(IconPaths.facebookIcon, () {}),
        const SizedBox(width: 20),
        _buildSocialButton(IconPaths.mircrosoftIcon, () {}),
        const SizedBox(width: 20),
        _buildSocialButton(IconPaths.appleIcon, () {}),
      ],
    );
  }

  Widget _buildSocialButton(String imagePath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        imagePath,
        width: 50,
        height: 50,
        semanticsLabel: 'My SVG Picture',
      ),
    );
  }
}
