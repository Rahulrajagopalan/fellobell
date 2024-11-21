// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// class HomeController extends GetxController {
//   // Observables
//   RxBool isLabour = false.obs;
//   RxList<num> selectedLocationList = List<int>.empty(growable: true).obs;
//   RxList<num> selectedCategoryList = List<int>.empty(growable: true).obs;
//   RxList<int> selectedStatusList = List<int>.empty(growable: true).obs;
//   RxString startDate = "".obs;
//   RxString endDate = "".obs;
//   RxString startDateError = "".obs;
//   RxString endDateError = "".obs;
//   RxBool isLoading = false.obs;
//   RxInt selectedIndexOnLeft = 0.obs;
//   RxBool isLoadingMore = false.obs;
//   RxBool isHaveAllData = false.obs;

//   // Controllers and dependencies
//   final TextEditingController searchTextController = TextEditingController();
//   YoutubePlayerController? youtubePlayerController;
//   final ScrollController scrollController = ScrollController();

//   // Repositories
//   final HomeRepo homeRepo = HomeRepo();
//   final RegistrationRepo registrationRepo = RegistrationRepo();
//   final AppStorage appStorage = AppStorage();

//   // Data models
//   MyPostListModel? myPostListResponse;
//   PostListModel? postListResponse;
//   LabourContractorProfileModel? labourContractorProfileResponse;
//   CustomerProfileModel? customerProfileResponse;
//   MyPostListModel? myPostListResponseForPagination;
//   HomePageDataModel? homePageResponse;
//   BannerListModel? bannerListResponse;
//   GetSkillResponse? getSkillResponse;
//   GetLandmarkResponse? getLandmarkResponse;

//   // Miscellaneous
//   List<String> leftSideFilterList = ["Location", "Category", "Date", "Status"];
//   List<String> status = ["Active", "New", "Started"];
//   List<CategoryList>? categoryList;
//   List<String>? videosList;
//   String userId = '';
//   String landmarkId = '';
//   String districtId = '';
//   int pageNo = 0;

//   @override
//   Future<void> onInit() async {
//     super.onInit();

//     // Handle notification permissions
//     await _requestNotificationPermission();

//     // Set up scroll listener for pagination (for customer users)
//     if (Config.isCustomer) {
//       _setupScrollListener();
//     }

//     // Initialize user data and dependencies
//     Get.put(NotificationController());
//     userId = appStorage.getUserId();
//     print("User ID: $userId");
//     await _initializeData();

//     // Set up YouTube player
//     if (homePageResponse?.data?.videosList?.isNotEmpty ?? false) {
//       _initializeYoutubePlayer();
//     }
//   }

//   @override
//   void onClose() {
//     youtubePlayerController?.dispose();
//     super.onClose();
//   }

//   Future<void> _requestNotificationPermission() async {
//     final status = await Permission.notification.request();
//     if (!status.isGranted && Platform.isAndroid) {
//       await Utility.showAlert(
//         title: LocaleKeys.alert.tr,
//         content: LocaleKeys.notification_alert_message.tr,
//         hasCancel: false,
//         confirmText: LocaleKeys.ok.tr,
//         onConfirm: () {
//           openAppSettings();
//           Get.close(1);
//         },
//       );
//     }
//   }

//   void _setupScrollListener() {
//     scrollController.addListener(() {
//       if (!isHaveAllData.value &&
//           scrollController.position.pixels == scrollController.position.maxScrollExtent &&
//           !isLoadingMore.value) {
//         pageNo++;
//         isLoadingMore(true);
//         _loadPaginatedData();
//       }
//     });
//   }

//   Future<void> _initializeData() async {
//     await getLandmark();
//     await getSkill();
//     isLoading(true);

//     if (Config.isCustomer) {
//       await _loadCustomerData();
//     } else if (Config.isContractor) {
//       await _loadContractorData();
//     } else {
//       await _loadDefaultData();
//     }

//     isLoading(false);
//     _handleInitialNotification();
//   }

//   void _initializeYoutubePlayer() {
//     youtubePlayerController = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(homePageResponse!.data!.videosList!.first)!,
//       flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
//     );
//   }

//   void loadNewVideo(String url) {
//     String? videoId = YoutubePlayer.convertUrlToId(url);
//     if (videoId != null) {
//       youtubePlayerController?.load(videoId);
//     }
//   }

//   Future<void> _handleInitialNotification() async {
//     isLoading(true);
//     RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null) {
//       _navigateBasedOnNotification(initialMessage.data);
//     }
//     isLoading(false);
//   }

//   void _navigateBasedOnNotification(Map<String, dynamic> payload) {
//     String? title = payload['title'];
//     String? postId = payload['job_id'];

//     switch (title) {
//       case "Job Request":
//       case "Job Started":
//       case "Job Completed":
//       case "User Unavailability":
//         Get.toNamed(Routes.POST_DETAILS, arguments: {'postId': postId});
//         break;
//       case "Job Accepted":
//       case "Job Rejected":
//         Get.toNamed(Routes.JOB_DETAILS, arguments: {'status': 1, 'postId': postId});
//         break;
//       default:
//         print("Unhandled notification title: $title");
//     }
//   }

//   Future<void> _loadPaginatedData() async {
//     await getMyPostLists();
//     await getHomePageData();
//     await getBannerListData();
//     isLoadingMore(false);
//   }

//   Future<void> _loadCustomerData() async {
//     Get.put(PostController());
//     await getHomePageData();
//     await getBannerListData();
//     await getCustomerProfile();
//     await getMyPostLists();
//   }

//   Future<void> _loadContractorData() async {
//     Get.put(JobController());
//     Get.put(PostController());
//     await getHomePageData();
//     await getBannerListData();
//     await getLabourContractorProfile();
//     await getPostLists();
//     await getMyPostLists();
//   }

//   Future<void> _loadDefaultData() async {
//     Get.put(JobController());
//     await getHomePageData();
//     await getBannerListData();
//     await getLabourContractorProfile();
//     await getPostLists();
//   }

//   // API calls
//   Future<void> getMyPostLists() async {
//     // Implementation for fetching MyPostLists...
//   }

//   Future<void> getPostLists() async {
//     // Implementation for fetching PostLists...
//   }

//   Future<void> getHomePageData() async {
//     // Implementation for fetching HomePageData...
//   }

//   Future<void> getBannerListData() async {
//     // Implementation for fetching BannerListData...
//   }

//   Future<void> getLabourContractorProfile() async {
//     // Implementation for fetching LabourContractorProfile...
//   }

//   Future<void> getCustomerProfile() async {
//     // Implementation for fetching CustomerProfile...
//   }

//   Future<void> getSkill() async {
//     // Implementation for fetching Skills...
//   }

//   Future<void> getLandmark() async {
//     // Implementation for fetching Landmarks...
//   }

//   void clearImageCache() {
//     PaintingBinding.instance.imageCache.clear();
//     PaintingBinding.instance.imageCache.clearLiveImages();
//   }
// }
