import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(25),
                    // shape:BoxShape.circle
                  ),
                  child: Icon(Icons.grid_view_rounded, color: Colors.white),
                ),

                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(25),
                    // shape:BoxShape.circle
                  ),
                  child: Icon(Icons.notifications_none, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 11),

            //Text Field for searching products
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                hintText: "Search...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.tune),
              ),
            ),
            SizedBox(height: 11),

            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(21),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 100,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items:
                    [
                      "assets/images/Article_e-com_sep-1.jpg",
                      "assets/images/best-wireless-gaming-headphones-in-india-2024best-wireless-gaming-headphones-in-india-2024_1200x.webp",
                      "assets/images/coffee_machines.webp",
                      "assets/images/cuisinart_banner_website.webp",
                      "assets/images/g3_ferrari_banner_2.webp",
                      "assets/images/shopping.webp",
                      "assets/images/speakers.webp",
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(i, fit: BoxFit.fill),
                            ),
                          );
                        },
                      );
                    }).toList(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
