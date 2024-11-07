import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonFunction;
  const CustomButton(
      {super.key, required this.buttonText, required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: buttonFunction,
        child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(231, 168, 89, 1)),
            child: Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            )));
  }
}

class CustomTextButton extends StatelessWidget {
  final String routeName;
  final String routeText;
  const CustomTextButton({super.key, required this.routeName, required this.routeText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Get.toNamed(routeName),
        child: Text(
          routeText,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ));
  }
}
