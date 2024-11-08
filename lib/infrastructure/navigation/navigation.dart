import 'package:fello_bell_project/presentation/controller/login_controller.dart';
import 'package:fello_bell_project/presentation/controller/otp_controller.dart';
import 'package:fello_bell_project/presentation/controller/register_controller.dart';
import 'package:fello_bell_project/presentation/screens/intro_screen.dart';
import 'package:fello_bell_project/presentation/screens/login_screen.dart';
import 'package:fello_bell_project/presentation/screens/otp_screen.dart';
import 'package:fello_bell_project/presentation/screens/register_screen.dart';
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
        page: () => const RegisterScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut<RegisterController>(() => RegisterController());
        })),
    GetPage(
      name: "/login",
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
  ];
}
