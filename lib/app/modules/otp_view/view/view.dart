import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/modules/authpages/controller/controller.dart';
import 'package:hotel_app/app/modules/otp_view/controller/controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phnCotroller = Get.put(AuthPagesController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/moblile_login.svg",
                      height: 200, width: 200),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "We need to verify your phone before getting started !",
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
                      Expanded(
                        child: PinCodeTextField(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          autoDisposeControllers: false,
                          length: 6,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          controller: phnCotroller.otpController,
                          onChanged: (value) {},
                          appContext: context,
                          readOnly: controller.isTimesUp ? true : false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  controller.isTimesUp
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Didn't receive the code ?",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Text(
                                "Go Back",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('You have  '),
                            Text(
                              '${controller.start}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text('  seconds to enter the code'),
                          ],
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: controller.isloading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              phnCotroller.onOtpVerifyButton();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              "Verify",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
