import 'package:fello_bell_project/core/theme/app_color_scheme.dart';
import 'package:fello_bell_project/presentation/home/controller/home_controller.dart';
import 'package:fello_bell_project/presentation/home/sub_screens/custom_carousel.dart';
import 'package:fello_bell_project/presentation/widgets/post_list_card.dart';
import 'package:fello_bell_project/presentation/widgets/section_header.dart';
import 'package:fello_bell_project/presentation/widgets/upgrade_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends GetView<HomeController> {
  const HomeBody({super.key});

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
              child: Obx(
                () {
                  var user = controller.userDetails.value;
                  if (user == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(user.userImage),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          Text(user.mobileNo,
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
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomCarousel(),
                  SizedBox(height: 10),
                  SectionHeader(title: 'Post List', onViewAll: () {}),
                  SizedBox(
                    height: 200,
                    child: Obx(() {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.myPosts.length,
                        itemBuilder: (context, index) {
                          final posts = controller.myPosts[index];
                          return PostListCard(myPostModel: posts);
                        },
                      );
                    }),
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
