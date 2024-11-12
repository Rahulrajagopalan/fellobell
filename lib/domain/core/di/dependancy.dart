import 'package:dio/dio.dart';
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:get/get.dart';

class Dependancy {
  static init() {
    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<Utility>(() => Utility());
  }
}
