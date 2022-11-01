import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/core/extentions.dart';
import 'package:hotel_app/app/modules/splash/controllers/splash_controller.dart';
import 'package:hotel_app/app/routes/app_pages.dart';

class SplashAnimation extends StatelessWidget {
  final AnimationController animationController;
  const SplashAnimation({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    final indrouctionAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.0, -1.0))
            .animate(CurvedAnimation(
      parent: controller.animationController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: indrouctionAnimation,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/onboarding1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20.0.wp,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: AnimatedTextKit(animatedTexts: [
                TypewriterAnimatedText(
                  'Hotel App',
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ]),
            ),
            SizedBox(
              height: 60.0.wp,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 16),
              child: InkWell(
                onTap: () {
                  if (controller.getStorage.read('token') != null) {
                    Get.offAllNamed(Routes.NAVIGATION);
                  } else {
                    controller.animationController.animateTo(0.2);
                  }
                },
                child: Container(
                  height: 58,
                  padding: const EdgeInsets.only(
                    left: 56.0,
                    right: 56.0,
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38.0),
                    color: const Color(0xff132137),
                  ),
                  child: const Text(
                    "Let's begin",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
