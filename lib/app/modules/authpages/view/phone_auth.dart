import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/core/app_theme.dart';
import 'package:hotel_app/app/modules/authpages/controller/controller.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class PhoneAuthView extends GetView<AuthPagesController> {
  const PhoneAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter your phone number",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "We will send you a 6 digit code to verify your phone number",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                // const Text(
                //   "+91",
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(
                //   width: 10,
                // ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xff1d1d1d),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: controller.phoneController,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your phone Number",
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 17),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 19, horizontal: 8),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 15),
                          child: Text(
                            " (+91) ",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: controller.wait
                              ? null
                              : () async {
                                  if (controller.phoneController.text.length ==
                                      10) {
                                    controller.wait = true;
                                    // await controller.verifyPhone();
                                    controller.wait = false;
                                  } else {
                                    Get.snackbar(
                                      "Error",
                                      "Please enter a valid phone number",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                    );
                                  }
                                },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            child: Text(
                              controller.buttonName,
                              style: TextStyle(
                                color: controller.wait
                                    ? Colors.grey
                                    : Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
                const Text(
                  "Enter 6 digit OTP",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width - 30,
              fieldWidth: 58,
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: const Color(0xff1d1d1d),
                borderColor: Colors.white,
              ),
              style: const TextStyle(fontSize: 17, color: Colors.white),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {},
            ),
            const SizedBox(
              height: 40,
            ),
            RichText(
                text: const TextSpan(
              children: [
                TextSpan(
                  text: "Send OTP again in ",
                  style: TextStyle(fontSize: 16, color: Color(0xffff9601)),
                ),
                TextSpan(
                  text: "00:30",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
                TextSpan(
                  text: " sec ",
                  style: TextStyle(fontSize: 16, color: Color(0xffff9601)),
                ),
              ],
            )),
            const SizedBox(
              height: 150,
            ),
            InkWell(
              onTap: () {
                // authClass.signInwithPhoneNumber(
                //     verificationIdFinal, smsCode, context);
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                    color: const Color(0xffff9601),
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(
                    "Lets Go",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
