import 'dart:async';

import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:get/get.dart';

class Utility extends GetxService {
  var apiService = Get.find<ApiService>();
  // OTP message
  void otpMessage(String otpMsg) {
    Get.snackbar("OTP is: ", otpMsg);
  }

  // Success message

  void successMessage(String msg) {
    Get.snackbar("Success!!!", msg);
  }
  void errorMessage(String msg) {
    Get.snackbar("Somethin Went Wrong!!!", msg);
  }

  // Timer for OTP
  var start = 60.obs;
  late Timer timer;

  // Method to start the timer
  void startTimer() {
    start.value = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start.value > 0) {
        start.value--;
      } else {
        timer.cancel();
      }
    });
  }

  // Method to reset the timer
  void resetTimer() {
    if (timer.isActive) timer.cancel();
    startTimer();
  }

  // Function for tap

  void buttonCall(String phone) {
    if (phone.isNotEmpty) {
      apiService.fetchOtp(phone).then((value) {
        otpMessage(value);
        Get.toNamed('/otpScreen', arguments: phone);
      });
    } else {
      Get.snackbar("Invalid Number", "Enter valid phone number");
    }
  }

  // resend OTP call
  void resendCall(String phone) {
    if (phone.isNotEmpty) {
      apiService.fetchOtp(phone);
    } else {
      Get.snackbar("Invalid Number", "Enter valid phone number");
    }
  }

  // OTP verify

  void otpVerify(String phoneNumber, String otp) {
    apiService.verifyOtp(phoneNumber, otp).then((value) {
      resetTimer();
    });
  }
}
