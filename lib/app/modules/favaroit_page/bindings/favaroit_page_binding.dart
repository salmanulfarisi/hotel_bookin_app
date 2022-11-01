import 'package:get/get.dart';

import '../controllers/favaroit_page_controller.dart';

class FavaroitPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavaroitPageController>(
      () => FavaroitPageController(),
    );
  }
}
