import 'dart:developer';

import 'package:get/get.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:fello_bell_project/core/utility.dart';

class OtpController extends GetxController {
  final ApiService _apiService = ApiService();

  Future<void> requestOtp(String phone) async {
    final otpResult = await _apiService.fetchOtp(phone);
    if (otpResult.startsWith("Error")) {
      Utility().errorMessage(otpResult);
    } else {
      Utility().otpMessage(otpResult);
    }
  }

  Future<void> verifyOtp(String phone, String otp) async {
    final isVerified = await _apiService.verifyPhoneOtp(phone, otp);
    if (isVerified) {
      log("message");
      Utility().successMessage("OTP verified successfully!");
      Get.toNamed("/login");
    } else {
      log("hi");
      Utility().errorMessage("Failed to verify OTP. Try again.");
    }
  }
}
