import 'package:flutter/material.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/constants/extension/text_style_extension.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.text, this.onPressed, this.child});
  final String? text;
  final VoidCallback? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      child:
          child ??
          Text(
            text ?? '',
            style: AppTextStyles.buttonText.withWeight(FontWeight.bold),
          ),
    );
  }
}
