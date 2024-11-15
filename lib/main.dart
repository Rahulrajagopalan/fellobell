import 'package:fello_bell_project/domain/core/di/dependancy.dart';
import 'package:fello_bell_project/infrastructure/navigation/navigation.dart';
import 'package:fello_bell_project/presentation/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      theme: ThemeController().lightTheme,
      darkTheme: ThemeController().darkTheme,
      getPages: Navigation.routes,
      debugShowCheckedModeBanner: false,
      title: 'Fellobell',
    );
  }
}
