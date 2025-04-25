import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:green_leaf/src/core/repo/firebase_repo.dart';
import 'package:green_leaf/src/feature/home/presentation/view/home_screen.dart';

class SignInController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> logIn() async {
    isLoading.value = true;
    try {
      isLoading.value = true;
      final response = await FirebaseRepo().signIn(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      if (response!.uid.isNotEmpty) {
        Get.offAllNamed(HomeScreen.routeName);
      } else {}
    } catch (error) {
      log(error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
