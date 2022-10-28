import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/core/widget/app_large_text.dart';
import 'package:hotel_app/app/core/widget/app_text.dart';
import 'package:hotel_app/app/core/widget/resposive_button.dart';
import 'package:hotel_app/app/routes/app_pages.dart';

import '../controllers/welcome_view_controller.dart';

class WelcomeView extends GetView<WelcomeViewController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomeViewController());
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.images.length,
            itemBuilder: (_, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/${controller.images[index]}.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text: "Feel Home\nIn A Dreamy\nPlace",
                            color: Colors.white,
                          ),
                          // AppText(
                          //   text: "Mountain",
                          //   size: 30,
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: AppText(
                              text:
                                  "Get in to the largest collection of hotels, resorts, and home stays all over the world with all your favorite destinations",
                              color: Colors.white.withOpacity(0.7),
                              size: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.AUTH_PAGES);
                            },
                            child: SizedBox(
                              width: 120,
                              child: Row(
                                children: [
                                  ResponsiveButton(
                                    width: 120,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDots
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.3)),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
