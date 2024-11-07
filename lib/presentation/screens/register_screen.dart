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
      appBar: AppBar(),
      body: Padding(
        padding: horizon20,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Let's Get Started!",
                style: customHeading,
              ),
              const Text(
                "Create an account get all features", style: customDescription,
              ),
              h20,
              const Row(
                children: [
                  Text(
                    "Enter your mobile number",
                    style: customSubHeading,
                  ),
                ],
              ),
              h10,
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
