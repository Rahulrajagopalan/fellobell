import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_buttons.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var utils = Get.find<Utility>();
    TextEditingController phoneController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: customPadding,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              appImage,
              const Text(
                "Welcome",
                style: customHeading,
              ),
              const Text(
                "Enter mobile number to continue",
              ),
              smallSizing,
              const Text(
                "Enter your mobile number",
                style: customSubHeading,
              ),
              smallSizing,
              CustomTextfield(textController: phoneController),
              smallSizing,
              CustomButton(
                  buttonText: "Get OTP",
                  buttonFunction: () {
                    if (formKey.currentState!.validate()) {
                      utils.buttonCall(phoneController.text, formKey);
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  CustomTextButton(routeName: '/register', routeText: "Register Here")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
