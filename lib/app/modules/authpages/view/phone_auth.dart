import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/core/app_theme.dart';
import 'package:hotel_app/app/core/widget/textfield_widget.dart';
import 'package:hotel_app/app/modules/authpages/controller/controller.dart';

class PhoneAuthView extends GetView<AuthPagesController> {
  const PhoneAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite,
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
                  const SizedBox(height: 20),
                  const Text(
                    "Phone Verification",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "We need to register your phone before getting started !",
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
                        child: Form(
                          key: controller.formKey,
                          child: TextFieldWidget(
                            hintText: 'Enter your 10 digit mobile number',
                            controller: controller.phoneController,
                            validator: controller.phoneNumberValidator,
                            keyType: const TextInputType.numberWithOptions(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         height: 1,
                  //         color: Colors.grey,
                  //         margin: const EdgeInsets.symmetric(horizontal: 12),
                  //       ),
                  //     ),
                  //     const Text(
                  //       "Enter 6 digit OTP",
                  //       style: TextStyle(fontSize: 16, color: Colors.black),
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //         height: 1,
                  //         color: Colors.grey,
                  //         margin: const EdgeInsets.symmetric(horizontal: 12),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // PinCodeTextField(
                  //   appContext: context,
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   autoDisposeControllers: false,
                  //   controller: controller.otpController,
                  //   animationDuration: const Duration(milliseconds: 300),
                  //   animationType: AnimationType.fade,
                  //   length: 6,
                  //   obscureText: false,
                  //   pinTheme: PinTheme(
                  //     shape: PinCodeFieldShape.box,
                  //     borderRadius: BorderRadius.circular(5),
                  //     fieldHeight: 50,
                  //     fieldWidth: 40,
                  //     activeFillColor: Colors.white,
                  //     inactiveFillColor: Colors.white,
                  //     activeColor: Colors.black,
                  //     inactiveColor: Colors.black,
                  //     selectedFillColor: Colors.white,
                  //     selectedColor: Colors.black,
                  //   ),
                  //   onChanged: (value) {},
                  //   readOnly: controller.isTimesUp ? true : false,
                  // ),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  // RichText(
                  //     text: TextSpan(
                  //   children: [
                  //     const TextSpan(
                  //       text: "Send OTP again in ",
                  //       style:
                  //           TextStyle(fontSize: 16, color: Color(0xffff9601)),
                  //     ),
                  //     TextSpan(
                  //       text: "00:${controller.start}",
                  //       style: const TextStyle(fontSize: 16, color: Colors.red),
                  //     ),
                  //     const TextSpan(
                  //       text: " sec ",
                  //       style:
                  //           TextStyle(fontSize: 16, color: Color(0xffff9601)),
                  //     ),
                  //   ],
                  // )),
                  // const SizedBox(
                  //   height: 150,
                  // ),
                  controller.isloading
                      ? const CircularProgressIndicator()
                      : InkWell(
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.onGetOtpButton();
                            }
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width - 60,
                            decoration: BoxDecoration(
                                color: const Color(0xffff9601),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text(
                                "Send the code",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
