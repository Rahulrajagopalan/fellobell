import 'package:fello_bell_project/domain/core/di/dependancy.dart';
import 'package:fello_bell_project/infrastructure/navigation/navigation.dart';
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
      theme: ThemeData(
          useMaterial3: false,
          fontFamily: "Source Sans Pro",
          appBarTheme: AppBarTheme(
            shadowColor: Colors.white,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black, size: 30),
          )),
      getPages: Navigation.routes,
      debugShowCheckedModeBanner: false,
      title: 'Fellobell',
    );
  }
}
