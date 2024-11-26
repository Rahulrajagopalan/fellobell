import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/theme/app_text_theme.dart';
import 'package:fello_bell_project/presentation/login/controller/login_controller.dart';
import 'package:fello_bell_project/presentation/widgets/custom_buttons.dart';
import 'package:fello_bell_project/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: Constants.horizon20,
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              Constants.appImage,
              Text(
                "Welcome",
                style: AppTextTheme.customHeading,
              ),
              Text(
                "Enter mobile number to continue",
                style: AppTextTheme.customDescription,
              ),
              Constants.h20,
              Text(
                "Enter your mobile number",
                style: AppTextTheme.customSubHeading,
              ),
              Constants.h20,
              CustomTextfield(textController: controller.phoneController),
              Constants.h20,
              CustomButton(
                    buttonText: "Get OTP",
                    buttonFunction: () {
                      if (controller.formKey.currentState!.validate()) {
                        if (controller.phoneController.text.isNotEmpty) {
                          controller
                              .requestOtpAndNavigate(controller.phoneController.text);
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
                  const Text("Don't have an account? "),
                  CustomTextButton(
                    routeName: '/register',
                    routeText: "Register Here",
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
