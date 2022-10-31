import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/data/models/authentication/signup/signup_model.dart';
import 'package:hotel_app/app/data/models/authentication/signup/signup_response_model.dart';
import 'package:hotel_app/app/data/services/register_service/signup_service.dart';
import 'package:hotel_app/app/routes/app_pages.dart';

class SignupController extends GetxController {
  var isPasswordHidden = true.obs;
  var ckeckBool = false.obs;
  var isAPIcallProcess = false.obs;
  RxBool isloading = false.obs;
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,
      nameController,
      passwordController,
      confirmPasswordController;
  var email = '';
  var password = '';
  var confirm = '';
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide a valid Email";
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

  String? passwordConfirm() {
    if (passwordController.text == confirmPasswordController.text) {
      return null;
    }
    return "Password doesn't match";
  }

  bool validateAndSave() {
    final form = signupFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  String? nameValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please enter your name';
    } else if (fieldContent.length < 4 || fieldContent.length > 15) {
      return 'Name reqiures 4-15 characters';
    }
    return null;
  }

  Future<void> onSignUpButton(String phoneNum) async {
    if (signupFormKey.currentState!.validate()) {
      isloading.value = true;
      final obj = SignupModel(
        name: nameController.text.trim(),
        email: emailController.text,
        password: passwordController.text,
        phone: phoneNum,
      );
      SignupResponseModel? response = await SignUpService().signUpService(obj);
      if (response == null) {
        Get.snackbar('Error', 'No Response');
        isloading.value = false;
        return;
      } else if (response.created == true) {
        Get.snackbar('Success', 'Account Created');
        Get.offAllNamed(Routes.NAVIGATION);
        isloading.value = false;
      } else {
        Get.snackbar('Error', "$response.message");
        return;
      }
    }
  }
}
