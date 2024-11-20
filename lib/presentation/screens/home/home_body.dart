import 'package:fello_bell_project/core/theme/app_color_scheme.dart';
import 'package:fello_bell_project/presentation/custom_widgets/home_widgets/my_post_card.dart';
import 'package:fello_bell_project/presentation/custom_widgets/home_widgets/post_list_card.dart';
import 'package:fello_bell_project/presentation/custom_widgets/home_widgets/section_header.dart';
import 'package:fello_bell_project/presentation/custom_widgets/home_widgets/upgrade_container.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13,)),
                        ],
                      ),
                      Spacer(),
                      Image.asset('assets/images/notification.png',height: 20,)
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
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) => MyPostCard(),
                        ),
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