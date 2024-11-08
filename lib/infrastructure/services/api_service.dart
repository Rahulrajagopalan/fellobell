import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/infrastructure/services/api_constants.dart';
import 'package:fello_bell_project/presentation/model/otp_response.dart';
import 'package:fello_bell_project/presentation/model/otp_verify.dart';
import 'package:get/get.dart';


class ApiService extends GetxController {
  ApiConstants apiConstants = ApiConstants();

// Fetch OTP Function
  Future<String> fetchOtp(String phone) async {
    try {
      final Dio dioInstance = Get.find<Dio>();
      final body = dio.FormData.fromMap(
          {'mobile_number': phone, 'from_app': '0', 'process_type': '0'});

      // Send OTP request
      final response = await dioInstance.post(
        '${apiConstants.baseUrl}/registration_otp_req',
        options: dio.Options(headers: apiConstants.headers),
        data: body,
      );

      if (response.statusCode == 200) {
        final otpResponse = OtpResponse.fromJson(jsonDecode(response.data));

        if (otpResponse.status) {
          return otpResponse.data.toString();
        } else {
          log("OTP request failed: ${otpResponse.message}");
          return "Error occurred: ${otpResponse.message}";
        }
      } else {
        log("Server error with status code: ${response.statusCode}");
        return "Error occurred";
      }
    } catch (e) {
      log("Exception: $e");
      return "Not fetched";
    }
  }

// Verify OTP Function
  Future<void> verifyOtp(String phone, String otp) async {
    try {
      final Dio dioInstance = Get.find<Dio>();

      final body = dio.FormData.fromMap({
        'mobile_number': phone,
        'otp': otp,
        'from_app': '0',
      });

      final response = await dioInstance.post(
        '${apiConstants.baseUrl}/otp_validation',
        options: dio.Options(headers: apiConstants.headers),
        data: body,
      );

      if (response.statusCode == 200) {
        // Parse response data using otpVerify model
        final otpVerify = OtpVerify.fromJson(jsonDecode(response.data));

        if (otpVerify.status) {
          log("OTP verified successfully!");
          Utility().successMessage(otpVerify.message); // Display success message
          Get.toNamed("/login"); // Navigate to login screen
        } else {
          log("OTP verification failed: ${otpVerify.message}");
          Utility().successMessage("OTP verification failed: ${otpVerify.message}");
        }
      } else {
        log("Server error with status code: ${response.statusCode}");
      }
    } catch (e) {
      log("Error: $e");
    }
  }
}
