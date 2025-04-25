import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/constants/extension/text_style_extension.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
    this.prefix,
    this.isPasswordField = false,
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
  final bool isPasswordField;
  final TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPasswordField ? _obscureText : false,
      obscuringCharacter: '*',
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      style: AppTextStyles.smallText
          .withWeight(FontWeight.w500)
          .withColor(AppColors.textPrimary),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        hintText: widget.hintText,
        hintStyle: AppTextStyles.smallText.withWeight(FontWeight.w500),
        suffixIconConstraints: const BoxConstraints(
          minHeight: 20,
          minWidth: 20,
        ),

        suffixIcon:
            widget.isPasswordField
                ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                  ),
                )
                : widget.suffixIcon,
        // prefix: widget.prefix,
        prefixIcon: widget.prefix,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
