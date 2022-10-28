import 'package:get/get.dart';
import 'package:hotel_app/app/modules/otp_view/controller/controller.dart';

class OtpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}
