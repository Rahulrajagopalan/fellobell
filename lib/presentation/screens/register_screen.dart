import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_buttons.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    var utils = Get.find<Utility>();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: customPadding,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Let's Get Started",
                style: customHeading,
              ),
              smallSizing,
              const Text(
                "Create an account get all features",
              ),
              smallSizing,
              const Row(
                children: [
                  Text(
                    "Enter your mobile number",
                    style: customSubHeading,
                  ),
                ],
              ),
              smallSizing,
              CustomTextfield(textController: phoneController),
              smallSizing,
              CustomButton(
                  buttonText: "Get OTP",
                  buttonFunction: () {
                    utils.buttonCall(phoneController.text, formKey);
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?", style: customSubHeading,),
                  CustomTextButton(routeName: '/login', routeText: "Login Here")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
