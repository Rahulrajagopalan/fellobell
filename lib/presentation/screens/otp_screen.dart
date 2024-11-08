import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/presentation/controller/otp_controller.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_buttons.dart';
import 'package:fello_bell_project/presentation/custom_widgets/resend_otp_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Constants.horizon20,
        child: Column(
          children: [
            Text(
              "OTP Verification",
              style: Constants.customHeading,
            ),
            Text(
              "Enter OTP sent to +91 ${controller.phoneNumber}",
            ),
            Constants.h20,
            Row(
              children: [
                Text(
                  "Enter OTP",
                  style: Constants.customSubHeading,
                ),
              ],
            ),
            Constants.h10,
            Pinput(
              controller: controller.otpController,
              length: 4,
              defaultPinTheme: PinTheme(
                width: 80,
                height: 55,
                textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Constants.h20,
            CustomButton(
              buttonText: "Verify",
              buttonFunction: controller.verifyOtp,
            ),
            Constants.h20,
            ResendOtpText(phoneNumber: controller.phoneNumber),
          ],
        ),
      ),
    );
  }
}