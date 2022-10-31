import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/modules/splash/views/widget/next.dart';
import 'package:hotel_app/app/modules/splash/views/widget/onboard_page2.dart';
import 'package:hotel_app/app/modules/splash/views/widget/onboarding_page1.dart';
import 'package:hotel_app/app/modules/splash/views/widget/onboarding_page3.dart';
import 'package:hotel_app/app/modules/splash/views/widget/skip.dart';
import 'package:hotel_app/app/modules/splash/views/widget/spash_animation.dart';
import 'package:hotel_app/app/modules/splash/views/widget/welcome.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    final introductionAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.0, -1.0))
            .animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    return Scaffold(
      // backgroundColor: const Color(0xffF7EBE1),
      body: ClipRect(
        child: Stack(
          children: [
            SplashAnimation(
              animationController: controller.animationController,
            ),
            OnboardPageOne(
              animationController: controller.animationController,
            ),
            OnboardPage2(
              animationController: controller.animationController,
            ),
            OnboardingPage3(
              animationController: controller.animationController,
            ),
            WelcomeScreen(
              animationController: controller.animationController,
            ),
            TopBackSkipView(
              onBackClick: controller.onBackClick,
              onSkipClick: controller.onSkipClick,
              animationController: controller.animationController,
            ),
            CenterNextButton(
              animationController: controller.animationController,
              onNextClick: controller.onNextClick,
            ),
          ],
        ),
      ),
    );
  }
}
