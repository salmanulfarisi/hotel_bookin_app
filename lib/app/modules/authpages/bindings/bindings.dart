import 'package:get/get.dart';
import 'package:hotel_app/app/modules/authpages/controller/controller.dart';

class AuthPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthPagesController>(() => AuthPagesController());
  }
}
