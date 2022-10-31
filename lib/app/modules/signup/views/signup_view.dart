import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/core/widget/textfield_widget.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key, required this.phone}) : super(key: key);
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.signupFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/authpic.svg',
                  height: 200,
                ),
                const Text(
                  'Create your Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  hintText: 'enter your name',
                  icon: Icons.person,
                  controller: controller.nameController,
                  validator: (value) {
                    return controller.nameValidator(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  hintText: 'Enter Email',
                  icon: Icons.email,
                  controller: controller.emailController,
                  validator: (value) {
                    return controller.validateEmail(value!);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => TextFormField(
                    obscureText: controller.isPasswordHidden.value,
                    controller: controller.passwordController,
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      return controller.validatePassword(value!);
                    },
                    decoration: InputDecoration(
                        labelText: 'Password',
                        // labelStyle: labelStyle,
                        hintText: 'Password',
                        // hintStyle: labelStyle,
                        prefixIcon: const Icon(Icons.fingerprint,
                            color: Color.fromARGB(255, 255, 17, 0)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.isPasswordHidden.value =
                                  !controller.isPasswordHidden.value;
                            },
                            icon: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: controller.isPasswordHidden.value
                                  ? const Color.fromARGB(255, 255, 0, 0)
                                  : Colors.grey,
                            ))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: controller.isPasswordHidden.value,
                  onSaved: (value) {
                    controller.confirm = value!;
                  },
                  validator: (value) {
                    return controller.passwordConfirm();
                  },
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
                    // labelStyle: labelStyle,
                    hintText: 'Confirm password',
                    // hintStyle: labelStyle,
                    prefixIcon: const Icon(Icons.fingerprint,
                        color: Color.fromARGB(255, 255, 17, 0)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          fillColor: MaterialStateProperty.all(Colors.red),
                          value: controller.ckeckBool.value,
                          onChanged: (value) {
                            controller.ckeckBool.value =
                                !controller.ckeckBool.value;
                          }),
                    ),
                    const Text('Remember Me'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.onSignUpButton(phone);
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                        color: const Color(0xff132137),
                        borderRadius: BorderRadius.circular(15)),
                    child: Obx(() => Center(
                          child: controller.isloading.value
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // const OrWidget(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text("Already have a Account?"),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Get.offAllNamed(Routes.LOGIN);
                //       },
                //       child: const Text(
                //         'Sign In',
                //         style: TextStyle(
                //           color: Color.fromARGB(255, 255, 17, 0),
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
