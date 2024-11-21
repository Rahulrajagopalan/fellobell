import 'package:flutter/material.dart';

class Constants {
  static EdgeInsets horizon20 =
      EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0);
  static EdgeInsets horizon10 = EdgeInsets.symmetric(horizontal: 10.0);
  static SizedBox h20 = SizedBox(
    height: 20,
  );
  static SizedBox h10 = SizedBox(
    height: 10,
  );
  static Container appImage = Container(
    height: 250,
    width: 300,
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/images.jpg"))),
  );


  // Icons in use

  static const String notifyIconPath = 'assets/images/notification.png';
  static const String homeIcon = 'assets/images/home.png';
  static const String jobsIcon = 'assets/images/jobs.png';
  static const String addPostIcon = 'assets/images/add_post.png';
  static const String postsIcon= 'assets/images/posts.png';
  static const String profileIcon= 'assets/images/profile.png';

  // static const String notifyIconPath = 'assets/icon/appicon/notify.svg';
  // static const String homeIconPath = 'assets/icon/appicon/home.svg';
  // static const String profileIconPath = 'assets/icon/appicon/profile.svg';

  static Widget svgIcon(String assetPath, {Color? color, String? label}) {
    // return SvgPicture.asset(
    //   assetPath,
    //   colorFilter:
    //       color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    //   semanticsLabel: label,
    // );
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(assetPath)),color: Colors.red
      ),
    );
  }
}
