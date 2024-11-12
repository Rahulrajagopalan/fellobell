import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController textController;
  const CustomTextfield({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Phone number cannot be empty";
        }
        if (value.length != 10) {
          return "Enter a valid 10-digit phone number";
        }
        return null;
      },
      controller: textController,
      style: TextStyle(color: Colors.black),
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );
  }
}
