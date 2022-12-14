import 'package:get/get.dart';
import 'package:hotel_app/app/modules/authpages/bindings/bindings.dart';
import 'package:hotel_app/app/modules/authpages/view/phone_auth.dart';
import 'package:hotel_app/app/modules/booking_page/bindings/booking_page_binding.dart';
import 'package:hotel_app/app/modules/booking_page/views/booking_page_view.dart';
import 'package:hotel_app/app/modules/favaroit_page/bindings/favaroit_page_binding.dart';
import 'package:hotel_app/app/modules/favaroit_page/views/favaroit_page_view.dart';
import 'package:hotel_app/app/modules/login/bindings/login_binding.dart';
import 'package:hotel_app/app/modules/login/views/login_view.dart';
import 'package:hotel_app/app/modules/navigation/bindings/navigation_binding.dart';
import 'package:hotel_app/app/modules/navigation/views/navigation_view.dart';
import 'package:hotel_app/app/modules/otp_view/bindings/bindings.dart';
import 'package:hotel_app/app/modules/otp_view/view/view.dart';
import 'package:hotel_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:hotel_app/app/modules/profile/views/profile_view.dart';
import 'package:hotel_app/app/modules/search_page/bindings/search_page_binding.dart';
import 'package:hotel_app/app/modules/search_page/views/search_page_view.dart';
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
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 3000),
      binding: OtpBindings(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      transition: Transition.zoom,
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
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_PAGE,
      page: () => const BookingPageView(),
      binding: BookingPageBinding(),
    ),
    GetPage(
      name: _Paths.FAVAROIT_PAGE,
      page: () => const FavaroitPageView(),
      binding: FavaroitPageBinding(),
    ),
    GetPage(
      name: Routes.SEARCH_PAGE,
      page: () => const SearchPageView(),
      binding: SearchPageBinding(),
    ),
  ];
}
