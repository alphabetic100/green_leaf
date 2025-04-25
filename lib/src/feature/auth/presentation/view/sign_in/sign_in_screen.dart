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
import 'package:green_leaf/src/feature/auth/controller/sign_in_controller.dart';
import 'package:green_leaf/src/feature/auth/presentation/components/social_login_section.dart';
import 'package:green_leaf/src/feature/auth/presentation/view/sign_up/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  static const String routeName = "/sign-in";
  final SignInController controller = Get.put(SignInController());
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
                  Text("Sign In", style: AppTextStyles.heading),
                  Text(
                    "Let’s save environment together",
                    style: AppTextStyles.subtitle.withColor(
                      AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: AppSizes.height * 0.15),
                  Text("Email", style: AppTextStyles.formLabel),
                  CustomTextField(
                    hintText: "example@gmail.com",
                    controller: controller.email,
                    validator: TextFieldValidator.validateEmail,
                  ),

                  SizedBox(height: getHeight(20)),
                  Text("Password", style: AppTextStyles.formLabel),
                  CustomTextField(
                    hintText: "********",
                    obscureText: true,
                    suffixIcon: Icon(CupertinoIcons.eye),
                    controller: controller.password,
                    validator: TextFieldValidator.passwordValidator,
                  ),

                  SizedBox(height: getHeight(20)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text(
                            "Remember me",
                            style: AppTextStyles.formLabel
                                .withWeight(FontWeight.w400)
                                .copyWith(fontSize: getWidth(14)),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: AppTextStyles.formLabel
                              .withColor(AppColors.primary)
                              .withWeight(FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getHeight(40)),
                  SizedBox(
                    width: double.maxFinite,
                    child: CustomButton(
                      text: "Sign In",
                      onPressed: () {
                        if (formState.currentState!.validate()) {
                          controller.logIn();
                        }
                      },
                      child: Obx(
                        () =>
                            controller.isLoading.isTrue
                                ? CircularProgressIndicator()
                                : Text(
                                  "Sing In",
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
                      "Or Sign In with",
                      style: AppTextStyles.smallText,
                    ),
                  ),

                  SizedBox(height: getHeight(20)),
                  SocialLoginSection(),
                  SizedBox(height: AppSizes.height * 0.05),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Don’t have an account? ",
                            style: AppTextStyles.smallText,
                          ),
                          TextSpan(
                            text: "Sign Up",
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(SignUpScreen.routeName);
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
