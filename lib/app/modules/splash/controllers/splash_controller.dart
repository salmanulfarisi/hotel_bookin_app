import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hotel_app/app/routes/app_pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final getStorage = GetStorage();
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );
    animationController.animateTo(0.0);
    // Timer(const Duration(seconds: 6), () {
    //   if (getStorage.read('id') != null) {
    //     Get.offAllNamed(Routes.HOME);
    //   } else {
    //     Get.offAll(() => const WelcomeView());
    //   }
    // });
    // Timer(const Duration(seconds: 6), () => Get.off(() => const WelcomeView()));
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }

  void onSkipClick() {
    animationController.animateTo(0.8,
        duration: const Duration(milliseconds: 1200));
  }

  void onNextClick() {
    if (animationController.value >= 0 && animationController.value <= 0.2) {
      animationController.animateTo(0.4);
    } else if (animationController.value > 0.2 &&
        animationController.value <= 0.4) {
      animationController.animateTo(0.6);
    } else if (animationController.value > 0.4 &&
        animationController.value <= 0.6) {
      animationController.animateTo(0.8);
    } else if (animationController.value > 0.6 &&
        animationController.value <= 0.8) {
      _signUpClick();
    }
  }

  void onBackClick() {
    if (animationController.value >= 0 && animationController.value <= 0.2) {
      animationController.animateTo(0.0);
    } else if (animationController.value > 0.2 &&
        animationController.value <= 0.4) {
      animationController.animateTo(0.2);
    } else if (animationController.value > 0.4 &&
        animationController.value <= 0.6) {
      animationController.animateTo(0.4);
    } else if (animationController.value > 0.6 &&
        animationController.value <= 0.8) {
      animationController.animateTo(0.6);
    } else if (animationController.value > 0.8 &&
        animationController.value <= 1.0) {
      animationController.animateTo(0.8);
    }
  }

  void _signUpClick() {
    Get.toNamed(Routes.AUTH_PAGES);
  }
}
