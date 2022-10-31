import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/modules/home/views/home_view.dart';
import 'package:hotel_app/app/modules/navigation/views/widgets/buildmenu_drawer.dart';
import 'package:hotel_app/app/modules/profile/views/profile_view.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: controller.sideMenuKey,
      type: SideMenuType.slideNRotate,
      menu: buildMenu(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                controller.openClosedSideMenu();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.grey,
              )),
        ),
        body: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              const HomeView(),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Profile',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.changeTab(0);
                        },
                        child: const Text('Go to Home'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.changeTab(2);
                        },
                        child: const Text('Go to Settings'),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Settings',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.changeTab(0);
                        },
                        child: const Text('Go to Home'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.changeTab(1);
                        },
                        child: const Text('Go to Profile'),
                      ),
                    ],
                  ),
                ),
              ),
              const ProfileView()
            ],
          ),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: Obx(
            () => BottomNavigationBar(
              backgroundColor: Colors.white,
              onTap: (int index) => controller.changeTab(index),
              currentIndex: controller.tabIndex.value,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.amber,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.data_usage),
                  label: 'Events',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'wishlist',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_box),
                  label: 'profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
