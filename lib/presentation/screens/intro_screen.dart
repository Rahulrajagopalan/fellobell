import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/theme/app_text_theme.dart';
import 'package:fello_bell_project/presentation/custom_widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {
            Get.changeThemeMode(Get.isDarkMode? ThemeMode.light: ThemeMode.dark);
          }, icon: Icon(Icons.sunny, color: Colors.black,))
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
              style: AppTextTheme.customHeading,
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextTheme.introDialogue,
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
      resizeToAvoidBottomInset: false,
    );
  }
}
