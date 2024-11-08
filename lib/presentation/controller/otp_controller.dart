import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final phoneNumber = Get.arguments ?? 'No Number';
  final otpController = TextEditingController();
  final apiService = Get.find<ApiService>();
  final utils = Get.find<Utility>();

  @override
  void onInit() {
    super.onInit();
    utils.startTimer();
  }

  // Method to verify OTP
  void verifyOtp() {
    utils.otpVerify(phoneNumber, otpController.text);
    otpController.clear();
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}