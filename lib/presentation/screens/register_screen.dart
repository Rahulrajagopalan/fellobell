import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/theme/app_text_theme.dart';
import 'package:fello_bell_project/presentation/controller/register_controller.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_buttons.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final registerController = Get.find<RegisterController>();
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: Constants.horizon20,
        child: Form(
          key: formKey,
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
              CustomTextfield(textController: phoneController),
              Constants.h20,
              CustomButton(
                buttonText: "Get OTP",
                buttonFunction: () {
                  if (formKey.currentState!.validate()) {
                    if (phoneController.text.isNotEmpty) {
                      registerController
                          .requestOtpAndNavigate(phoneController.text);
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
