import 'dart:async';

import 'package:get/get.dart';

class Utility {
  void otpMessage(String otpMsg){
    Get.snackbar("OTP is: ", otpMsg);
  }
  void successMessage(String msg){
    Get.snackbar("", msg);
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
}