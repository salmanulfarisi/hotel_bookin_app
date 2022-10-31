import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/data/models/authentication/login/login_model.dart';
import 'package:hotel_app/app/data/models/authentication/login/login_response_model.dart';
import 'package:hotel_app/app/data/services/register_service/login_service.dart';
import 'package:hotel_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  var ckeckBool = false.obs;
  var isAPIcallProcess = false.obs;
  RxBool isloading = false.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController phoneOrEmailController, passwordController;
  var email = '';
  var password = '';
  @override
  void onInit() {
    super.onInit();
    phoneOrEmailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    phoneOrEmailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value) && !GetUtils.isPhoneNumber(value)) {
      return "Provide a valid Email/Phone";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be 6 characters";
    } else {
      return null;
    }
  }

  bool validateAndSave() {
    final form = loginFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Future<void> onLoginButton() async {
    if (loginFormKey.currentState!.validate()) {
      isloading.value = true;
      final phoneEmail = phoneOrEmailController.text.trim();
      final password = passwordController.text;
      final data = LoginModel(username: phoneEmail, password: password);
      LoginResponseModel? response = await LoginService().loginService(data);
      if (response == null) {
        Get.snackbar("Error", "Response is null");
        isloading.value = false;
        return;
      } else if (response.created == true) {
        Get.snackbar("Success", "Login Success");
        Get.offAllNamed(Routes.NAVIGATION);
        isloading.value = false;
      } else {
        Get.snackbar("Error", response.message ?? 'Something went wrong');
      }
    }
  }
}
