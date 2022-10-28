import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/data/models/authentication/otp/otp_model.dart';
import 'package:hotel_app/app/data/models/authentication/otp/otp_response_model.dart';
import 'package:hotel_app/app/data/models/authentication/phone_number/phone_number_model.dart';
import 'package:hotel_app/app/data/models/authentication/phone_number/phone_number_respone_model.dart';
import 'package:hotel_app/app/data/services/register_service/phone_services.dart';
import 'package:hotel_app/app/routes/app_pages.dart';

class AuthPagesController extends GetxController {
  int start = 40;
  var wait = false.obs;
  String buttonName = "Send";
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String hash = "";
  var isloading = false.obs;
  var isTimesUp = false.obs;
  Timer? timer;
  String verificationIdFinal = "";
  String smsCode = "";
  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    otpController = TextEditingController();
  }

  @override
  void onClose() {
    phoneController.dispose();
    // otpController.clear();
    super.onClose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      if (start == 0) {
        isTimesUp.value = true.obs();
        timer.cancel();
        buttonName = "Resend";
        wait.value = false.obs();
        start = 40;
      } else {
        start--;
      }
    });
    update();
  }

  // this function is used to send otp to the user
  Future<void> onGetOtpButton() async {
    if (formKey.currentState!.validate()) {
      isloading.value = true;
      final phoneNumber = phoneController.text.trim();
      final data = PhoneNumberModel(phoneNumber: phoneNumber);
      PhoneNumberResponseModel? response =
          await PhoneNumberService().phoneNumberVerify(data);
      if (response == null) {
        Get.snackbar("Error", "Something went wrong");
        isLoadingFalse();
        return;
      } else if (response.success == true) {
        hash = response.hash ?? '';

        Get.toNamed(Routes.OTP_VIEW);
        isLoadingFalse();
      } else {
        Get.snackbar("Error", response.message ?? "Something went wrong");
        isLoadingFalse();
        return;
      }
    }
  }

  // make isloading false
  void isLoadingFalse() {
    isloading.value = false.obs();
  }

  // validate mobile number
  String? phoneNumberValidator(String? fieldContent) {
    if (fieldContent == null || fieldContent.isEmpty) {
      return 'Please enter your mobile number';
    } else if (!RegExp(
            r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
        .hasMatch(fieldContent)) {
      return 'Enter a valid mobile number';
    }
    return null;
  }

  Future<void> onOtpVerifyButton() async {
    isloading.value = true.obs();
    final otp = otpController.text.trim();
    log('========$hash ,$otp');
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
}
