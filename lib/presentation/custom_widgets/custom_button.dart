import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonFunction;
  const CustomButton(
      {super.key, required this.buttonText, required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: buttonFunction,
        child: Container(
          width: double.infinity,
          height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(231,168,89,1)),
            child: Center(
              child: Text(
                buttonText.toUpperCase(),
                style:
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
              ),
            )));
  }
}
