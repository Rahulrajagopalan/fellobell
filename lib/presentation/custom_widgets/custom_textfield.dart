import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController textController;
  const CustomTextfield({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );
  }
}
