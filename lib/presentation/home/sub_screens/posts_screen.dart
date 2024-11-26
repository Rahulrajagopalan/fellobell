import 'package:fello_bell_project/presentation/home/controller/home_controller.dart';
import 'package:fello_bell_project/presentation/widgets/my_post_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsScreen extends GetView<HomeController> {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: controller.allPosts.length,
          itemBuilder: (context, index) {
            final myposts = controller.allPosts[index];
            return PostSeeAll(postModel: myposts);
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 15,
          ),
        ),
      ),
    );
  }
}
