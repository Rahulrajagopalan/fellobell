import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/presentation/controller/login_controller.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_buttons.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Constants.horizon20,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Constants.appImage,
              Text(
                "Welcome",
                style: Constants.customHeading,
              ),
              Text(
                "Enter mobile number to continue",
                style: Constants.customDescription,
              ),
              Constants.h20,
              Text(
                "Enter your mobile number",
                style: Constants.customSubHeading,
              ),
              Constants.h20,
              CustomTextfield(textController: phoneController),
              Constants.h20,
              CustomButton(
                buttonText: "Get OTP",
                buttonFunction: () {
                  if (formKey.currentState!.validate()) {
                    if (phoneController.text.isNotEmpty) {
                      loginController.requestOtpAndNavigate(phoneController.text);
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
