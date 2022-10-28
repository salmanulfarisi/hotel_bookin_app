import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/data/models/authentication/otp/otp_model.dart';
import 'package:hotel_app/app/data/models/authentication/otp/otp_response_model.dart';
import 'package:hotel_app/app/data/services/register_service/phone_services.dart';

class OtpController extends GetxController {
  bool isloading = false.obs();
  bool isTimesUp = false.obs();
  String hash = "";
  Timer? timer;
  int start = 40;
  String buttonName = "Send";
  TextEditingController otpController = TextEditingController();
  @override
  void onInit() {
    otpController = TextEditingController();
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    otpController.clear();
    timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer timer) {
      if (start == 0) {
        timer.cancel();
        isTimesUp = true.obs();
        buttonName = "Resend";
      } else {
        start = start - 1;
      }
    });
    update();
  }

  Future<void> onOtpVerifyButton() async {
    isloading = true.obs();
    final otp = otpController.text.trim();
    final data = OtpModel(hash: hash, otp: otp);
    OtpResponseModel? otpResponse = await PhoneNumberService().otpverify(data);
    if (otpResponse == null) {
      Get.snackbar('Error', "Something went wrong");
      isLoadingFalse();
      return;
    } else if (otpResponse.created == true) {
      isLoadingFalse();
      Get.snackbar('Success', otpResponse.message ?? "Something went wrong");
    } else {
      Get.snackbar('Error', otpResponse.message ?? "Something went wrong");
      isLoadingFalse();
      return;
    }
  }

  // make isloading false
  void isLoadingFalse() {
    isloading = false.obs();
  }
}
