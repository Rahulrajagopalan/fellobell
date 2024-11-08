import 'package:fello_bell_project/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController{
  // Observable variable for theme
  var isDarkMode = false;

  // Toggle between light and dark mode
  void toggleTheme() {
    isDarkMode = !isDarkMode;
    Get.changeTheme(isDarkMode ? ThemeData.dark() : ThemeData.light());
  }

  ThemeData get lightTheme => ThemeData(
    primaryColor: Constants.primaryColor,
    hintColor: Constants.accentColor,
    textTheme: TextTheme(
      displayLarge: Constants.customHeading,
      bodyLarge: Constants.customDescription,
    ),
  );

  ThemeData get darkTheme => ThemeData(
    primaryColor: Colors.grey[900],
    hintColor: Colors.orange[300],
    textTheme: TextTheme(
      displayLarge: Constants.customHeading.copyWith(color: Colors.white),
      bodyLarge: Constants.customDescription.copyWith(color: Colors.grey[200]),
    ),
  );
}