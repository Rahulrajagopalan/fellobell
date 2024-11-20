import 'package:fello_bell_project/core/theme/app_color_scheme.dart';
import 'package:fello_bell_project/core/theme/app_text_theme.dart';
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
    primaryColor: AppColorScheme.primaryColor,
    hintColor: AppColorScheme.accentColor,
    textTheme: TextTheme(
      displayLarge: AppTextTheme.customHeading,
      bodyLarge: AppTextTheme.customDescription,
    ),
  );

  ThemeData get darkTheme => ThemeData(
    primaryColor: Colors.grey[900],
    hintColor: Colors.orange[300],
    textTheme: TextTheme(
      displayLarge: AppTextTheme.customHeading.copyWith(color: Colors.white),
      bodyLarge: AppTextTheme.customDescription.copyWith(color: Colors.grey[200]),
    ),
  );
}