import 'package:fello_bell_project/presentation/controller/home_controller.dart';
import 'package:fello_bell_project/presentation/custom_widgets/home_widgets/custom_navigation.dart';
import 'package:fello_bell_project/presentation/custom_widgets/home_widgets/post_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobsScreen extends StatelessWidget {
  JobsScreen({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleName: "Jobs"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: homeController.myPosts.length,
            itemBuilder: (context, index) {
              final posts = homeController.myPosts[index];
              return PostListCard(myPostModel: posts);
            },
            separatorBuilder: (context, index) => SizedBox(height: 15,),
          );
        }),
      ),
    );
  }
}
