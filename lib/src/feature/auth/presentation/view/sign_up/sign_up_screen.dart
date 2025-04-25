import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf/src/core/common/widgets/common_bottom_text.dart';
import 'package:green_leaf/src/core/common/widgets/custom_button.dart';
import 'package:green_leaf/src/core/common/widgets/custom_text_field.dart';
import 'package:green_leaf/src/core/utils/constants/colors/app_colors.dart';
import 'package:green_leaf/src/core/utils/constants/extension/text_style_extension.dart';
import 'package:green_leaf/src/core/utils/constants/text_style/text_style.dart';
import 'package:green_leaf/src/core/utils/sizer/app_sizer.dart';
import 'package:green_leaf/src/core/utils/validators/text_field_validator.dart';
import 'package:green_leaf/src/feature/auth/controller/sign_up_controller.dart';
import 'package:green_leaf/src/feature/auth/presentation/components/contry_code_dropdown.dart';
import 'package:green_leaf/src/feature/auth/presentation/components/social_login_section.dart';
import 'package:green_leaf/src/feature/auth/presentation/view/sign_in/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static const String routeName = "/sign-up";
  final SignUpController controller = Get.put(SignUpController());
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(33)),
          child: SingleChildScrollView(
            child: Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getHeight(40)),
                  Text("Sign Up", style: AppTextStyles.heading),
                  Text(
                    "Let’s save environment together",
                    style: AppTextStyles.subtitle.withColor(
                      AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: AppSizes.height * 0.1),
                  Text("Name", style: AppTextStyles.formLabel),

                  CustomTextField(
                    hintText: "e.g: alphabetic10",
                    validator: TextFieldValidator.validateField,
                    controller: controller.userName,
                  ),
                  SizedBox(height: getHeight(20)),

                  Text("Phone Number", style: AppTextStyles.formLabel),
                  CustomTextField(
                    controller: controller.phone,
                    keyboardType: TextInputType.numberWithOptions(),
                    hintText: "17XXXXXXXX",
                    validator: TextFieldValidator.validatePhone,
                    prefix: SizedBox(
                      height: 20,
                      child: CountryCodeDropdown(onChanged: (code) {
                        controller.code = code;
                      }),
                    ),
                  ),
                  SizedBox(height: getHeight(20)),

                  Text("Email", style: AppTextStyles.formLabel),
                  CustomTextField(
                    hintText: "example@gmail.com",
                    validator: TextFieldValidator.validateEmail,
                    controller: controller.email,
                  ),

                  SizedBox(height: getHeight(20)),
                  Text("Password", style: AppTextStyles.formLabel),
                  CustomTextField(
                    hintText: "********",
                    isPasswordField: true,
                    validator: TextFieldValidator.passwordValidator,
                    controller: controller.password,
                  ),

                  SizedBox(height: getHeight(20)),
                  Text("Confirm Password", style: AppTextStyles.formLabel),
                  CustomTextField(
                    hintText: "********",
                    isPasswordField: true,
                    controller: controller.confirmPassword,
                    validator: (value) {
                      if (value == null) {
                        return "Confirm your password";
                      } else if (controller.confirmPassword.text !=
                          controller.password.text) {
                        return "Passwords do not match";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: getHeight(40)),
                  SizedBox(
                    width: double.maxFinite,
                    child: CustomButton(
                      text: "Sign Up",
                      onPressed: () {
                        if (formState.currentState!.validate()) {
                          controller.signUp();
                        }
                      },
                      child: Obx(
                        () =>
                            controller.isLoading.isTrue
                                ? SizedBox(
                                  width: getWidth(45),
                                  child: CupertinoActivityIndicator(
                                    color: AppColors.white,
                                  ),
                                )
                                : Text(
                                  "Sing Up",
                                  style: AppTextStyles.buttonText.withWeight(
                                    FontWeight.bold,
                                  ),
                                ),
                      ),
                    ),
                  ),

                  SizedBox(height: getHeight(20)),
                  Center(
                    child: Text(
                      "Or Sign up with",
                      style: AppTextStyles.smallText,
                    ),
                  ),

                  SizedBox(height: getHeight(20)),
                  SocialLoginSection(),
                  SizedBox(height: AppSizes.height * 0.03),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: AppTextStyles.smallText,
                          ),
                          TextSpan(
                            text: "Sign In",
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.offNamed(SignInScreen.routeName);
                                  },
                            style: AppTextStyles.linkText.withWeight(
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.height * 0.05),
                  Center(child: CommonBottomText()),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
