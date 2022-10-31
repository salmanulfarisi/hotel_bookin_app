import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  final ScrollController scrollController = ScrollController();
  PageController pageController = PageController();
  var currentPageValue = 0.0.obs;
  double scaleFactor = 0.8;
  final double heigth = 22;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController.addListener(() {
      currentPageValue.value = pageController.page!;
    });
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
    pageController.dispose();
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
