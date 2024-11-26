import 'package:carousel_slider/carousel_slider.dart';
import 'package:fello_bell_project/presentation/home/controller/home_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomCarousel extends GetView<HomeController> {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: controller.carouselImages.map((image) {
        return Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(image.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(), // Convert the list to widgets
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
