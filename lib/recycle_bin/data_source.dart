// import 'dart:convert';
// import 'package:get/get.dart';

// class HomeDataSource {
//   ApiService apiService = Get.find();
//   Future<MyPostListModel> getMyPostList(
//       {required String userId,
//       required String userType,
//       List<String>? statusId,
//       List<String>? jobCategoryId,
//       List<String>? landmarkId,
//       String? fromDate,
//       String? toDate,
//       String? searchId,
//       required String limit,
//       required String pageNumber,
//       bool? isHistory}) async {
//     Map<String, dynamic> body = {
//       "user_type": userType,
//       "user_id": userId,
//       "page_number": pageNumber,
//       "limit": limit
//     };
//     body.addIf(statusId?.isNotEmpty, "status_id", statusId ?? []);
//     body.addIf(landmarkId?.isNotEmpty, "landmark_id", landmarkId ?? []);
//     body.addIf(
//         jobCategoryId?.isNotEmpty, "job_category_id", jobCategoryId ?? []);
//     body.addIf(fromDate?.isNotEmpty, "from_date", fromDate ?? "");
//     body.addIf(toDate?.isNotEmpty, "to_date", toDate ?? "");
//     body.addIf(searchId?.isNotEmpty, "search_id", searchId ?? "");
//     body.addIf(isHistory, "is_history", isHistory);
//     try {
//       var response = await apiService.postData('get_my_posts', body);
//       if (response.statusCode == 200) {
//         return MyPostListModel.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Something went wrong');
//       }
//     } catch (e) {
//       throw Exception('Failed to perform request: $e');
//     }
//   }

//   Future<PostListModel> getPostList({
//     required String userId,
//     List<String>? statusId,
//     List<String>? jobCategoryId,
//     List<String>? landmarkId,
//     String? fromDate,
//     String? toDate,
//     String? searchId,
//     bool? myJobs,
//     required String limit,
//     required String pageNumber,
//     required String longitude,
//     required String latitude,
//   }) async {
//     Map<String, dynamic> body = {
//       "user_id": userId,
//       "page_number": pageNumber,
//       "limit": limit,
//       "longitude": longitude,
//       "latitude": latitude,
//     };
//     body.addIf(statusId?.isNotEmpty, "status_id", statusId ?? []);
//     body.addIf(landmarkId?.isNotEmpty, "landmark_id", landmarkId ?? []);
//     body.addIf(
//         jobCategoryId?.isNotEmpty, "job_category_id", jobCategoryId ?? []);
//     body.addIf(fromDate?.isNotEmpty, "from_date", fromDate ?? "");
//     body.addIf(toDate?.isNotEmpty, "to_date", toDate ?? "");
//     body.addIf(searchId?.isNotEmpty, "search_id", searchId ?? "");
//     body.addIf(myJobs != null, "my_jobs", myJobs);
//     try {
//       var response = await apiService.postData('get_all_posts', body);
//       if (response.statusCode == 200) {
//         return PostListModel.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Something went wrong');
//       }
//     } catch (e) {
//       throw Exception('Failed to perform request: $e');
//     }
//   }

//   Future<LabourContractorProfileModel> getLabourContractorProfile(
//       {required String userId}) async {
//     Map<String, String> body = {
//       "user_id": userId,
//     };
//     try {
//       var response =
//           await apiService.postData('get_labour_contractor_details', body);
//       if (response.statusCode == 200) {
//         return LabourContractorProfileModel.fromJson(
//             json.decode(response.body));
//       } else {
//         throw Exception('Something went wrong');
//       }
//     } catch (e) {
//       throw Exception('Failed to perform request111: $e');
//     }
//   }

//   Future<CustomerProfileModel> getCustomerProfile(
//       {required String userId}) async {
//     Map<String, String> body = {
//       "user_id": userId,
//     };
//     try {
//       var response = await apiService.postData('get_user_details', body);
//       if (response.statusCode == 200) {
//         return CustomerProfileModel.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Something went wrong');
//       }
//     } catch (e) {
//       throw Exception('Failed to perform request111: $e');
//     }
//   }

//   Future<HomePageDataModel> getHomePageData() async {
//     Map<String, String> body = {};
//     try {
//       var response = await apiService.postData('get_home_page_data', body);
//       if (response.statusCode == 200) {
//         return HomePageDataModel.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Something went wrong');
//       }
//     } catch (e) {
//       throw Exception('Failed to perform request111: $e');
//     }
//   }

//   Future<BannerListModel> getBannerListData(
//       {required userId,
//       required userType,
//       required districtId,
//       required landmarkId}) async {
//     Map<String, String> body = {
//       "user_id": userId,
//       "user_type": userType,
//       "district_id": districtId,
//       "landmark_id": landmarkId
//     };
//     try {
//       var response = await apiService.postData('get_banners_list', body);
//       if (response.statusCode == 200) {
//         return BannerListModel.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Something went wrong');
//       }
//     } catch (e) {
//       throw Exception('Failed to perform request111: $e');
//     }
//   }
// }
