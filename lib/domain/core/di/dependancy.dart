import 'package:dio/dio.dart';
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Dependancy {
  static init() {
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => Utility());
  }
}

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<Dio>(() => Dio());
}
