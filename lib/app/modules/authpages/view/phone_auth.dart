import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/core/app_theme.dart';
import 'package:hotel_app/app/core/widget/textfield_widget.dart';
import 'package:hotel_app/app/modules/authpages/controller/controller.dart';
import 'package:hotel_app/app/routes/app_pages.dart';

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
                            icon: Icons.phone,
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
                  controller.isloading.value
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
                              child: Obx(
                                () => Center(
                                  child: controller.isloading.value
                                      ? const CircularProgressIndicator()
                                      : const Text(
                                          "Send the code",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                ),
                              )),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account ?"),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 17, 0),
                          ),
                        ),
                      )
                    ],
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
