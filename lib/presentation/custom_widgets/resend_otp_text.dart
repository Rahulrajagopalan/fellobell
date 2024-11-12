import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResendOtpText extends StatelessWidget {
  const ResendOtpText({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    var utils = Get.find<Utility>();

    return GestureDetector(
      onTap: utils.start.value == 0
          ? () {
              utils.resetTimer();
              utils.resendCall(phoneNumber);
            }
          : null,
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive an OTP? ",
                style: Constants.customSubHeading,
              ),
              Text(
                "Resend in ${utils.start.value} sec",
                style: TextStyle(
                  color: utils.start.value == 0 ? Colors.blue : Colors.red,
                  fontSize: 16,
                ),
              ),
            ],
          )),
    );
  }
}
