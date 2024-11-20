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

  static const String notifyIconPath = 'assets/icon/appicon/notify.svg';
  static const String notifyPath = 'assets/icon/appicons/notification.png';
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
