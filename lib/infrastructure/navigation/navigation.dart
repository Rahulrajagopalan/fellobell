import 'package:fello_bell_project/presentation/otp/controller/otp_controller.dart';
import 'package:fello_bell_project/presentation/home/home_navigation.dart';
import 'package:fello_bell_project/presentation/intro/intro_screen.dart';
import 'package:fello_bell_project/presentation/login/login_screen.dart';
import 'package:fello_bell_project/presentation/otp/otp_screen.dart';
import 'package:fello_bell_project/presentation/register/register_screen.dart';
import 'package:get/get.dart';

class Navigation {
  static List<GetPage> routes = [
    GetPage(name: "/", page: () => const IntroScreen()),
    GetPage(
        name: "/otpScreen",
        page: () => const OtpScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut<OtpController>(() => OtpController());
        })),
    GetPage(
        name: "/register",
        page: () => const RegisterScreen(),),
    GetPage(
        name: "/login",
        page: () => const LoginScreen(),),
    GetPage(
        name: "/home",
        page: () => HomeNavigation(),),
  ];
}
