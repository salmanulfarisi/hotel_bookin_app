import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class NavigationController extends GetxController {
  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
  final tabIndex = 0.obs;

  void changeTab(int index) {
    tabIndex.value = index;
  }

  void openClosedSideMenu() {
    final state = sideMenuKey.currentState!;
    if (state.isOpened) {
      state.closeSideMenu();
    } else {
      state.openSideMenu();
    }
  }
}
