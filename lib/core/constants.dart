import 'package:flutter/widgets.dart';

const EdgeInsets customPadding =
    EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0);
const TextStyle customHeading =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const TextStyle customSubHeading = TextStyle(fontWeight: FontWeight.bold);
const SizedBox smallSizing = SizedBox(
  height: 20,
);
Container appImage = Container(
  height: 250,
  width: 300,
  decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/images/images.jpg"))),
);

const Text introDialogue = Text(
    textAlign: TextAlign.center,
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to");
