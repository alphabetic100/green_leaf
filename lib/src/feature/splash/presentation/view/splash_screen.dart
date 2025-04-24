import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:green_leaf/src/core/common/widgets/common_bottom_text.dart';
import 'package:green_leaf/src/core/utils/constants/asset_constants/image_path.dart';
import 'package:green_leaf/src/feature/splash/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  static const String routeName = "/";
  final SplashScreenController controller = Get.find<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(ImagePath.appLogo),
          Spacer(),
          CommonBottomText(),
          SizedBox(height: 20, width: double.maxFinite),
        ],
      ),
    );
  }
}
