import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_buttons.dart';
import 'package:fello_bell_project/presentation/custom_widgets/resend_otp_text.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String phoneNumber;
  final TextEditingController otpController = TextEditingController();
  final utils = Get.find<Utility>();

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
    otpController.dispose();
    super.dispose();
  }

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
              "Enter otp sent to +91 $phoneNumber",
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
              controller: otpController,
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
              buttonFunction: () {
                utils.otpVerify(phoneNumber, otpController.text);
              },
            ),
            Constants.h20,
            ResendOtpText(
              phoneNumber: phoneNumber,
              start: start, // Pass the observable countdown timer
              resetTimer: resetTimer, // Pass the resetTimer function
            )
          ],
        ),
      ),
    );
  }
}
