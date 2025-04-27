import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf/src/core/repo/firebase_repo.dart';
import 'package:green_leaf/src/core/service/local_service.dart';
import 'package:green_leaf/src/core/service/snackbar_service.dart';
import 'package:green_leaf/src/feature/home/presentation/view/home_screen.dart';

class SignInController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool rememberMe = false.obs;
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  Future<void> logIn() async {
    isLoading.value = true;
    try {
      isLoading.value = true;
      final response = await FirebaseRepo().signIn(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      if (response!.uid.isNotEmpty) {
        await LocalService.saveToken(response.uid, "UID");
        Get.offAllNamed(HomeScreen.routeName);
      } else {
        SnackbarService.show(
          title: "Error",
          message: "Email or Password incorrect",
          icon: Icons.error,
        );
      }
    } catch (error) {
      SnackbarService.show(
        title: "Error",
        message: "Email or Password incorrect",
        icon: Icons.error,
      );
      log(error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
