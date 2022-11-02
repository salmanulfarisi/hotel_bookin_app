import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/data/models/home/getallrooms.dart';
import 'package:hotel_app/app/data/models/home/response.dart';
import 'package:hotel_app/app/data/services/dio/internet_checker.dart';
import 'package:hotel_app/app/data/services/home/get_rooms.dart';

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
  List<AllRoomsModel> allrooms = [];
  RxBool isloading = false.obs;

  @override
  void onInit() {
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

  Future<void> getAllRoom() async {
    if (await internetCheck()) {
      isloading.value = true;

      AllRoomsResponse? roomResponse = await GetAllRoomsService().getAllRooms();
      if (roomResponse == null) {
        Get.snackbar('Error', 'Please check your internet connection !');
        isloading.value = false;
        return;
      } else if (roomResponse.isFailed == true) {
        Get.snackbar(
            'Error', roomResponse.errormessage ?? 'Something went wrong !!');
        isloading.value = false;
        return;
      } else if (roomResponse.dataList != null) {
        allrooms.clear();
        allrooms.addAll(roomResponse.dataList ?? []);
        isloading.value = false;
        return;
      } else {
        return;
      }
    } else {
      Get.snackbar('Error', 'Please check your internet connection !');
      isloading.value = false;
      return;
    }
  }
}
