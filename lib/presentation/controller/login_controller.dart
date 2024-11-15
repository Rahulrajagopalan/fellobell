import 'package:fello_bell_project/presentation/controller/otp_controller.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final otpController = Get.find<OtpController>();

  // Function to handle OTP request and navigation
  Future<void> requestOtpAndNavigate(String phoneNumber) async {
    try {
      await otpController.requestOtp(phoneNumber);
      Get.toNamed('/otpScreen', arguments: phoneNumber);
    } catch (e) {
      // Handle any errors that occur during OTP request
      Get.snackbar("Error", "Failed to request OTP");
    }
  }
}
