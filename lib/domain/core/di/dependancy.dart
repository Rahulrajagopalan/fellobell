import 'package:dio/dio.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:fello_bell_project/presentation/controller/login_controller.dart';
import 'package:fello_bell_project/presentation/controller/otp_controller.dart';
import 'package:fello_bell_project/presentation/controller/register_controller.dart';
import 'package:get/get.dart';

class Dependancy {
  static init() {
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<OtpController>(() => OtpController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
