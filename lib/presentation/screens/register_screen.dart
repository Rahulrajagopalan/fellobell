import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/utility.dart';
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
  final Utility utils = Get.find<Utility>();
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Constants.horizon20,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Let's Get Started!",
                style: Constants.customHeading,
              ),
              Text(
                "Create an account to get all features",
                style: Constants.customDescription,
              ),
              Constants.h20,
              Row(
                children: [
                  Text(
                    "Enter your mobile number",
                    style: Constants.customSubHeading,
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
                    utils.buttonCall(phoneController.text);
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Constants.customSubHeading,
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
