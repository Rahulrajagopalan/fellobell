import 'package:fello_bell_project/core/theme/app_color_scheme.dart';
import 'package:fello_bell_project/presentation/controller/home_controller.dart';
import 'package:fello_bell_project/presentation/custom_widgets/home_widgets/my_post_card.dart';
import 'package:fello_bell_project/presentation/custom_widgets/home_widgets/post_list_card.dart';
import 'package:fello_bell_project/presentation/custom_widgets/home_widgets/section_header.dart';
import 'package:fello_bell_project/presentation/custom_widgets/home_widgets/upgrade_container.dart';
import 'package:fello_bell_project/presentation/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

final homeController = Get.find<HomeController>();

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    homeController.fetchAndHandlePosts("1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              height: 180,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15)),
                  color: AppColorScheme.backgroundOrange),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage("assets/images/profile_picture.png"),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome, James',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      Text('887766554433',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          )),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/notification.png',
                    height: 20,
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SectionHeader(title: 'My Posts', onViewAll: () {}),
                  SizedBox(
                    height: 150,
                    child: Obx(() {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.posts.length,
                        itemBuilder: (context, index) {
                          final posts =
                              PostModel.fromJson(homeController.posts[index]);
                          return MyPostCard(postModel: posts);
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 10),
                  SectionHeader(title: 'Post List', onViewAll: () {}),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) => PostListCard(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 120,
          left: 30,
          child: UpgradeContainer(),
        ),
      ],
    );
  }
}
