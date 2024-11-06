import 'package:dio/dio.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Dependancy {
  static init() {
    Get.lazyPut(() =>
        ApiService());
  }
}


final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<Dio>(() => Dio());
}
