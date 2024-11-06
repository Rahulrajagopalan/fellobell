import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController textController;
  const CustomTextfield({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty && value.length == 10) {
          return "Enter valid phone";
        }
        return null;
      },
      controller: textController,
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );
  }
}
