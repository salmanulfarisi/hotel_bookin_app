import 'package:get/get.dart';
import 'package:hotel_app/app/modules/authpages/bindings/bindings.dart';
import 'package:hotel_app/app/modules/authpages/view/phone_auth.dart';
import 'package:hotel_app/app/modules/login/bindings/login_binding.dart';
import 'package:hotel_app/app/modules/login/views/login_view.dart';
import 'package:hotel_app/app/modules/navigation/bindings/navigation_binding.dart';
import 'package:hotel_app/app/modules/navigation/views/navigation_view.dart';
import 'package:hotel_app/app/modules/otp_view/bindings/bindings.dart';
import 'package:hotel_app/app/modules/otp_view/view/view.dart';
import 'package:hotel_app/app/modules/signup/bindings/signup_binding.dart';
import 'package:hotel_app/app/modules/signup/views/signup_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/welcomeView/bindings/welcome_view_binding.dart';
import '../modules/welcomeView/views/welcome_view_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME_VIEW,
      page: () => const WelcomeView(),
      binding: WelcomeViewBinding(),
    ),
    GetPage(
      name: Routes.AUTH_PAGES,
      page: () => const PhoneAuthView(),
      binding: AuthPageBindings(),
    ),
    GetPage(
      name: Routes.OTP_VIEW,
      page: () => const OtpView(),
      binding: OtpBindings(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(
        phone: Get.arguments,
      ),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
    ),
  ];
}
