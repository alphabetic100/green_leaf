import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf/src/core/repo/firebase_repo.dart';
import 'package:green_leaf/src/core/service/local_service.dart';
import 'package:green_leaf/src/core/service/snackbar_service.dart';
import 'package:green_leaf/src/feature/home/presentation/view/home_screen.dart';

class SignUpController extends GetxController {
  final TextEditingController userName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  String code = "+880";
  RxBool isLoading = false.obs;
  Future<void> signUp() async {
    if (password.text != confirmPassword.text) {
      return;
    }
    try {
      isLoading.value = true;
      final response = await FirebaseRepo().signUp(
        name: userName.text.trim(),
        phone: code.trim() + phone.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
      );
      if (response != null) {
        await LocalService.saveToken(response.uid, "UID");
        await Get.offAllNamed(HomeScreen.routeName);
      } else {
        SnackbarService.show(
          title: "Error",
          message: "Something went wrong please try again",
          icon: Icons.error,
        );
      }
    } catch (error) {
      log(error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
