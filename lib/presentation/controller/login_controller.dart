import 'package:fello_bell_project/core/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  final Utility utils = Get.find<Utility>();

  // Method to handle button click
  void onGetOtpPressed() {
    if (formKey.currentState!.validate()) {
      utils.buttonCall(phoneController.text);
      phoneController.clear();
    }
  }

  @override
  void onClose() {
    // Dispose controllers to free up memory
    phoneController.dispose();
    super.onClose();
  }
}