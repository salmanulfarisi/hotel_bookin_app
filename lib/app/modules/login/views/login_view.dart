import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/core/widget/textfield_widget.dart';
import 'package:hotel_app/app/modules/login/views/widget/dividertext.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/authpic.svg',
                  height: 200,
                ),
                const Text(
                  'Login to your Account',
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
                  hintText: 'E-mail',
                  icon: Icons.mail,
                  controller: controller.phoneOrEmailController,
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
                    keyboardType: TextInputType.visiblePassword,
                    autofillHints: const [AutofillHints.email],
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
                        prefixIcon:
                            const Icon(Icons.fingerprint, color: Colors.red),
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
                                  ? Colors.black
                                  : Colors.grey,
                            ))),
                  ),
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          fillColor: MaterialStateProperty.all(Colors.black),
                          value: controller.ckeckBool.value,
                          onChanged: (value) {
                            controller.ckeckBool.value =
                                !controller.ckeckBool.value;
                          }),
                    ),
                    const Text('Remember Me'),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Forget Password ?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 17, 0),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    controller.onLoginButton();
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                        color: const Color(0xffff9601),
                        borderRadius: BorderRadius.circular(15)),
                    child: Obx(() => Center(
                          child: controller.isloading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        )),
                  ),
                ),
                const OrWidget(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
