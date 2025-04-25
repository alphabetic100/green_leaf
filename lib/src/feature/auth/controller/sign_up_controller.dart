import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf/src/core/repo/firebase_repo.dart';

class SignUpController extends GetxController {
  final TextEditingController userName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  RxBool isLoading = false.obs;
  Future<void> signUp() async {
    if (password.text != confirmPassword.text) {
      return;
    }
    try {
      isLoading.value = true;
      final response = await FirebaseRepo().signUp(
        name: userName.text.trim(),
        phone: phone.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
      );
      if (response != null) {
        log("success");
      } else {
        log(response!.uid);
      }
    } catch (error) {
      log(error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
