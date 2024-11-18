import 'package:get/get.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:fello_bell_project/core/utility.dart';

class OtpController extends GetxController {
  final ApiService _apiService = ApiService();

  Future<bool> requestOtp(String phone) async {
    final otpResult = await _apiService.fetchOtp(phone);
    if (otpResult.length != 4) {
      Utility().errorMessage(otpResult);
      return false;
    } else {
      Utility().otpMessage(otpResult);
      Get.toNamed('/otpScreen', arguments: phone);
      return true;
    }
  }

  Future<void> verifyOtp(String phone, String otp) async {
    final isVerified = await _apiService.verifyPhoneOtp(phone, otp);
    if (isVerified) {
      Utility().successMessage("OTP verified successfully!");
      Get.toNamed("/login");
    } else {
      Get.snackbar("Failed to verify OTP", "Try again");
    }
  }
}
