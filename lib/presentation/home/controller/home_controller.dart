import 'dart:developer';

import 'package:fello_bell_project/domain/models/my_post_model.dart';
import 'package:fello_bell_project/domain/models/post_model.dart';
import 'package:fello_bell_project/domain/models/user_model.dart';
import 'package:get/get.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:fello_bell_project/core/utility.dart';

class HomeController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();

  var allPosts = <PostModel>[].obs;
  var myPosts = <MyPostModel>[].obs;
  var userDetails = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    loadPosts("332");
  }

  void loadPosts(String userId) {
    getAllPosts(userId);
    getMyPosts(userId);
    getContractorDetails(userId);
  }

  Future<void> getAllPosts(String userId) async {
    try {
      log("Loading all posts");
      final postResponse = await _apiService.fetchAllPosts(userId);

      if (postResponse != null && postResponse.isNotEmpty) {
        allPosts.value = postResponse;
      } else {
        Utility().errorMessage("No All posts found or an error occurred.");
      }
    } catch (e) {
      Utility().errorMessage("Failed to fetch All posts: $e");
    }
  }

  Future<void> getMyPosts(String userId) async {
    try {
      log("Loading my posts");
      final postResponse = await _apiService.fetchMyPosts(userId);

      if (postResponse != null && postResponse.isNotEmpty) {
        myPosts.value = postResponse;
      } else {
        Utility().errorMessage("No posts found or an error occurred.");
      }
    } catch (e) {
      Utility().errorMessage("Failed to fetch posts: $e");
    }
  }

  Future<void> getContractorDetails(String userId) async {
    try {
      log("Fetching contractor details for user ID: $userId");

      // Fetch details from API
      final contractorDetails =
          await _apiService.fetchContractorDetails(userId);

      if (contractorDetails != null) {
        userDetails.value = contractorDetails; // Update reactive variable
        log("Contractor details loaded successfully.");
      } else {
        Utility()
            .errorMessage("No contractor details found or an error occurred.");
      }
    } catch (e) {
      Utility().errorMessage("Failed to fetch contractor details: $e");
    }
  }
}
