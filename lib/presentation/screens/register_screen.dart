import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_button.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    var apiService = Get.find<ApiService>();
    return Scaffold(
      body: Padding(
        padding: customPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Let's Get Started",
              style: customHeading,
            ),
            smallSizing,
            const Text(
              "Create an account get all features",
            ),
            smallSizing,
            const Row(
              children: [
                Text(
                  "Enter your mobile number",
                  style: customSubHeading,
                ),
              ],
            ),
            smallSizing,
            CustomTextfield(textController: phoneController),
            smallSizing,
            CustomButton(
                buttonText: "Get OTP",
                buttonFunction: () {
                  String phoneNumber = phoneController.text; 
                  apiService.fetchOtp(phoneNumber).then((value) {
                    Utility().otpMessage(value);
                    if (phoneNumber.isNotEmpty) {
                      Get.toNamed('/otpScreen', arguments: phoneNumber);
                    }
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                TextButton(
                    onPressed: () => Get.toNamed('/login'),
                    child: const Text("Login Here"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
