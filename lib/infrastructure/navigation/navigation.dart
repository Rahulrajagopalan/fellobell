import 'package:fello_bell_project/presentation/screens/intro_screen.dart';
import 'package:fello_bell_project/presentation/screens/login_screen.dart';
import 'package:fello_bell_project/presentation/screens/otp_screen.dart';
import 'package:fello_bell_project/presentation/screens/register_screen.dart';
import 'package:get/get.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(name: "/", page: () => const IntroScreen()),
    GetPage(name: "/otpScreen", page: () => const OtpScreen()),
    GetPage(name: "/register", page: () => const RegisterScreen()),
    GetPage(name: "/login", page: () => const LoginScreen()),
  ];
}