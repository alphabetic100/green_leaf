import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:green_leaf/src/core/common/widgets/common_bottom_text.dart';
import 'package:green_leaf/src/core/common/widgets/custom_button.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/constants/extension/text_style_extension.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';
import 'package:green_leaf/src/feature/auth/presentation/view/forgot_password/reset_password_screen.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key});
  static String routeName = "/otp-verification-screen";
  final email = Get.arguments;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xFFADADAD)),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xFFADADAD)),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(33)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getHeight(40)),
              Text("Verify OTP", style: AppTextStyles.heading),
              Text(
                "Recover your account in easy steps",
                style: AppTextStyles.subtitle.withColor(AppColors.textPrimary),
              ),
              SizedBox(height: AppSizes.height * 0.15),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "An email has been sent to ",
                      style: AppTextStyles.smallText,
                    ),
                    TextSpan(
                      text: email,
                      style: AppTextStyles.formLabel
                          .copyWith(fontSize: getWidth(16))
                          .withWeight(FontWeight.bold),
                    ),
                    TextSpan(
                      text: " Please enter the sent OTP.",
                      style: AppTextStyles.smallText,
                    ),
                  ],
                ),
              ),
              SizedBox(height: getHeight(20)),
              SizedBox(
                width: double.maxFinite,
                child: Pinput(
                  length: 4,
                  controller: TextEditingController(),
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  showCursor: true,
                  onCompleted: (String pin) {
                    log('Completed OTP is: $pin');
                  },
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.maxFinite,
                child: CustomButton(
                  text: "Verify OTP",
                  onPressed: () {
                    Get.toNamed(ResetPasswordScreen.routeName);
                  },
                ),
              ),
              Spacer(),
              Center(child: CommonBottomText()),
              SizedBox(height: getHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
