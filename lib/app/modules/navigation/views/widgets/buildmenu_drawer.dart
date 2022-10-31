import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/core/extentions.dart';
import 'package:hotel_app/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:hotel_app/app/modules/profile/views/profile_view.dart';

Widget buildMenu() {
  final controller = Get.find<NavigationController>();
  return SingleChildScrollView(
    padding: EdgeInsets.all(7.0.wp),
    child: Column(
      children: [
        ListTile(
          onTap: () {
            controller.openClosedSideMenu();
          },
          leading: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          title: Text(
            'Home',
            style: TextStyle(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          textColor: Colors.white,
          dense: true,
        ),
        ListTile(
          onTap: () {
            Get.to(() => const ProfileView(),
                transition: Transition.cupertinoDialog);
            // homeController.openClosedSideMenu();
          },
          leading: const Icon(
            Icons.data_usage,
            color: Colors.white,
          ),
          title: Text(
            'Report',
            style: TextStyle(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          textColor: Colors.white,
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          title: Text(
            'About developer',
            style: TextStyle(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          textColor: Colors.white,
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          title: Text(
            'Settings',
            style: TextStyle(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          textColor: Colors.white,
          dense: true,
        ),
      ],
    ),
  );
}
