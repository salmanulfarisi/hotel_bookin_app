import 'package:get/get.dart';

import '../controllers/welcome_view_controller.dart';

class WelcomeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeViewController>(
      () => WelcomeViewController(),
    );
  }
}
