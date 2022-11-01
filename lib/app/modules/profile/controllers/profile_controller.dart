import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hotel_app/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final getStorage = GetStorage();
  void onLogoutButton() {
    getStorage.erase();
    Get.offAllNamed(Routes.SPLASH);
  }
}
