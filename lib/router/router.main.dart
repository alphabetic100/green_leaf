part of 'router.dart';

class AppRoutes {
  AppRoutes._();
  static AppRoutes instance = AppRoutes._();
  List<GetPage> routes = [
    GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
    GetPage(name: SignInScreen.routeName, page: () => const SignInScreen()),
    GetPage(name: SignUpScreen.routeName, page: () => const SignUpScreen()),
    GetPage(
      name: ForgotPasswordScreen.routeName,
      page: () => const ForgotPasswordScreen(),
    ),
  ];
}
