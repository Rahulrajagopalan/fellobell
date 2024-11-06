import 'dart:async';

import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utility extends GetxService {
  var apiService = Get.find<ApiService>();
  void otpMessage(String otpMsg) {
    Get.snackbar("OTP is: ", otpMsg);
  }

  void successMessage(String msg) {
    Get.snackbar("Success!!!", msg);
  }

  var start = 60.obs;
  late Timer timer;
  void startTimer() {
    start = 60.obs;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start > 0) {
        start--;
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    timer.cancel();
    startTimer();
  }

  // Function for tap

  void buttonCall(String phone, GlobalKey<FormState> formKey) {
    if (phone.isNotEmpty && formKey.currentState!.validate()) {
      apiService.fetchOtp(phone).then((value) {
          Utility().otpMessage(value);
          Get.toNamed('/otpScreen', arguments: phone);
      });
    } else {
      Get.snackbar("Invalid Number", "Enter valid phone number");
    }
  }
}
