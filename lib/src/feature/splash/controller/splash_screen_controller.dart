import 'package:get/get.dart';
import 'package:green_leaf/src/feature/auth/presentation/view/sign_in/sign_in_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    simulateLoading();
  }

  void simulateLoading() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(SignInScreen.routeName);
    });
  }
}
