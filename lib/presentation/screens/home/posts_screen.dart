import 'package:fello_bell_project/presentation/controller/home_controller.dart';
import 'package:fello_bell_project/presentation/custom_widgets/home_widgets/custom_navigation.dart';
import 'package:fello_bell_project/presentation/custom_widgets/home_widgets/my_post_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleName: "Posts"),
      body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return ListView.separated(
          itemCount: homeController.allPosts.length,
          itemBuilder: (context, index) {
            final myposts = homeController.allPosts[index];
            return MyPostCard(postModel: myposts);
          },
          separatorBuilder: (context, index) => SizedBox(height: 15,),
        );
      }),
    ),
    );
  }
}
