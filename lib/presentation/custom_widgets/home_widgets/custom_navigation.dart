import 'dart:developer';

import 'package:flutter/material.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({super.key});

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> navItems = [
      {'image': 'assets/images/home.png', 'iconName': 'Home'},
      {'image': 'assets/images/jobs.png', 'iconName': 'Jobs'},
      {'image': 'assets/images/add_post.png', 'isSpecial': true},
      {'image': 'assets/images/posts.png', 'iconName': 'Post'},
      {'image': 'assets/images/profile.png', 'iconName': 'Profile'},
    ];

    return Container(
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
            if (item.containsKey('isSpecial') && item['isSpecial'] == true) {
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
              padding: EdgeInsets.symmetric(horizontal: 100 / navItems.length),
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
                      color: index == currentIndex ? Colors.white : Colors.grey,
                    ),
                    Text(
                      item['iconName'],
                      style: TextStyle(
                        color:
                            index == currentIndex ? Colors.white : Colors.grey,
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
    );
  }
}

class CustomAppBar extends AppBar {
  String titleName;
  CustomAppBar({super.key, required this.titleName});

  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.white,
      backgroundColor: Colors.white,
      title: Text(
        titleName,
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
