part of 'router.dart';

class AppRoutes {
  AppRoutes._();
  static AppRoutes instance = AppRoutes._();
  List<GetPage> routes = [
    GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
    GetPage(name: SignInScreen.routeName, page: () => SignInScreen()),
    GetPage(name: SignUpScreen.routeName, page: () => SignUpScreen()),
    GetPage(
      name: ForgotPasswordScreen.routeName,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: OtpVerificationScreen.routeName,
      page: () => OtpVerificationScreen(),
      arguments: "email",
    ),

    GetPage(
      name: ResetPasswordScreen.routeName,
      page: () => ResetPasswordScreen(),
    ),
    GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
  ];
}
