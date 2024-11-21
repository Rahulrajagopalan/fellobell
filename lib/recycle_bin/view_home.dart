// import 'package:fello_bell_project/recycle_bin/controller_data.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ViewHome extends GetView<HomeController> {
//   const ViewHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(LocaleKeys.jobs.tr),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
//             child: Column(
//               children: [
//                 // Show a job category title if the user is not a customer
//                 !(Config.isCustomer) &&
//                         (controller.postListResponse?.data?.isNotEmpty ?? false)
//                     ? Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12, vertical: 6),
//                         child: CommonText(
//                           text: LocaleKeys.jobs.tr,
//                           textStyle: const TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                       )
//                     : const SizedBox.shrink(),

//                 // Display posts or jobs if user is not a customer
//                 !(Config.isCustomer)
//                     ? ListView.separated(
//                         shrinkWrap: true,
//                         controller: controller.scrollController,
//                         physics: const NeverScrollableScrollPhysics(),
//                         scrollDirection: Axis.vertical,
//                         itemCount: controller.isLoading.value
//                             ? 2
//                             : (controller.postListResponse?.data?.length ??
//                                         0) >=
//                                     2
//                                 ? 2
//                                 : controller.postListResponse?.data?.length ??
//                                     0,
//                         itemBuilder: (BuildContext context, int index) {
//                           final post =
//                               controller.postListResponse?.data?[index];
//                           return Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 8.0, right: 8.0, bottom: 4.0),
//                             child: InkWell(
//                               onTap: () {
//                                 controller.pauseVideo();
//                                 Get.toNamed(Routes.JOB_DETAILS, arguments: {
//                                   'status': ((post?.isApplied ?? false) &&
//                                           (post?.isApproved ?? false))
//                                       ? 2
//                                       : 1,
//                                   "postId": post?.id?.toString() ?? "",
//                                 });
//                               },
//                               child: JobListItemWidget(
//                                 image: post?.userImage ?? "",
//                                 jobTitle: post?.jobCategory ?? "",
//                                 place: post?.landmark ?? "",
//                                 id: post?.jobId?.toString() ?? "",
//                                 name: post?.name ?? "",
//                                 labourNo: post?.noOfLabours?.toInt() ?? 0,
//                                 startDate: post?.jobStartDate ?? "",
//                                 endDate: post?.jobEndDate ?? "",
//                                 status: post?.jobStatus == 'started'
//                                     ? LocaleKeys.started.tr
//                                     : post?.jobStatus == 'unavailable'
//                                         ? LocaleKeys.unavailable.tr
//                                         : post?.jobStatus == 'rejected'
//                                             ? LocaleKeys.rejected.tr
//                                             : post?.isApproved ?? false
//                                                 ? LocaleKeys.accepted.tr
//                                                 : post?.isApplied ?? false
//                                                     ? LocaleKeys.requested.tr
//                                                     : post?.postStatus ?? "",
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (BuildContext context, int index) {
//                           return const SizedBox(height: 10);
//                         },
//                       )
//                     : const SizedBox.shrink(),

//                 const SizedBox(height: 10),

//                 // Show a shimmer effect while loading
//                 controller.isLoading.value
//                     ? Shimmer.fromColors(
//                         baseColor: Colors.grey,
//                         highlightColor: Colors.white,
//                         child: Padding(
//                           padding:
//                               const EdgeInsets.only(left: 10.0, right: 10.0),
//                           child: Container(
//                             color: Colors.grey,
//                             height: 500,
//                           ),
//                         ),
//                       )
//                     : Padding(
//                         padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                         child: controller.homePageResponse?.data?.videosList !=
//                                     null &&
//                                 controller.homePageResponse!.data!.videosList!
//                                     .isNotEmpty
//                             ? ClipRRect(
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: Container(
//                                   color: Colors.white,
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       ClipRRect(
//                                         borderRadius: BorderRadius.circular(5),
//                                         child: controller
//                                                     .youtubePlayerController !=
//                                                 null
//                                             ? YoutubePlayer(
//                                                 controller: controller
//                                                     .youtubePlayerController!,
//                                                 showVideoProgressIndicator:
//                                                     true,
//                                                 progressIndicatorColor:
//                                                     Colors.grey,
//                                               )
//                                             : YoutubePlayer(
//                                                 controller:
//                                                     YoutubePlayerController(
//                                                   initialVideoId: '',
//                                                   flags:
//                                                       const YoutubePlayerFlags(
//                                                           autoPlay: false),
//                                                 ),
//                                                 showVideoProgressIndicator:
//                                                     true,
//                                               ),
//                                       ),
//                                       ElevatedButton(
//                                         onPressed: () {
//                                           controller.loadNewVideo(controller
//                                               .homePageResponse!
//                                               .data!
//                                               .videosList!
//                                               .first);
//                                         },
//                                         child: const Text(
//                                           'Load New Video',
//                                           style: TextStyle(color: Colors.white),
//                                         ),
//                                       ),
//                                       const SizedBox(height: 10)
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             : const SizedBox.shrink(),
//                       ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//     ;
//   }
// }
