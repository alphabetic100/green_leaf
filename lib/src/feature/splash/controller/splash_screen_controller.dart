import 'package:get/get.dart';
import 'package:green_leaf/src/core/service/local_service.dart';
import 'package:green_leaf/src/feature/auth/presentation/view/sign_in/sign_in_screen.dart';
import 'package:green_leaf/src/feature/home/presentation/view/home_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    simulateLoading();
  }

  void simulateLoading() {
    bool hasToken = LocalService.hasToken();
    Future.delayed(const Duration(seconds: 2), () {
      if (hasToken) {
        Get.offAllNamed(HomeScreen.routeName);
      } else {
        Get.offAllNamed(SignInScreen.routeName);
      }
    });
  }
}
