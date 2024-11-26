import 'dart:developer';

import 'package:fello_bell_project/core/constants.dart';
import 'package:fello_bell_project/core/theme/app_color_scheme.dart';
import 'package:fello_bell_project/presentation/screens/home/add_post_screen.dart';
import 'package:fello_bell_project/presentation/screens/home/home_body.dart';
import 'package:fello_bell_project/presentation/screens/home/jobs_screen.dart';
import 'package:fello_bell_project/presentation/screens/home/posts_screen.dart';
import 'package:fello_bell_project/presentation/screens/home/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> navItems = [
      {'image': Constants.homeIcon, 'iconName': 'Home'},
      {'image': Constants.jobsIcon, 'iconName': 'Jobs'},
      {'image': Constants.addPostIcon, 'isSpecial': true},
      {'image': Constants.postsIcon, 'iconName': 'Post'},
      {'image': Constants.profileIcon, 'iconName': 'Profile'},
    ];
    final List<Widget> pages = [
      HomeBody(),
      JobsScreen(),
      AddPostScreen(),
      PostsScreen(),
      ProfileScreen()
    ];
    return Scaffold(
        backgroundColor: AppColorScheme.backgroundwhite,
        body: pages[currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: navItems.length,
                itemBuilder: (context, index) {
                  final item = navItems[index];
                  if (item.containsKey('isSpecial') &&
                      item['isSpecial'] == true) {
                    return Center(
                      child: GestureDetector(
                          onTap: () {
                            log("Add Post Clicked");
                          },
                          child: Image.asset(
                            item['image'],
                          )),
                    );
                  }
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100 / navItems.length),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            item['image'],
                            color: index == currentIndex
                                ? Colors.white
                                : Colors.grey,
                          ),
                          Text(
                            item['iconName'],
                            style: TextStyle(
                              color: index == currentIndex
                                  ? Colors.white
                                  : Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
