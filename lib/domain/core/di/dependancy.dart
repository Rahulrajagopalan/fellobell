import 'package:dio/dio.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:fello_bell_project/presentation/controller/login_controller.dart';
import 'package:fello_bell_project/presentation/controller/otp_controller.dart';
import 'package:fello_bell_project/presentation/controller/register_controller.dart';
import 'package:get/get.dart';

class Dependency {
  static void init() {
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<ApiService>(() => ApiService());
    _controllers();
  }

  static void _controllers() {
    Get.put<OtpController>(OtpController());
    Get.put<LoginController>(LoginController());
    Get.put<RegisterController>(RegisterController());
  }
}

