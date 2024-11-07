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
      appBar: AppBar(),
      body: Padding(
        padding: horizon20,
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
                "Enter mobile number to continue", style: customDescription,
              ),
              h20,
              const Text(
                "Enter your mobile number",
                style: customSubHeading,
              ),
              h20,
              CustomTextfield(textController: phoneController),
              h20,
              CustomButton(
                  buttonText: "Get OTP",
                  buttonFunction: () {
                    if (formKey.currentState!.validate()) {
                      utils.buttonCall(phoneController.text);
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
