import 'package:fello_bell_project/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';

class ResendOtpText extends StatelessWidget {
  const ResendOtpText({
    super.key,
    required this.phoneNumber,
    required this.start,
    required this.resetTimer,
  });

  final String phoneNumber;
  final RxInt start;
  final VoidCallback resetTimer;

  @override
  Widget build(BuildContext context) {
    var apiService = Get.find<ApiService>();
    var utils = Utility();
    
    return GestureDetector(
      onTap: start.value == 0
          ? () {
              resetTimer();
              apiService.fetchOtp(phoneNumber).then((value) {
                utils.otpMessage(value);
              });
            }
          : null,
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive an OTP? ",
                style: AppTextTheme.customSubHeading,
              ),
              Text(
                "Resend in ${start.value} sec",
                style: TextStyle(
                  color: start.value == 0 ? Colors.blue : Colors.red,
                  fontSize: 16,
                ),
              ),
            ],
          )),
    );
  }
}
