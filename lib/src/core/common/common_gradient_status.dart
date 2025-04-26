import 'package:flutter/material.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';

class CommonGradientStatus extends StatelessWidget {
  const CommonGradientStatus({
    super.key,
    required this.status,
    required this.isIcon,
  });
  final String status;
  final bool isIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(10),
        vertical: getHeight(4),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            Color(0xFF42D58B),
            Color(0xFF65D49C),
            Color(0xFF2DF28F),
          ],
        ),
      ),
      child: Row(
        children: [
          if (isIcon) ...[Icon(Icons.arrow_drop_down, color: AppColors.white)],
          Text(status, style: AppTextStyles.buttonText),
        ],
      ),
    );
  }
}
