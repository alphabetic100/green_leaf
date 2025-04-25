import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarService {
  static void show({
    required String title,
    required String message,
    required IconData icon,
    Color? iconColor,
  }) {
    Get.snackbar(
      title,
      message,
      icon: Icon(icon, color: iconColor ?? Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }
}
