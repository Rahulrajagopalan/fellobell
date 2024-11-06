import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Utility utils = Utility();
  final String phoneNumber = Get.arguments ?? 'No Number';
  TextEditingController otpController = TextEditingController();
  var apiService = Get.find<ApiService>();
  @override
  void initState() {
    super.initState();
    utils.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: customPadding,
        child: ListView(
          children: [
            const Text(
              "OTP Verification",
              style: customHeading,
            ),
            smallSizing,
            Text(
              "Enter otp sent to +91 $phoneNumber",
            ),
            smallSizing,
            const Text(
              "Enter OTP",
              style: customSubHeading,
            ),
            smallSizing,
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
            smallSizing,
            CustomButton(
                buttonText: "Verify",
                buttonFunction: () {
                  String otp = otpController.text;
                  apiService.verifyOtp(phoneNumber, otp).then((value) {});
                }),
            smallSizing,
            GestureDetector(
              onTap: utils.start == 0.obs
                  ? () {
                      utils.resetTimer();
                      apiService
                          .fetchOtp(phoneNumber)
                          .then((value) => Utility().otpMessage(value));
                    }
                  : null,
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't recieve an OTP? ", style: customSubHeading,),
                      Text(
                        "Resend in ${utils.start} sec",
                        style: TextStyle(
                          color:
                              utils.start == 0.obs ? Colors.blue : Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
