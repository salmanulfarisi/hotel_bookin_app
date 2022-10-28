import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_count_down/timer_controller.dart';

class OtpController extends GetxController {
  CountdownController countdownController = CountdownController();
  TextEditingController otpController = TextEditingController();
  var messageOtpCode = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    print(await SmsAutoFill().getAppSignature);
    SmsAutoFill().listenForCode;
  }

  @override
  void onReady() {
    super.onReady();
    countdownController.start();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    otpController.dispose();
    SmsAutoFill().unregisterListener();
  }
}

  // make isloading false


