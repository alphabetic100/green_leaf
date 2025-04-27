import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:green_leaf/src/core/service/local_service.dart';
import 'package:green_leaf/src/core/service/snackbar_service.dart';
import 'package:green_leaf/src/core/service/social_login_service.dart';
import 'package:green_leaf/src/feature/home/presentation/view/home_screen.dart';

class SocialLoginController extends GetxController {
  Future<void> loginWithGoogle() async {
    try {
      final user = await GoogleSignInService.signInWithGoogle();

      if (user != null && user.uid.isNotEmpty) {
        await LocalService.saveToken(user.uid, "OAuth");
        Get.offAllNamed(HomeScreen.routeName);
      } else {
        SnackbarService.show(
          title: "Error",
          message: "Something went wrong, please try again",
          icon: Icons.error,
        );
      }
    } catch (e) {
      SnackbarService.show(
        title: "Error",
        message: "Something went wrong, please try again",
        icon: Icons.error,
      );
      log(e.toString());
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      final user = FacebookLoginService().login();
    } catch (error) {
      SnackbarService.show(
        title: "Error",
        message: "Something went wrong, please try again",
        icon: Icons.error,
      );
      log(error.toString());
    }
  }
}
