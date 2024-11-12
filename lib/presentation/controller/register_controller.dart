// import 'package:fello_bell_project/core/utility.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class RegisterController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//   final phoneController = TextEditingController();
//   final Utility utils = Get.find<Utility>();

//   // Method for handling the OTP request
//   void onGetOtpPressed() {
//     if (formKey.currentState!.validate()) {
//       utils.buttonCall(phoneController.text);
//       phoneController.clear();
//     }
//   }

//   @override
//   void onClose() {
//     phoneController.dispose();
//     super.onClose();
//   }
// }