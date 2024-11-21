import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/infrastructure/services/api_constants.dart';
import 'package:fello_bell_project/presentation/model/otp_response.dart';
import 'package:fello_bell_project/presentation/model/otp_verify.dart';
import 'package:fello_bell_project/presentation/model/post_model.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  // Singleton pattern for ApiService
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();
  final dio.Dio _dioInstance = Get.find<dio.Dio>();

  Future<String> fetchOtp(String phone) async {
    try {
      final formData = dio.FormData.fromMap({
        'mobile_number': phone,
        'from_app': '0',
        'process_type': '0'
      });

      // Send OTP request
      final response = await _dioInstance.post(
        '${ApiConstants.baseUrl}/registration_otp_req',
        options: dio.Options(headers: ApiConstants.headers),
        data: formData,
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
        log("Server error: Status Code ${response.statusCode}");
        return "Server Error: ${response.statusCode}";
      }
    } catch (e) {
      log("Exception in fetchOtp: $e");
      return "Not fetched";
    }
  }

  Future<bool> verifyPhoneOtp(String phone, String otp) async {
    try {
      final formData = dio.FormData.fromMap({
        'mobile_number': phone,
        'otp': otp,
        'from_app': '0',
      });

      final response = await _dioInstance.post(
        '${ApiConstants.baseUrl}/otp_validation',
        options: dio.Options(headers: ApiConstants.headers),
        data: formData,
      );

      if (response.statusCode == 200) {
        final otpVerify = OtpVerify.fromJson(jsonDecode(response.data));
        if (otpVerify.status) {
          log("OTP verified successfully!");
          return true;
        } else {
          log("OTP verification failed: ${otpVerify.message}");
          Utility().errorMessage("OTP verification failed: ${otpVerify.message}");
          return false;
        }
      } else {
        log("Server error: Status Code ${response.statusCode}");
        Utility().errorMessage("Network error");
        return false;
      }
    } catch (e) {
      log("Error in verifyOtp: $e");
      return false;
    }
  }

  // Fetch Posts

  Future<PostModel?> fetchPosts(String userId) async {
    try {
      final formData = dio.FormData.fromMap({
        'user_id': userId,
        'latitude': '75',
        'longitude': '65',
      });

      final response = await _dioInstance.post(
        '${ApiConstants.baseUrl}/get_all_posts',
        options: dio.Options(headers: {
          'X-Auth-Client': '12345',
          'X-Auth-Token': '12345',
          'Authorization': ApiConstants.accessToken,
        }),
        data: formData,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data);
        final postResponse = PostModel.fromJson(responseData);
        if (postResponse.status) {
          return postResponse;
        } else {
          log("Error: ${postResponse.message}");
          Get.snackbar("Error", postResponse.message);
          return null;
        }
      } else {
        log("Server error: ${response.statusCode}");
        Get.snackbar("Error", "Server error occurred");
        return null;
      }
    } catch (e) {
      log("Exception in fetchPosts: $e");
      Get.snackbar("Error", "An error occurred while fetching posts");
      return null;
    }
  }
}
