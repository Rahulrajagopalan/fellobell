import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            Get.changeThemeMode(Get.isDarkMode? ThemeMode.light: ThemeMode.dark);
          }, icon: Icon(Icons.sunny))
        ],
      ),
      body: Padding(
        padding: Constants.horizon10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Constants.appImage,
            Constants.h20,
            Text(
              "Welcome to Fellobell",
              style: Constants.customHeading,
            ),
            const SizedBox(
              height: 20,
            ),
            Constants.introDialogue,
            Padding(
              padding: Constants.horizon20,
              child: Column(
                children: [
                  CustomButton(
                      buttonText: "LOGIN",
                      buttonFunction: () => Get.toNamed('/login')),
                  Constants.h20,
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
