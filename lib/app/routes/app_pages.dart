import 'package:get/get.dart';
import 'package:hotel_app/app/modules/authpages/bindings/bindings.dart';
import 'package:hotel_app/app/modules/authpages/view/phone_auth.dart';

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
  ];
}
