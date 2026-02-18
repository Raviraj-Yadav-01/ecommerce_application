import 'package:ecommerce_application/screen/splash_page/splash_page.dart';
import 'package:flutter/material.dart';

import 'app_constraints/app_routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.mRoutes,
    );
  }
}

