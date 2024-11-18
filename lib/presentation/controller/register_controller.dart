import 'package:fello_bell_project/presentation/controller/otp_controller.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
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
      // Handle any errors that occur during OTP request
      print(e);
      Get.snackbar("Error", "Failed to request OTP");
    }
  }
}