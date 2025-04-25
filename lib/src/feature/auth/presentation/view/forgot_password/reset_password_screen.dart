import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:green_leaf/src/core/common/widgets/common_bottom_text.dart';
import 'package:green_leaf/src/core/common/widgets/custom_button.dart';
import 'package:green_leaf/src/core/common/widgets/custom_text_field.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';
import 'package:green_leaf/src/core/utils/validators/text_field_validator.dart';
import 'package:green_leaf/src/feature/auth/presentation/view/sign_in/sign_in_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  static String routeName = "/reset-password-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(33)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getHeight(40)),
              Text("Reset Password", style: AppTextStyles.heading),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New Password", style: AppTextStyles.formLabel),
                  CustomTextField(
                    hintText: "********",
                    isPasswordField: true,
                    validator: TextFieldValidator.passwordValidator,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: getHeight(20)),
                  Text("Confirm Password", style: AppTextStyles.formLabel),

                  CustomTextField(
                    hintText: "********",
                    isPasswordField: true,
                    validator: TextFieldValidator.passwordValidator,
                    controller: TextEditingController(),
                  ),

                  SizedBox(height: getHeight(50)),
                  SizedBox(
                    width: double.maxFinite,
                    child: CustomButton(
                      text: "Reset Password",
                      onPressed: () => Get.offAllNamed(SignInScreen.routeName),
                    ),
                  ),
                ],
              ),
              Spacer(),
              CommonBottomText(),
              SizedBox(height: getHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
