import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_button.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var apiService = Get.find<ApiService>();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: customPadding,
        child: ListView(
          children: [
            appImage,
            const Text(
              "Welcome",
              style: customHeading,
            ),
            const Text(
              "Enter mobile number to continue",
            ),
            smallSizing,
            const Text(
              "Enter your mobile number",
              style: customSubHeading,
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
                const Text("Don't have an account? "),
                TextButton(
                    onPressed: () => Get.toNamed('/register'),
                    child: const Text("Register Here"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
