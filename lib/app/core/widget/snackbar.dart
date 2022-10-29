import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackbar(String message) {
  return Get.snackbar(
    'Error',
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
    snackStyle: SnackStyle.FLOATING,
    animationDuration: const Duration(milliseconds: 500),
    barBlur: 20,
    duration: const Duration(seconds: 3),
    icon: const Icon(
      Icons.error,
      color: Colors.white,
    ),
    shouldIconPulse: true,
    mainButton: TextButton(
      onPressed: () {},
      child: const Text(
        'UNDO',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
