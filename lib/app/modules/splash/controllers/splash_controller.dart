import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hotel_app/app/modules/welcomeView/views/welcome_view_view.dart';
import 'package:hotel_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 6), () {
      if (getStorage.read('id') != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAll(() => const WelcomeView());
      }
    });
    // Timer(const Duration(seconds: 6), () => Get.off(() => const WelcomeView()));
  }
}
