
// import 'package:fello_bell_project/recycle_bin/data_source.dart';

// class HomeRepo {
//   HomeDataSource homeDataSource = HomeDataSource();
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
//     return homeDataSource.getMyPostList(
//         userId: userId,
//         userType: userType,
//         statusId: statusId,
//         landmarkId: landmarkId,
//         jobCategoryId: jobCategoryId,
//         fromDate: fromDate,
//         toDate: toDate,
//         searchId: searchId,
//         limit: limit,
//         pageNumber: pageNumber,
//         isHistory: isHistory);
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
//     return homeDataSource.getPostList(
//         userId: userId,
//         statusId: statusId,
//         landmarkId: landmarkId,
//         jobCategoryId: jobCategoryId,
//         fromDate: fromDate,
//         toDate: toDate,
//         searchId: searchId,
//         latitude: latitude,
//         longitude: longitude,
//         myJobs: myJobs,
//         limit: limit,
//         pageNumber: pageNumber);
//   }

//   Future<LabourContractorProfileModel> getLabourContractorProfile(
//       {required String userId}) async {
//     return homeDataSource.getLabourContractorProfile(userId: userId);
//   }

//   Future<CustomerProfileModel> getCustomerProfile(
//       {required String userId}) async {
//     return homeDataSource.getCustomerProfile(userId: userId);
//   }

//   Future<HomePageDataModel> getHomePageData() async {
//     return homeDataSource.getHomePageData();
//   }

//   Future<BannerListModel> getBannerListData(
//       {required String userId,
//       required String userType,
//       required String landmarkId,
//       required String districtId}) async {
//     return homeDataSource.getBannerListData(
//       userId: userId,
//       userType: userType,
//       districtId: districtId,
//       landmarkId: landmarkId,
//     );
//   }
// }
