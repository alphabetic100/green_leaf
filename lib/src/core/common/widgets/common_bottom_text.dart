import 'package:flutter/material.dart';
import 'package:green_leaf/src/core/utils/constants/extension/text_style_extension.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';

class CommonBottomText extends StatelessWidget {
  const CommonBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "Powered by", style: AppTextStyles.smallText),
                TextSpan(
                  text: " M360 ICT",
                  style: AppTextStyles.linkText.withWeight(FontWeight.bold),
                ),
              ],
            ),
          );
  }
}