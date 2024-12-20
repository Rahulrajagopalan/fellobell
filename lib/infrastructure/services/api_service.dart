import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:fello_bell_project/core/utility.dart';
import 'package:fello_bell_project/domain/models/carousel_image_model.dart';
import 'package:fello_bell_project/infrastructure/services/api_constants.dart';
import 'package:fello_bell_project/domain/models/my_post_model.dart';
import 'package:fello_bell_project/domain/models/otp_response.dart';
import 'package:fello_bell_project/domain/models/otp_verify.dart';
import 'package:fello_bell_project/domain/models/post_model.dart';
import 'package:fello_bell_project/domain/models/user_model.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  // Singleton pattern for ApiService
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();
  final dio.Dio _dioInstance = Get.find<dio.Dio>();

  Future<String> fetchOtp(String phone) async {
    try {
      final formData = dio.FormData.fromMap(
          {'mobile_number': phone, 'from_app': '0', 'process_type': '0'});

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
          Utility()
              .errorMessage("OTP verification failed: ${otpVerify.message}");
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

  Future<List<PostModel>?> fetchAllPosts(String userId) async {
    try {
      final formData = dio.FormData.fromMap({
        'user_id': userId,
        'latitude': '75',
        'longitude': '65',
      });

      final response = await _dioInstance.post(
        '${ApiConstants.baseUrl}/get_all_posts',
        options: dio.Options(headers: ApiConstants.headers),
        data: formData,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = response.data is String
            ? jsonDecode(response.data) as Map<String, dynamic>
            : response.data as Map<String, dynamic>;
        if (decodedJson['status'] == true) {
          final List<PostModel> posts = (decodedJson['data'] as List)
              .map((item) => PostModel.fromJson(item))
              .toList();
          return posts;
        } else {
          log("Error: ${decodedJson['message']}");
          Get.snackbar("Error", decodedJson['message']);
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

  // Fetch My posts

  Future<List<MyPostModel>?> fetchMyPosts(String userId) async {
    try {
      final formData = dio.FormData.fromMap({
        'user_id': userId,
        'user_type': 0,
        'latitude': '75',
        'longitude': '65',
      });

      final response = await _dioInstance.post(
        '${ApiConstants.baseUrl}/get_my_posts',
        options: dio.Options(headers: ApiConstants.headers),
        data: formData,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = response.data is String
            ? jsonDecode(response.data) as Map<String, dynamic>
            : response.data as Map<String, dynamic>;
        if (decodedJson['status'] == true) {
          final List<MyPostModel> posts = (decodedJson['data'] as List)
              .map((item) => MyPostModel.fromJson(item))
              .toList();
          return posts;
        } else {
          log("Error: ${decodedJson['message']}");
          Get.snackbar("Error", decodedJson['message']);
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

  // Get user details
  Future<UserModel?> fetchContractorDetails(String userId) async {
    try {
      final formData = dio.FormData.fromMap({'user_id': userId});

      // Send request to fetch user details
      final response = await _dioInstance.post(
        '${ApiConstants.baseUrl}/get_labour_contractor_details',
        options: dio.Options(headers: ApiConstants.headers),
        data: formData,
      );

      if (response.statusCode == 200) {
        // Parse JSON response
        final data = jsonDecode(response.data);
        return UserModel.fromJson(
            data['data']); // Assuming 'data' contains user details
      } else {
        log("Server error: Status Code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      log("Exception in fetchContractorDetails: $e");
      return null;
    }
  }

  // Get banner Images

  Future<List<CarouselImageModel>?> fetchCarouselImages(String userId) async {
    try {
      final formData =
          dio.FormData.fromMap({'user_id': userId, 'user_type': '0'});

      // Send request to fetch user details
      final response = await _dioInstance.post(
        '${ApiConstants.baseUrl}/get_banners_list',
        options: dio.Options(headers: ApiConstants.headers),
        data: formData,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = response.data is String
            ? jsonDecode(response.data) as Map<String, dynamic>
            : response.data as Map<String, dynamic>;
        if (decodedJson['status'] == true) {
          final List<CarouselImageModel> images = (decodedJson['data'] as List)
              .map((item) => CarouselImageModel.fromJson(item))
              .toList();
          return images;
        } else {
          log("Error: ${decodedJson['message']}");
          Get.snackbar("Error", decodedJson['message']);
          return null;
        }
      } else {
        log("Server error: Status Code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      log("Exception in fetchContractorDetails: $e");
      return null;
    }
  }
}
