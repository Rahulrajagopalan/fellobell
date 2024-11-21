import 'dart:developer';

import 'package:get/get.dart';
import 'package:fello_bell_project/infrastructure/services/api_service.dart';
import 'package:fello_bell_project/core/utility.dart';

class HomeController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();

  var posts = <dynamic>[].obs;

  Future<void> fetchAndHandlePosts(String userId) async {
    try {
      log("Loading Posts");
      final postResponse = await _apiService.fetchPosts(userId);

      if (postResponse != null && postResponse.data.isNotEmpty) {
        posts.value = postResponse.data;
        Utility().successMessage("Posts fetched successfully!");
      } else {
        Utility().errorMessage("No posts found or an error occurred.");
      }
    } catch (e) {
      Utility().errorMessage("Failed to fetch posts: $e");
    }
  }
}
