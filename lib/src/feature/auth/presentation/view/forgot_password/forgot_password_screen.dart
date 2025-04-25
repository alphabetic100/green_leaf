import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:green_leaf/src/core/common/widgets/common_bottom_text.dart';
import 'package:green_leaf/src/core/common/widgets/custom_button.dart';
import 'package:green_leaf/src/core/common/widgets/custom_text_field.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart'
    show AppColors;
import 'package:green_leaf/src/core/utils/constants/extension/text_style_extension.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';
import 'package:green_leaf/src/core/utils/validators/text_field_validator.dart';
import 'package:green_leaf/src/feature/auth/controller/forgot_password_controller.dart';
import 'package:green_leaf/src/feature/auth/presentation/view/forgot_password/otp_verification_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  static const String routeName = "/forgot-password";
  final ForgotPasswordController controller = Get.put(
    ForgotPasswordController(),
  );
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(33)),
          child: Form(
            key: formstate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getHeight(40)),
                Text("Send OTP", style: AppTextStyles.heading),
                Text(
                  "Recover your account in easy steps",
                  style: AppTextStyles.subtitle.withColor(
                    AppColors.textPrimary,
                  ),
                ),
                Spacer(),
                Text("Email", style: AppTextStyles.formLabel),
                CustomTextField(
                  hintText: "user@example.com",
                  controller: controller.email,
                  validator: TextFieldValidator.validateEmail,
                ),
                Spacer(),
                SizedBox(
                  width: double.maxFinite,
                  child: CustomButton(
                    text: "Send OTP",
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        Get.toNamed(
                          OtpVerificationScreen.routeName,
                          arguments: controller.email.text.trim(),
                        );
                      }
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
      ),
    );
  }
}
