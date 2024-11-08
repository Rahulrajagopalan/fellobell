import 'package:flutter/material.dart';

class Constants {
  static EdgeInsets horizon20 =
      EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0);
  static EdgeInsets horizon10 = EdgeInsets.symmetric(horizontal: 10.0);
  static TextStyle customHeading =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  static TextStyle customDescription = TextStyle(fontSize: 15);
  static TextStyle customSubHeading = TextStyle(fontWeight: FontWeight.bold);
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

  static Text introDialogue = Text(
      textAlign: TextAlign.center,
      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to");

// Additional theme colors
  static Color primaryColor = Colors.blue;
  static Color accentColor = Colors.orange;
}
