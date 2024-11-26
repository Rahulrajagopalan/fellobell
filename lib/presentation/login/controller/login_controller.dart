import 'package:fello_bell_project/presentation/otp/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  final otpController = Get.find<OtpController>();

  // Function to handle OTP request and navigation
  Future<void> requestOtpAndNavigate(String phoneNumber) async {
    try {
      final otpValue = await otpController.requestOtp(phoneNumber);
      if (otpValue) {
        Get.toNamed('/otpScreen', arguments: phoneNumber);
      } else {
        Get.snackbar("Error", "OTP call failed");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to request OTP");
    }
  }
}
