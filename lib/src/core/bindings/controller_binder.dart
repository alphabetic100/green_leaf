import 'package:get/get.dart';
import 'package:green_leaf/src/feature/splash/controller/splash_screen_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(
      () => SplashScreenController(),
      fenix: true,
    );
  }
}
