import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_buttons.dart';
import 'package:fello_bell_project/presentation/custom_widgets/resend_otp_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final String phoneNumber = Get.arguments ?? 'No Number';
  TextEditingController otpController = TextEditingController();
  var apiService = Get.find<ApiService>();
  var utils = Get.find<Utility>();
  @override
  void initState() {
    super.initState();
    utils.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: horizon20,
        child: Column(
          children: [
            const Text(
              "OTP Verification",
              style: customHeading,
            ),
            h20,
            Text(
              "Enter otp sent to +91 $phoneNumber",
            ),
            h20,
            const Text(
              "Enter OTP",
              style: customSubHeading,
            ),
            h20,
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
            h20,
            CustomButton(
                buttonText: "Verify",
                buttonFunction: () {
                  apiService.verifyOtp(phoneNumber, otpController.text).then((value) {
                    otpController.clear();
                    utils.resetTimer();
                  });
                }),
            h20,
            ResendOtpText(phoneNumber: phoneNumber),
          ],
        ),
      ),
    );
  }
}