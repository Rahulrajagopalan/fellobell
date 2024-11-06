import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appImage,
            smallSizing,
            const Text(
              "Welcome to Fellobell",
              style: customHeading,
            ),
            const SizedBox(
              height: 20,
            ),
            introDialogue,
            smallSizing,
            CustomButton(
                buttonText: "LOGIN",
                buttonFunction: () => Get.toNamed('/login')),
            CustomButton(
                buttonText: "REGISTER",
                buttonFunction: () => Get.toNamed('/register')),
          ],
        ),
      ),
    );
  }
}
