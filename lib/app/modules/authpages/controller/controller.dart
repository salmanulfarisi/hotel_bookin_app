import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPagesController extends GetxController {
  int start = 30;
  bool wait = false.obs();
  String buttonName = "Send";
  TextEditingController phoneController = TextEditingController();

  String verificationIdFinal = "";
  String smsCode = "";
  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer.periodic(onsec, (Timer t) {
      if (t.tick == 5) {
        t.cancel();
        Get.offNamed('/home');
      }
    });
  }
}
