import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/theme/app_text_theme.dart';
import 'package:fello_bell_project/presentation/register/controller/register_controller.dart';
import 'package:fello_bell_project/presentation/widgets/custom_buttons.dart';
import 'package:fello_bell_project/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: Constants.horizon20,
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Let's Get Started!",
                style: AppTextTheme.customHeading,
              ),
              Text(
                "Create an account to get all features",
                style: AppTextTheme.customDescription,
              ),
              Constants.h20,
              Row(
                children: [
                  Text(
                    "Enter your mobile number",
                    style: AppTextTheme.customSubHeading,
                  ),
                ],
              ),
              Constants.h10,
              CustomTextfield(textController: controller.phoneController),
              Constants.h20,
              CustomButton(
                buttonText: "Get OTP",
                buttonFunction: () {
                  if (controller.formKey.currentState!.validate()) {
                    if (controller.phoneController.text.isNotEmpty) {
                      controller.requestOtpAndNavigate(
                          controller.phoneController.text);
                    } else {
                      Get.snackbar(
                          "Invalid Number", "Enter valid phone number");
                    }
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: AppTextTheme.customSubHeading,
                  ),
                  CustomTextButton(
                    routeName: '/login',
                    routeText: "Login Here",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
