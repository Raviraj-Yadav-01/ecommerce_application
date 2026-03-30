

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarousel extends StatefulWidget {
  final List<String> myUrls;
  const CustomCarousel({super.key, required this.myUrls});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;

  List<String> myUrls = [
    "https://cdn.acowebs.com/wp-content/uploads/2019/02/Impact-of-eCommerce-On-Society.png",
    "https://www.smarther.co/wp-content/uploads/2021/07/clothing-ecommerce-app-blog.jpg.webp",
    "https://sr-website.shiprocket.in/wp-content/uploads/2024/01/Top-10-ecommerce-website-for-clothes.webp",
    "https://sr-website.shiprocket.in/wp-content/uploads/2024/01/Top-10-ecommerce-website-for-clothes.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              /*boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 6),
                ),
              ],*/
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: CarouselSlider.builder(
                itemCount: myUrls.length,
                itemBuilder: (_, index, pageViewIndex) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    transform: Matrix4.identity() ..scale(_currentIndex == index ? 1.0 : 0.95),
                    transformAlignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      image: DecorationImage(
                        image: NetworkImage(myUrls[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 600),
                  autoPlayCurve: Curves.easeInOutCubic,
                  onPageChanged: (index, reason) {
                    setState(() => _currentIndex = index);
                  },
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate( myUrls.length, (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentIndex == index ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.amber : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}