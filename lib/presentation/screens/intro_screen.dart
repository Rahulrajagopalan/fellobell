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
        padding: horizon10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appImage,
            h20,
            const Text(
              "Welcome to Fellobell",
              style: customHeading,
            ),
            const SizedBox(
              height: 20,
            ),
            introDialogue,
            h20,
            Padding(
              padding: horizon20,
              child: Column(
                children: [
                  CustomButton(
                      buttonText: "LOGIN",
                      buttonFunction: () => Get.toNamed('/login')),
                  h20,
                  CustomButton(
                      buttonText: "REGISTER",
                      buttonFunction: () => Get.toNamed('/register')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
