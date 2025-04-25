import 'package:flutter/material.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/constants/extension/text_style_extension.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
    this.prefix,
    this.obscureText = false,
    this.hintText,
    this.validator,
    this.keyboardType,
  });
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;
  final String? Function(String? value)? validator;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      style: AppTextStyles.smallText
          .withWeight(FontWeight.w500)
          .withColor(AppColors.textPrimary),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        hintText: hintText,
        hintStyle: AppTextStyles.smallText.withWeight(FontWeight.w500),
        suffixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 20),
        suffixIcon: suffixIcon,
        // /  prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 20),
        prefixIcon: prefix,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
