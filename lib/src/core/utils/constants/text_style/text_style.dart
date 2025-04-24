import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle heading = GoogleFonts.poppins(
    fontSize: getWidth(32),
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle subtitle = GoogleFonts.inter(
    fontSize: getWidth(18),
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle formLabel = GoogleFonts.poppins(
    fontSize: getWidth(16),
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle buttonText = GoogleFonts.inter(
    fontSize: getWidth(18),
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle linkText = GoogleFonts.poppins(
    fontSize: getWidth(14),
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static TextStyle smallText = GoogleFonts.inter(
    fontSize: getWidth(14),
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle footerText = GoogleFonts.inter(
    fontSize: getWidth(14),
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
}
