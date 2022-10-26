import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/app/core/app_theme.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppTheme.notWhite,
      body: Center(
        child: AnimatedTextKit(animatedTexts: [
          TypewriterAnimatedText(
            'Hotel Booking',
            textStyle: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            speed: const Duration(milliseconds: 100),
          ),
        ]),
      ),
    );
  }
}
