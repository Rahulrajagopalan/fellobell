import 'package:flutter/widgets.dart';

const EdgeInsets horizon20 =
    EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0);
const EdgeInsets horizon10 =
    EdgeInsets.symmetric(horizontal: 10.0);
const TextStyle customHeading =
    TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
const TextStyle customDescription =
    TextStyle(fontSize: 15);
const TextStyle customSubHeading = TextStyle(fontWeight: FontWeight.bold);
const SizedBox h20 = SizedBox(
  height: 20,
);
const SizedBox h10 = SizedBox(
  height: 10,
);
Container appImage = Container(
  height: 250,
  width: 300,
  decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/images/images.jpg"))),
);

const Text introDialogue = Text(
    textAlign: TextAlign.center,
    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to");

    
