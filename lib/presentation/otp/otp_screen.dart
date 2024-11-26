import 'dart:async';
import 'package:fello_bell_project/core/theme/app_text_theme.dart';
import 'package:fello_bell_project/presentation/otp/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/presentation/widgets/custom_buttons.dart';
import 'package:fello_bell_project/presentation/widgets/resend_otp_text.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String phoneNumber;
  final TextEditingController otpTextController = TextEditingController();

  // Timer for OTP countdown
  var start = 60.obs;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    phoneNumber = Get.arguments ?? 'No Number';
    startTimer();
  }

  // Start the OTP countdown timer
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

  // Reset the timer and start it again
  void resetTimer() {
    if (timer.isActive) timer.cancel();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    otpTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: Constants.horizon20,
        child: Column(
          children: [
            Text(
              "OTP Verification",
              style: AppTextTheme.customHeading,
            ),
            Text(
              "Enter otp sent to +91 $phoneNumber",
            ),
            Constants.h20,
            Row(
              children: [
                Text(
                  "Enter OTP",
                  style: AppTextTheme.customSubHeading,
                ),
              ],
            ),
            Constants.h10,
            Pinput(
              controller: otpTextController,
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
            GetBuilder<OtpController>(builder: (controller) {
              return CustomButton(
              buttonText: "Verify",
              buttonFunction: () {
                controller
                    .verifyOtp(phoneNumber, otpTextController.text)
                    .then((value) {
                  resetTimer();
                });
              },
            );
            },),
            Constants.h20,
            ResendOtpText(
              phoneNumber: phoneNumber,
              start: start,
              resetTimer: resetTimer,
            )
          ],
        ),
      ),
    );
  }
}
