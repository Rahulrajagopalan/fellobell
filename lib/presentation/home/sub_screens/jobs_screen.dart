import 'package:fello_bell_project/presentation/home/controller/home_controller.dart';
import 'package:fello_bell_project/presentation/widgets/post_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobsScreen extends GetView<HomeController> {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: controller.myPosts.length,
          itemBuilder: (context, index) {
            final posts = controller.myPosts[index];
            return PostListCard(myPostModel: posts);
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 15,
          ),
        ),
      ),
    );
  }
}
