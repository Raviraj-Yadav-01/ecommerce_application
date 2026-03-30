import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/features/dashboard/bloc/cat_event.dart';
import 'package:ecommerce_application/features/dashboard/bloc/cat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_carousel.dart';
import '../bloc/cat_bloc.dart';

class HomeNavPage extends StatefulWidget {
  const HomeNavPage({super.key});

  @override
  State<HomeNavPage> createState() => _HomePageState();
}

class _HomePageState extends State<HomeNavPage> {
  double value = 70;

  List<String> myUrls = [
    "https://cdn.acowebs.com/wp-content/uploads/2019/02/Impact-of-eCommerce-On-Society.png",
    "https://www.smarther.co/wp-content/uploads/2021/07/clothing-ecommerce-app-blog.jpg.webp",
    "https://sr-website.shiprocket.in/wp-content/uploads/2024/01/Top-10-ecommerce-website-for-clothes.webp",
    "https://sr-website.shiprocket.in/wp-content/uploads/2024/01/Top-10-ecommerce-website-for-clothes.webp",
  ];

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(GetCategoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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

            ///Corousel Slider
            CustomCarousel(myUrls: myUrls),
            SizedBox(height: 11),

            SizedBox(
              height: 110,
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is CategoryErrorState) {
                    return Center(child: Text(state.errorMsg));
                  }

                  if (state is CategoryLoadedState) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.mCat.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://cdn.jhattse.com/resize?width=384&file=images/category/electronics.png&quality=75&type=webp",
                                ),
                                radius: 35,
                              ),

                              SizedBox(height: 5),

                              Text(state.mCat[index].name ?? ""),
                            ],
                          ),
                        );
                      },
                    );
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
